# apple-hig

**An [Agent Skill](https://www.anthropic.com/news/skills) that teaches Claude not just Apple's design *rules*, but the design *philosophy* and *cognitive psychology* beneath them — so it can reason about good design from first principles and apply it to any human/machine interface, not only iOS.**

**Version 2.0.0** · current to **iOS 27** (released September 14, 2026), the HIG's June and September 2026 updates, and **iPhone Duo** (iOS 27.1) · [Changelog](CHANGELOG.md)

```bash
npx github:allexp1/apple-hig
```

---

## What's new in 2.0

- **Apple's eight 2026 design principles** (purpose, agency, responsibility, familiarity, flexibility, simplicity, craft, delight), mapped to the classic clarity / deference / depth and to the lineage behind them.
- **Liquid Glass, year two (iOS 27).** People now set the look of the material with a slider, so a design has to hold from nearly clear to fully tinted. The compatibility opt-out is gone in the 27 SDKs.
- **iPhone Duo.** A full reference for the folding iPhone: two displays, poses and size classes, vertical controls, reserved regions, arrangement views, Split View, the adoption APIs, and a 14-item review checklist.
- **2026 component guidance.** Tab bars (no overflow tabs), toolbars, search placement, sidebars (tab bar first), menu icons, scroll edge effects, layout by size class.
- **Generative AI, Siri AI, and snippets.**
- **A `.living/` sidecar** that keeps the perishable facts (OS versions, HIG changes, device specs) current between releases.
- **A one-command installer** that backs up the previous install.

Three pieces of 1.0 advice were wrong by 2026 and are corrected: the More tab, sidebar-first on iPad, and the SF Symbols count. Details in the [changelog](CHANGELOG.md).

## The idea

Most design references are lists of rules: 44pt tap targets, no more than five tabs, fill the tab-bar icons. Useful, but shallow — copy the rules onto a surface they weren't written for (a car dashboard, a voice assistant, a kiosk, an AI agent) and they fit badly, because you've taken the *shape* without the *reasoning*.

Apple's rules are **instances**: a deeper philosophy and a body of cognitive psychology, applied to one medium (Apple touchscreens and pointers). On a different medium the instances change, but the roots don't.

So this skill is built around one move: **derive, don't copy.** It never asks "what's the Apple component for this?" on a non-Apple surface. It asks:

> *What do clarity, deference, honesty, subtraction, and the relevant cognitive laws demand **here**, given this medium and context?*

That makes the knowledge **generative** instead of memorized. Claude can defend a design decision, resolve conflicts between guidelines by returning to first principles, and design for interfaces Apple never wrote a guideline for.

iPhone Duo is the proof in Apple's own hardware: a phone whose screen changes size in your hand can't be designed from a table of device dimensions, only from principles. Apple removed those tables from the HIG in the same update.

## Three layers: the why, the what, and the method

| Layer | Files | What it gives you |
|---|---|---|
| **The why — values** | `references/philosophy.md` | The worldview: *design is how it works* (Jobs), the Bauhaus → Dieter Rams → Apple lineage, simplicity-as-subtraction, deference, honesty, coherence, craft, accessibility/defaults as ethics, how the three pillars descend from all of it, and **Apple's eight 2026 design principles** with where each one comes from. |
| **The why — cognition** | `references/psychology.md` | The cognitive science that explains *why the rules work*: Fitts, Hick, Miller, Jakob, Doherty, Gestalt, Von Restorff, serial position, aesthetic-usability, mental models, affordances/signifiers, error theory, recognition-over-recall, goal-gradient, peak-end, emotional design, attention, trust. Each entry: **principle → the rule it explains → how to apply it (incl. beyond screens) → how you know you got it right.** |
| **The method** | `references/applying.md` | Turns the why into a repeatable process: a 7-step first-principles design loop, a table translating each pillar across modalities (touch, pointer, voice, physical, automotive, AI/agent), worked derivations (screen, voice guide, kiosk, AI agent, folding phone), and a deeper review lens that catches *reasoning* failures, not just mechanical ones. |
| **The what — specs** | `references/foundations.md`, `liquid-glass.md`, `iphone-duo.md`, `components.md`, `patterns.md`, `platforms.md`, `accessibility.md` | The concrete rules: typography & Dynamic Type, color & Dark Mode, SF Symbols, materials, motion, layout by size class, app icons, the **Liquid Glass** design language (iOS 26 and its iOS 27 refinements), **iPhone Duo**, components, interaction patterns, generative AI and Siri, per-platform conventions, and accessibility. |
| **The router** | `SKILL.md` | The entry point Claude reads first: the compressed principles, when to load which reference file, the Liquid Glass and iPhone Duo essentials, and a review checklist. |
| **The memory** | `.living/` | Dated facts that change faster than the skill does, with a source for every change. See [Keeping it current](#keeping-it-current). |

## What's inside

```
apple-hig/
├── SKILL.md                    # entry point: principles, routing, checklist
├── references/
│   ├── philosophy.md           # the worldview and Apple's eight 2026 principles (why)
│   ├── psychology.md           # the cognitive science (why)
│   ├── applying.md             # the generative method (how), incl. non-screen interfaces
│   ├── foundations.md          # type, color, SF Symbols, materials, motion, layout, icons
│   ├── liquid-glass.md         # the 2025+ design language: iOS 27 changes, APIs, adoption, a11y
│   ├── iphone-duo.md           # the folding iPhone: displays, poses, vertical controls, APIs, checklist
│   ├── components.md           # tab bars, toolbars, sidebars, search, menus, sheets, alerts, snippets
│   ├── patterns.md             # onboarding, loading, feedback, search, settings, generative AI and Siri
│   ├── platforms.md            # iOS, iPhone Duo, iPadOS, macOS, watchOS, tvOS, visionOS
│   └── accessibility.md        # VoiceOver, Dynamic Type, contrast, Reduce Motion, inclusion, RTL
└── .living/                    # sidecar: current facts, sources, change log, integrity hash
```

## Install (Claude Code)

In current Claude Code, a skill's folder name **is** its slash command — installing `apple-hig/` gives you `/apple-hig` automatically. Skills in `~/.claude/skills` or a project's `.claude/skills` activate immediately (no restart needed).

**One command** (needs Node 16.7 or later; nothing to clone):

```bash
npx github:allexp1/apple-hig              # global: ~/.claude/skills/apple-hig
npx github:allexp1/apple-hig --project    # this project only: ./.claude/skills/apple-hig
npx github:allexp1/apple-hig --dry-run    # show what would be written, change nothing
```

The installer only copies files. If the skill is already installed, the old copy is moved to `~/.claude/skill-backups/apple-hig-<timestamp>/` first, so updating is the same command and nothing is lost.

**With the [skills CLI](https://github.com/vercel-labs/skills)** (also installs for other agents that read `SKILL.md`):

```bash
npx skills add allexp1/apple-hig
```

**From a clone:**

```bash
git clone https://github.com/allexp1/apple-hig.git
cd apple-hig
./install.sh            # installs to ~/.claude/skills
./install.sh --project  # installs to ./.claude/skills
```

**By hand:**

```bash
mkdir -p ~/.claude/skills
cp -r apple-hig/apple-hig ~/.claude/skills/
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
- "Get this app ready for iPhone Duo. What breaks when the device opens, and what should the inner display show?"
- "Check this screen against iOS 27: does it stay legible at both ends of the Liquid Glass slider?"
- "What's the philosophy behind Apple's deference principle, and how would it apply to a voice interface?"
- "Design a self-serve kiosk the way Apple would reason about it — derive it, don't copy iOS."
- "Make this web component feel native to Apple platforms (Liquid Glass era)."

## A taste of "derive, don't copy"

The same roots produce different shapes per medium. For example, **Fitts's Law** (time to hit a target depends on its size and distance):

- **Touchscreen** → 44pt minimum target; primary action within thumb reach; screen edges/corners are "infinite" targets.
- **Folding phone** → on a short, wide display the side edge is the thumb's arc, one reason iPhone Duo moves its bars there.
- **Voice** → "distance" becomes *number of utterances to the goal* — shorten the path to the common action.
- **AI agent** → "distance" becomes *number of turns/corrections to the intended result* — minimize friction to the common outcome.

And **deference** (the interface serves the goal and otherwise disappears):

- **Screen** → minimal chrome, content edge-to-edge.
- **Voice** → say only what's needed; brevity *is* deference; don't narrate the system talking about itself.
- **Automotive** → the UI never competes with the road — here deference is literally safety.
- **AI agent** → leverage, not a chatty companion to manage; don't over-confirm or over-explain.

`references/applying.md` carries these all the way to full worked derivations.

## Keeping it current

Apple revises the HIG through the year, so any snapshot of it ages. The `.living/` folder follows the [living-skills](https://github.com/allexp1/living-skills) convention:

| File | Role |
|---|---|
| `KNOWLEDGE.md` | Dated facts: OS releases, HIG changes, device specs, and a list of older advice that is now wrong |
| `sources.md` | The sources a refresh may trust (Apple's own pages first) |
| `CHANGELOG.md` | Every change to the knowledge, with its source |
| `ORIGINAL.sha256` | Hash of `SKILL.md`, to detect edits |
| `PROTOCOL.md` | What an agent does with the above |

When the knowledge is older than its review interval (30 days), an agent that follows the protocol refreshes it from the listed sources before using the skill, and tells you when new knowledge disagrees with `SKILL.md` instead of silently overriding it. The sidecar never edits `SKILL.md`. Delete the folder and the skill works exactly as written.

The protocol runs only if your agent is told to follow it: living-skills sets that up with a short paragraph in your `CLAUDE.md`. Without it, the folder is plain reference material.

## How it was built, and an honesty note

- The **rules** are an independent synthesis of Apple's publicly documented Human Interface Guidelines and Design resources — paraphrased, never reproduced verbatim. Apple's live HIG is the authoritative, evolving source of truth; every reference file ends with direct links back to it.
- **Version 2.0 was checked against Apple's published pages on October 5, 2026**: the HIG, developer documentation, Apple Newsroom, the iPhone Duo tech specs, WWDC26 sessions, and the iPhone Duo Tech Talks. Values that are worked out rather than published (for example, a point size computed from a pixel size) are labeled as derived. The iPhone Duo developer APIs were in beta on that date, so check their names against current documentation before relying on them.
- The **philosophy lineage** (Bauhaus, Dieter Rams, Don Norman) is *interpretation* — the intellectual substrate Apple openly draws on (Jony Ive has repeatedly named Rams as a touchstone), not text Apple publishes in the HIG. `philosophy.md` flags this explicitly. The point is to make the rules generative, not to put words in Apple's mouth.
- The **psychology** maps well-established cognitive principles (Laws of UX, Norman, Nielsen Norman Group) to the guidance they explain. Apple generally doesn't cite these by name; the connections are the contribution.
- The HIG is **living** — re-check Apple's *What's New* and component pages rather than treating any snapshot as permanent.

## Caveats

- This is a reference and reasoning aid, not a substitute for reading Apple's HIG, testing with real users, or shipping accessible software.
- Auto-triggering is probabilistic.
- "Apple-grade" is a direction, not a guarantee — the skill makes Claude reason the right way; taste and testing still matter.

## License & trademarks

- Code and original written content: **MIT** — see [`LICENSE`](LICENSE).
- **Apple**, the Apple logo, **iPhone**, **iPad**, **iOS**, **iPadOS**, **macOS**, **watchOS**, **tvOS**, **visionOS**, **Siri**, **SF Symbols**, **San Francisco**, and **Liquid Glass** are trademarks of **Apple Inc.** This project is **independent and unaffiliated** with Apple and is not endorsed by Apple. See [`NOTICE`](NOTICE).

## Contributing

Issues and PRs welcome — see [`CONTRIBUTING.md`](CONTRIBUTING.md). Especially valuable: corrections when Apple updates the HIG, and new worked derivations for additional modalities.

## Key references (Apple)

- Apple Design: https://developer.apple.com/design/
- Human Interface Guidelines: https://developer.apple.com/design/human-interface-guidelines
- What's New in the HIG: https://developer.apple.com/design/whats-new/
- Design principles: https://developer.apple.com/design/human-interface-guidelines/design-principles
- Designing for iPhone Duo: https://developer.apple.com/design/human-interface-guidelines/designing-for-iphone-duo
- Adopting Liquid Glass: https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass
- Apple Design Resources: https://developer.apple.com/design/resources/
- SF Symbols: https://developer.apple.com/sf-symbols/

And for the *why*: Dieter Rams' ten principles (Vitsœ), Don Norman's *The Design of Everyday Things*, and Jon Yablonski's *Laws of UX* — all linked inside the reference files.
