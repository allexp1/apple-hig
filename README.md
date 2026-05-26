# apple-hig

**An [Agent Skill](https://www.anthropic.com/news/skills) that teaches Claude not just Apple's design *rules*, but the design *philosophy* and *cognitive psychology* beneath them — so it can reason about good design from first principles and apply it to any human/machine interface, not only iOS.**

---

## The idea

Most design references are lists of rules: 44pt tap targets, no more than five tabs, fill the tab-bar icons. Useful, but shallow — copy the rules onto a surface they weren't written for (a car dashboard, a voice assistant, a kiosk, an AI agent) and they fit badly, because you've taken the *shape* without the *reasoning*.

Apple's rules are **instances**: a deeper philosophy and a body of cognitive psychology, applied to one medium (Apple touchscreens and pointers). On a different medium the instances change, but the roots don't.

So this skill is built around one move: **derive, don't copy.** It never asks "what's the Apple component for this?" on a non-Apple surface. It asks:

> *What do clarity, deference, honesty, subtraction, and the relevant cognitive laws demand **here**, given this medium and context?*

That makes the knowledge **generative** instead of memorized. Claude can defend a design decision, resolve conflicts between guidelines by returning to first principles, and design for interfaces Apple never wrote a guideline for.

## Three layers: the why, the what, and the method

| Layer | Files | What it gives you |
|---|---|---|
| **The why — values** | `references/philosophy.md` | The worldview: *design is how it works* (Jobs), the Bauhaus → Dieter Rams → Apple lineage, simplicity-as-subtraction, deference, honesty, coherence, craft, accessibility/defaults as ethics — and how the three pillars descend from all of it. |
| **The why — cognition** | `references/psychology.md` | The cognitive science that explains *why the rules work*: Fitts, Hick, Miller, Jakob, Doherty, Gestalt, Von Restorff, serial position, aesthetic-usability, mental models, affordances/signifiers, error theory, recognition-over-recall, goal-gradient, peak-end, emotional design, attention, trust. Each entry: **principle → the rule it explains → how to apply it (incl. beyond screens) → how you know you got it right.** |
| **The method** | `references/applying.md` | Turns the why into a repeatable process: a 7-step first-principles design loop, a table translating each pillar across modalities (touch, pointer, voice, physical, automotive, AI/agent), worked derivations (screen, voice guide, kiosk, AI agent), and a deeper review lens that catches *reasoning* failures, not just mechanical ones. |
| **The what — specs** | `references/foundations.md`, `liquid-glass.md`, `components.md`, `patterns.md`, `platforms.md`, `accessibility.md` | The concrete rules: typography & Dynamic Type, color & Dark Mode, SF Symbols, materials, motion, layout & hit targets, app icons, the current **Liquid Glass** design language (iOS 26 / macOS Tahoe 26), components, interaction patterns, per-platform conventions, and accessibility. |
| **The router** | `SKILL.md` | The entry point Claude reads first: the compressed principles, when to load which reference file, the Liquid Glass essentials, and a review checklist. |

## What's inside

```
apple-hig/
├── SKILL.md                    # entry point: principles, routing, checklist
└── references/
    ├── philosophy.md           # the worldview (why)
    ├── psychology.md           # the cognitive science (why)
    ├── applying.md             # the generative method (how) — incl. non-screen interfaces
    ├── foundations.md          # type, color, SF Symbols, materials, motion, layout, icons
    ├── liquid-glass.md         # the 2025+ design language in depth (APIs, adoption, a11y)
    ├── components.md           # tab bars, nav, toolbars, sheets, alerts, buttons, modality
    ├── patterns.md             # onboarding, loading, feedback, search, settings, data entry
    ├── platforms.md            # iOS, iPadOS, macOS, watchOS, tvOS, visionOS — adapt, don't replicate
    └── accessibility.md        # VoiceOver, Dynamic Type, contrast, Reduce Motion, inclusion
```

## Install (Claude Code)

In current Claude Code, a skill's folder name **is** its slash command — installing `apple-hig/` gives you `/apple-hig` automatically. Skills in `~/.claude/skills` or a project's `.claude/skills` activate immediately (no restart needed).

**Global (available in every project):**

```bash
git clone https://github.com/allexp1/apple-hig.git
mkdir -p ~/.claude/skills
cp -r apple-hig/apple-hig ~/.claude/skills/
```

**Per-project (scoped to one repo):**

```bash
mkdir -p .claude/skills
cp -r /path/to/apple-hig/apple-hig .claude/skills/
```

Or run the helper from the repo root:

```bash
./install.sh            # installs to ~/.claude/skills
./install.sh --project  # installs to ./.claude/skills
```

**From the packaged artifact** (`dist/apple-hig.skill` is just a zip):

```bash
unzip dist/apple-hig.skill -d ~/.claude/skills/
```

> The `.skill` file is also what you'd upload in the Claude apps (Settings → Capabilities → Skills) if you want it there too.

## Usage

Once installed, either:

- **Invoke explicitly:** type `/apple-hig` and describe what you want.
- **Let it auto-trigger:** just describe a design task and Claude loads the skill when it's relevant. (Auto-triggering is probabilistic — installation doesn't guarantee invocation, so `/apple-hig` is the reliable lever when you want to force it.)

Example prompts:

- "Review this SwiftUI screen against the HIG and tell me what's wrong and why."
- "Design the onboarding for an iOS app that does X. Justify each decision from first principles."
- "What's the philosophy behind Apple's deference principle, and how would it apply to a voice interface?"
- "Design a self-serve kiosk the way Apple would reason about it — derive it, don't copy iOS."
- "Make this web component feel native to Apple platforms (Liquid Glass era)."

## A taste of "derive, don't copy"

The same roots produce different shapes per medium. For example, **Fitts's Law** (time to hit a target depends on its size and distance):

- **Touchscreen** → 44pt minimum target; primary action within thumb reach; screen edges/corners are "infinite" targets.
- **Voice** → "distance" becomes *number of utterances to the goal* — shorten the path to the common action.
- **AI agent** → "distance" becomes *number of turns/corrections to the intended result* — minimize friction to the common outcome.

And **deference** (the interface serves the goal and otherwise disappears):

- **Screen** → minimal chrome, content edge-to-edge.
- **Voice** → say only what's needed; brevity *is* deference; don't narrate the system talking about itself.
- **Automotive** → the UI never competes with the road — here deference is literally safety.
- **AI agent** → leverage, not a chatty companion to manage; don't over-confirm or over-explain.

`references/applying.md` carries these all the way to full worked derivations.

## How it was built, and an honesty note

- The **rules** are an independent synthesis of Apple's publicly documented Human Interface Guidelines and Design resources — paraphrased, never reproduced verbatim. Apple's live HIG is the authoritative, evolving source of truth; every reference file ends with direct links back to it.
- The **philosophy lineage** (Bauhaus, Dieter Rams, Don Norman) is *interpretation* — the intellectual substrate Apple openly draws on (Jony Ive has repeatedly named Rams as a touchstone), not text Apple publishes in the HIG. `philosophy.md` flags this explicitly. The point is to make the rules generative, not to put words in Apple's mouth.
- The **psychology** maps well-established cognitive principles (Laws of UX, Norman, Nielsen Norman Group) to the guidance they explain. Apple generally doesn't cite these by name; the connections are the contribution.
- The HIG is **living** — re-check Apple's *What's New* and component pages rather than treating any snapshot as permanent.

## Caveats

- This is a reference and reasoning aid, not a substitute for reading Apple's HIG, testing with real users, or shipping accessible software.
- Auto-triggering is probabilistic.
- "Apple-grade" is a direction, not a guarantee — the skill makes Claude reason the right way; taste and testing still matter.

## License & trademarks

- Code and original written content: **MIT** — see [`LICENSE`](LICENSE).
- **Apple**, the Apple logo, **iOS**, **iPadOS**, **macOS**, **watchOS**, **tvOS**, **visionOS**, **SF Symbols**, **San Francisco**, and **Liquid Glass** are trademarks of **Apple Inc.** This project is **independent and unaffiliated** with Apple and is not endorsed by Apple. See [`NOTICE`](NOTICE).

## Contributing

Issues and PRs welcome — see [`CONTRIBUTING.md`](CONTRIBUTING.md). Especially valuable: corrections when Apple updates the HIG, and new worked derivations for additional modalities.

## Key references (Apple)

- Apple Design: https://developer.apple.com/design/
- Human Interface Guidelines: https://developer.apple.com/design/human-interface-guidelines
- Adopting Liquid Glass: https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass
- Apple Design Resources: https://developer.apple.com/design/resources/
- SF Symbols: https://developer.apple.com/sf-symbols/

And for the *why*: Dieter Rams' ten principles (Vitsœ), Don Norman's *The Design of Everyday Things*, and Jon Yablonski's *Laws of UX* — all linked inside the reference files.
