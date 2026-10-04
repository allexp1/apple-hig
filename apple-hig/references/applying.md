# Applying the HIG to Any Human/Machine Interface

This file turns the *why* into a *method*. It's for when you're designing or reviewing something — a new app, a voice guide, a kiosk, a car display, an AI agent, a control panel — and you want Apple-grade reasoning rather than a copied Apple screen. Read `references/philosophy.md` (values) and `references/psychology.md` (cognition) first; this is how to put them to work.

## Table of contents

1. The stance: derive, don't copy
2. A first-principles design process (7 steps)
3. Translating the pillars across modalities
4. Worked derivations (screen, voice, kiosk, AI agent, folding phone)
5. Reviewing through the philosophy + psychology lens
6. Anti-patterns this method kills

## 1. The stance: derive, don't copy

The HIG's specific rules — 44pt targets, ≤5 tabs, filled tab-bar symbols — are **instances**: the philosophy (`references/philosophy.md`) and the psychology (`references/psychology.md`) applied to one medium (Apple touchscreens and pointers). On a different medium, the *instances* change but the *roots* don't.

So the move is never "what's the Apple component for this?" on a non-Apple surface. It's: **"what do clarity, deference, honesty, subtraction, and the relevant cognitive laws demand *here*, given this medium and context?"** Copying Apple's components onto a voice assistant or an industrial panel is cargo-culting — you get the shape without the reasoning, and it fits badly. Derive instead.

## 2. A first-principles design process

Seven steps. They apply to a single screen, a whole product, or a non-screen interface.

**Step 1 — Understand the human and the context.**
Who is this person, where are they, and in what physical/cognitive state? One-handed on a train? Driving? Glancing for half a second? Hands wet or gloved? In noise, in sun, in a hurry, stressed, first-timer vs expert? Context sets the hard constraints before any visual decision. (Psychology: context determines the real cognitive load and the available attention.)

**Step 2 — Name the one primary goal.**
What is this surface *for* — the single most important thing the user is trying to do here? Name one. Everything else is explicitly secondary. This is the hierarchy pillar and Rams' subtraction, applied up front. If you can't name one primary goal, the design problem isn't solved yet.

**Step 3 — Choose the interaction model from the constraints + Jakob's Law.**
Let the medium and context pick the modality (touch, pointer, voice, gaze/pinch, physical control, glance), then match the conventions the user already knows from that world. Don't import another medium's model (don't make a voice UI that's a spoken menu tree; don't make a car UI that's a phone). (Psychology: Jakob's Law, conceptual models.)

**Step 4 — Subtract.**
Remove everything not serving the primary goal. For each remaining element ask: delete, defer (progressive disclosure), or default (let the system decide)? Absorb complexity into the system, not the user. (Philosophy: "as little design as possible." Psychology: Hick's Law, cognitive load, decision fatigue.)

**Step 5 — Apply the cognitive levers deliberately.**
- Make the primary action **big, close, and singular** (Fitts + Von Restorff).
- **Chunk** information; carry context forward so nothing must be memorized (Miller).
- Give **immediate feedback**: acknowledge input <~100ms; deliver or show honest progress <~400ms (Doherty, closure).
- **Group by space and region** before borders (Gestalt).
- **Prevent errors; make the rest reversible**; confirm only the destructive-and-irreversible (Norman's error theory).
- **Show progress** on anything multi-step (goal-gradient).

**Step 6 — Design the arc, not just the steady state.**
Design the first run, the peak ("it worked!"), the failure and its recovery, the empty state, and the ending/offboarding — not only the happy middle. (Psychology: peak-end rule.) Make the defaults ethical (they're where your values live) and request any trust in context with a stated reason.

**Step 7 — Verify at the extremes.**
Check against the principles (Apple's eight from 2026, or the three classic pillars; `references/philosophy.md` §12 maps one to the other), accessibility, and honesty — at the *edges*, not the demo case: largest text, lowest vision, worst lighting, slowest network, the brand-new user, the user with one free hand, the smallest and largest space the interface can occupy. If it holds at the extremes, the middle takes care of itself.

## 3. Translating the pillars across modalities

The same idea, re-expressed per medium. Use this to port Apple's reasoning onto a surface the HIG never covered.

**Clarity — function is perceivable.**
- *Touchscreen:* controls look tappable; legible Dynamic Type; precise icons.
- *Pointer/desktop:* discoverable affordances, hover/cursor cues, visible menus.
- *Voice/audio:* the system's state and options are *audible* and unambiguous; distinct earcons for distinct events; no silent state.
- *Physical/kiosk:* labels and tactile cues make each control's purpose obvious; one obvious starting point.
- *Automotive/glanceable:* readable in under a second, high contrast, minimal text, no fine detail.
- *AI/agent:* the agent makes its current state, confidence, and limits legible; it doesn't pretend certainty it lacks (clarity = honesty).

**Deference — serve the goal, disappear otherwise.**
- *Touchscreen/pointer:* minimal chrome; content edge-to-edge.
- *Voice/audio:* say only what's needed; don't narrate the system talking about itself; let the content (the answer, the place, the music) lead. Brevity is deference.
- *Physical/kiosk:* the machine recedes; the task (buy, check in) is front and center.
- *Automotive:* the interface never competes with the road for attention — deference is literally safety.
- *AI/agent:* get out of the way of the user's intent; don't over-explain, over-confirm, or perform. The best agent feels like leverage, not a conversation partner demanding management.

**Depth / structure — convey hierarchy and a sense of place.**
- *Screens:* layers, motion with physics, transitions that show where you came from.
- *Voice/audio:* structure through pacing, ordering, and audio "scenes"; a sense of "where am I in this flow" conveyed by consistent cues.
- *Physical:* spatial layout and grouping of controls; progressive zones.
- *AI/agent:* a legible structure to multi-step work — show the plan, the step, what's done and what's left (this is also goal-gradient).

**Feedback — every action gets an immediate, perceivable response.**
- *Screens:* state changes + haptics.
- *Voice/audio:* an instant earcon or spoken acknowledgment; never dead air (Doherty is brutal with no screen to look at).
- *Physical:* tactile click, light, sound.
- *AI/agent:* acknowledge the request immediately, stream partial output, show honest progress; distinguish "received," "working," "done," "failed."

**"Hit target" — cost of the primary action (Fitts, generalized).**
- *Touch/physical:* literal size and reach.
- *Voice:* number of utterances/steps to the goal — shorten it.
- *AI/agent:* number of turns, clarifications, and corrections to get the intended result — minimize friction to the common outcome.

**Consistency — match the world the user already knows (Jakob's Law).**
Match the conventions of the *target medium and domain*, not Apple's, when you're off-platform. Innovate on your unique value; conform on everything users have already learned elsewhere.

## 4. Worked derivations

Short chains showing principle → decision. Note how the *roots* are identical across wildly different media.

### A. A screen (the familiar case): a "today's summary" home screen
- *Primary goal* (Step 2): see today's status at a glance → one hero element, everything else subordinate (hierarchy, Von Restorff).
- *Subtract* (Step 4): move settings/secondary stats behind disclosure (Hick).
- *Levers* (Step 5): one prominent primary action; semantic colors for Dark Mode; 44pt targets; skeleton on load (Doherty).
- *Arc* (Step 6): design the empty state ("nothing today") as a calm, useful state, not a blank.

### B. A voice / audio experience: an eyes-free walking guide
- *Context* (Step 1): outdoors, moving, eyes on the world, possibly one earbud, ambient noise → the screen is *not* the primary channel; audio is.
- *Primary goal* (Step 2): hear the right thing about *this* place at the right moment, hands-free.
- *Interaction model* (Step 3): minimal spoken commands + automatic, location-triggered audio; match conventions of audio players (play/pause/skip), not app menus (Jakob).
- *Clarity (audio):* distinct earcons for "new story starting," "paused," "off-route"; never leave the user wondering what state they're in.
- *Deference:* don't narrate chrome ("you have tapped the menu"); let the place and the narration lead; speak only what's needed (brevity = deference).
- *Fitts, generalized:* the most common action (pause / "tell me more") is reachable in one gesture or one word — minimize utterances to the goal.
- *Doherty:* trigger an instant audio acknowledgment before the (slower) content loads — never silence after an action.
- *Feedback channel:* an earcon or a single haptic *is* the confirmation; design it as deliberately as a button's pressed state.
- *Accessibility/honesty:* respect the user's chosen audio output device and volume; announce when content is unavailable rather than failing silently.

### C. A physical self-serve kiosk (appliance / vending / check-in)
- *Context* (Step 1): standing, possibly queueing, strangers watching, no manual, varied heights and abilities, gloves/sun possible.
- *Primary goal* (Step 2): complete one transaction fast → one obvious starting action (Hick, clarity).
- *Interaction model* (Step 3): match kiosk conventions people know (big touch tiles or physical buttons), not a phone UI shrunk onto a wall.
- *Fitts (literal):* large, well-spaced targets at reachable heights; primary "next" consistently placed; destructive/"cancel" deliberately distinct and not adjacent to confirm (error prevention).
- *Feedback:* immediate tactile/visual/audio response to every press (closure) — critical when people can't tell if a public screen registered them.
- *Peak-end:* the ending (receipt, "you're done," clear dispensing) is the remembered moment — make it unambiguous and graceful.
- *Accessibility:* high contrast for sunlight; reachable by seated/standing users; an audio/large-text mode; never color-only status.
- *Honesty:* show true availability and price; no pre-checked add-ons or hidden steps (no dark patterns).

### D. An AI assistant / agent interface
- *Context* (Step 1): the user has an intent and limited patience; the system is powerful but fallible and sometimes slow.
- *Primary goal* (Step 2): get the user's actual intent accomplished with minimal management overhead.
- *Clarity = honesty:* surface state, progress, and **uncertainty** truthfully; don't present a guess with false confidence; make capabilities and limits legible (the honesty principle is load-bearing here).
- *Deference:* get out of the way of intent — don't over-confirm, over-explain, or perform personality the user didn't ask for. Leverage, not a chatty companion to manage.
- *Doherty + feedback:* acknowledge instantly, stream partial output, show what it's doing on long tasks — never a frozen, silent wait.
- *Depth / goal-gradient:* for multi-step work, show the plan and progress (done / current / remaining) so the user has a sense of place and proximity to the goal.
- *Error theory:* prefer reversible actions and previews over irreversible ones; confirm only the genuinely destructive; when wrong, say what happened and offer the next step.
- *Trust:* act within stated scope, ask for elevated access in context with a reason, and never take surprising actions — trust is the entire substrate of an agent relationship.

### E. A folding phone: one app in two spaces (iPhone Duo)
The HIG now covers this (`references/iphone-duo.md`), but the derivation shows why its rules are what they are, and it carries to any device that changes shape.
- *Context* (Step 1): closed, the person is one-handed, moving, glancing. Open, they have two hands and time, and the device is held by its sides. Same person, same task, seconds apart.
- *Primary goal* (Step 2): continue what they were doing. Opening the device is not a new task, so it must not feel like a new app.
- *Interaction model* (Step 3): the same model in both spaces (Jakob's Law, habituation). What changes is how much of the hierarchy is visible, not what the app can do.
- *Subtract* (Step 4): don't design a layout per pose. Two layouts (compact, regular) cover every pose; the system handles the rest.
- *Cognitive levers* (Step 5): on the short, wide outer display the controls go to the side edge, inside the thumb's arc, and stay there when the device opens in landscape (Fitts, habituation). Related panes sit either side of the fold, so the hardware's division matches the content's grouping (Gestalt: common region). Nothing interactive on the fold itself (error prevention).
- *The arc* (Step 6): the transition is the designed moment. Selection, scroll position, text being typed, and playback all survive opening and closing.
- *Extremes* (Step 7): half width in Split View, largest text, a right-to-left language, partially folded.
- *What the derivation rules out:* a "tablet mode" with different features, device checks instead of size classes, and a centered phone layout floating in a wide space.

## 5. Reviewing through the philosophy + psychology lens

The component checklist in `SKILL.md` catches mechanical violations. This lens catches *reasoning* failures — use it for a deeper critique:

- **One glance, one goal.** Within ~1 second, is the primary purpose of this surface obvious? (Hierarchy, clarity, Von Restorff.)
- **Cost of the common action.** How big/close/few-steps is the thing people do most? Is the rare destructive thing appropriately harder? (Fitts, error prevention.)
- **Who's talking — app or user?** Is the chrome serving the user's content/goal, or is the product talking about itself? (Deference.)
- **Subtraction test.** What could be removed, deferred, or defaulted without hurting the primary goal? If lots, the design isn't finished. (Subtraction, Hick.)
- **Honesty audit.** Any dark patterns, false affordances, fake progress, manufactured urgency, or buried "decline"? (Honesty, trust.)
- **The arc.** Are the first run, the peak, the failure, the empty state, and the ending each *designed* — or only the happy middle? (Peak-end.)
- **Complexity location.** Is difficulty absorbed by the system or pushed onto the user? (Cognitive load.)
- **Memory tax.** Does the user ever have to remember something the interface could show? (Recognition over recall, Miller.)
- **Attention ethics.** Does anything interrupt or demand attention for the product's benefit rather than the user's? (Attention/flow.)
- **The extremes.** Does it hold at largest text / lowest vision / worst conditions / brand-new user? (Accessibility as a property of good design.)
- **The space test.** Does it hold when the space changes under it (rotation, a resized window, a device that opens)? Is anything lost in the change? (Flexibility: keep the person's place.)
- **Whose choice?** Where the system or an AI feature decides for the person, can they see what it did, change it, and undo it? (Agency, Responsibility.)
- **The eight-principle pass.** Name which of Purpose, Agency, Responsibility, Familiarity, Flexibility, Simplicity, Craft, and Delight the design serves weakest, and fix that one first. Apple presents them as tools for weighing trade-offs, not a scorecard.

## 6. Anti-patterns this method kills

- **Cargo-culting Apple's look** onto a medium it doesn't fit (a phone UI on a car dash, a menu tree as a voice UI) — fails Step 3.
- **Two primary actions** — emphasis budget blown; nothing leads (Von Restorff).
- **Decorative chrome that pulls focus** from content — deference failure.
- **Silent or laggy responses** — closure/Doherty failure; the user can't tell if anything happened.
- **Confirming everything** instead of making actions reversible — error theory backwards; trains users to dismiss dialogs blindly.
- **Dark patterns and false confidence** — short-term metric, long-term trust collapse (honesty).
- **Designing only the happy path** — the failure, empty, and end states are where memory forms (peak-end).
- **Pushing the system's complexity onto the user** via endless settings and required choices instead of good defaults (subtraction, decision fatigue).
- **Designing for a device instead of a space** — model checks, fixed widths, a layout per orientation. It breaks on the next device and in every resized window (flexibility).
- **Delight as decoration** — animation, sound, or personality added on top of a flow that doesn't work yet. Apple's 2026 principles make the same point: decoration is not delight.

## Reference

- `references/philosophy.md` — the values being applied.
- `references/psychology.md` — the cognitive laws cited above.
- `references/iphone-duo.md` — Apple's own guidance for the folding-phone case derived in §4E.
- Don Norman, *The Design of Everyday Things*: https://www.nngroup.com/books/design-everyday-things-revised/
- Jon Yablonski, *Laws of UX*: https://lawsofux.com/
- Apple HIG (the canonical instance for Apple platforms): https://developer.apple.com/design/human-interface-guidelines
- Apple "Get started" / Design Pathway: https://developer.apple.com/design/get-started/
