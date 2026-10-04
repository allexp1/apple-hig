#!/usr/bin/env python3
"""Run an npm command that needs two-factor approval when there is no terminal.

    python3 scripts/npm_approve.py npm publish --access public

With two-factor auth on, npm offers approval in the browser only when it runs
on a terminal; from an agent shell or a script it stops with EOTP. This runs
the command on a pseudo-terminal, opens the approval page npm prints, and
waits while npm picks up the approval and finishes.

Environment:
    NPM_APPROVE_TIMEOUT     seconds to wait for the approval (default 300)
    NPM_APPROVE_NO_BROWSER  set to 1 to print the link without opening it
"""

import os
import pty
import re
import select
import signal
import sys
import time
import webbrowser

APPROVAL_URL = re.compile(rb"https://www\.npmjs\.com/auth/cli/[0-9a-fA-F-]{36}")
# npm falls back to asking for a typed code when the registry offers no
# approval page. Nobody is there to type it, so stop instead of hanging.
TYPED_CODE_PROMPT = b"Enter OTP"


def main(argv):
    if not argv:
        print(__doc__, file=sys.stderr)
        return 2

    timeout = float(os.environ.get("NPM_APPROVE_TIMEOUT", "300"))
    open_browser = os.environ.get("NPM_APPROVE_NO_BROWSER") != "1"

    pid, master = pty.fork()
    if pid == 0:
        os.execvp(argv[0], argv)

    seen = b""
    opened = False
    stopped = ""
    deadline = time.monotonic() + timeout

    while True:
        remaining = deadline - time.monotonic()
        if remaining <= 0:
            stopped = f"no approval after {int(timeout)} seconds"
            break
        ready, _, _ = select.select([master], [], [], min(remaining, 1.0))
        if not ready:
            continue
        try:
            data = os.read(master, 4096)
        except OSError:
            data = b""
        if not data:
            break  # the command closed its terminal: it has finished
        sys.stdout.buffer.write(data)
        sys.stdout.buffer.flush()
        seen = (seen + data)[-8192:]

        if not opened:
            match = APPROVAL_URL.search(seen)
            if match:
                opened = True
                url = match.group().decode()
                if open_browser:
                    webbrowser.open(url)
                    note = "Opened npm's approval page in your browser. Approve it there."
                else:
                    note = f"Open this page and approve it: {url}"
                print(f"\n\n{note}\n", file=sys.stderr, flush=True)

        if TYPED_CODE_PROMPT in seen:
            stopped = "npm asked for a typed one-time password"
            break

    if stopped:
        try:
            os.kill(pid, signal.SIGTERM)
        except ProcessLookupError:
            pass

    _, status = os.waitpid(pid, 0)
    if stopped:
        print(f"\nStopped: {stopped}.", file=sys.stderr)
        return 1
    if os.WIFEXITED(status):
        return os.WEXITSTATUS(status)
    return 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
