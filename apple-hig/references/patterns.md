# Patterns

How people accomplish things in your app over time — the flows, not the individual widgets. Patterns combine components into experiences. This file also covers **inputs** (gestures, haptics, hardware) and the **App Store review pitfalls** that flow from getting patterns wrong.

## Table of contents

1. [Launching](#1-launching)
2. [Onboarding](#2-onboarding)
3. [Loading](#3-loading)
4. [Navigation models](#4-navigation-models)
5. [Modality rules](#5-modality-rules)
6. [Feedback](#6-feedback)
7. [Searching](#7-searching)
8. [Settings](#8-settings)
9. [Entering data](#9-entering-data)
10. [Accessing user data & privacy](#10-accessing-user-data--privacy)
11. [Notifications](#11-notifications)
12. [Other patterns](#12-other-patterns)
13. [Inputs, gestures & haptics](#13-inputs-gestures--haptics)
14. [App Store review pitfalls](#14-app-store-review-pitfalls)

---

## 1. Launching

- **Launch fast into a useful state.** Use a **launch screen** that matches your first real screen (so it feels instant) — not a splash ad, logo animation, or "about" screen.
- **Restore state.** Bring people back to where they were; don't dump them at a generic home screen after every relaunch.
- **Don't gate the app on sign-in.** Let people experience value first; ask for accounts/permissions in context (see Onboarding, Privacy).
- No "are you sure you want to quit" or version/EULA walls on launch.

## 2. Onboarding

- **Make it familiar and low-friction.** Lean on standard patterns so there's almost nothing to "learn."
- **Teach by doing**, in context, rather than a carousel of feature tours people skip. Show a tip at the moment a feature is first relevant.
- **Defer permission and account requests** until the feature that needs them is invoked, and **explain the value** right before asking.
- Always offer a way to **skip / do-it-later**; never trap someone in setup.
- Keep any intro to a few screens; respect Dynamic Type and VoiceOver from the very first screen.

## 3. Loading

- **Always show what's happening.** Use progress indicators, **skeleton/placeholder** content, or activity spinners so the screen is never a mystery (see `references/components.md` §Status).
- **Determinate** progress when you know the proportion; **indeterminate** when you don't, with context for long waits ("Syncing 38 of 200…").
- **Show content progressively** — display what's ready (e.g., text now, images as they arrive) instead of blocking on everything.
- **Handle failure gracefully**: a clear message, the likely cause, and a **Retry**. Never an infinite spinner.
- Preserve layout: skeletons should match the final content's shape to avoid jarring reflow.

## 4. Navigation models

Apps combine three models — match the model to the information structure:

- **Flat** — peer top-level sections reached directly. Tab bar (iPhone) / sidebar (iPad, Mac).
- **Hierarchical** — drill down one path at a time, back to retrace. Navigation stack + navigation bar.
- **Content-driven / experiential** — the content defines the path (games, immersive media, a book).

Rules that hold across models:

- **Give a clear sense of place** — people should always know where they are and how to get back.
- **Use standard back/dismiss affordances** and the system's **edge-swipe back**; don't override or break it.
- **One path to a place** is simpler than many; avoid deep nesting (flatten with a sidebar where it helps).
- Don't combine redundant navigators (tab bar + custom bottom bar + FAB).

## 5. Modality rules

Use modality to focus on a self-contained task or demand a decision — sparingly. Pick the **lightest** form (sheet/menu/popover before full-screen/alert). See component specifics in `references/components.md` §Presentation.

- **Cancel must never destroy data directly.** If dismissing would lose unsaved work, intercept swipe-to-dismiss / Cancel and **confirm** ("Discard changes?" with a destructive Discard + Keep Editing).
- **Low-friction modals** (sheets, popovers, menus) block the rest of the app but pose no either/or decision — easy to dismiss by tapping away/swiping.
- **High-friction modals** (alerts, confirmation dialogs) demand a decision — reserve for genuinely consequential or destructive moments.
- Always provide an **obvious way out** (Done/Cancel/Close/swipe). Never trap the user.
- Keep modal tasks **short and self-contained**; if it grows into a multi-section flow, it probably wants its own navigation rather than a modal.

## 6. Feedback

- **Acknowledge every action.** Give clear, timely feedback for in-progress, success, and failure states at each stage. People should never wonder whether a tap registered.
- **Errors explain the next step**, in plain language — what happened and what to do — **not** a raw code or "Something went wrong." Avoid blame ("you entered…"); be constructive.
- **Match feedback strength to the event:** subtle (selection highlight, light haptic) for routine; prominent (alert) only for critical.
- Combine channels for important feedback (visual + haptic + sound) so it's not motion- or color-only, and works with accessibility settings.

## 7. Searching

- Make search **discoverable** (standard field in the nav bar, a Search tab, or ⌘F on Mac).
- **Results as you type**, with **suggestions, recents, and scopes**; support tokens/filters for power users.
- Be **forgiving** — handle typos, partials, and synonyms; show a helpful **no-results** state with suggestions, not a dead end.
- Persist recent searches; let people clear them (privacy).

## 8. Settings

- **Only what's necessary.** Put choices people actually change in the app; push rarely-changed system-level toggles to the **Settings app** where appropriate.
- **Sensible defaults** mean most users never open Settings. Don't require configuration to start.
- Group logically (inset-grouped lists), label clearly, and reflect changes immediately.
- **Don't put an in-app Light/Dark appearance toggle that overrides the system** — respect the OS setting (see `references/foundations.md` §Dark Mode). (A *content* theme is different from overriding system appearance.)

## 9. Entering data

- **Ask for the minimum.** Every field is friction; drop anything you can infer or defer.
- Use the **right control** (picker over free text when the set is known) and the **right keyboard type**; enable **autofill / content types** (email, one-time codes, addresses, passwords).
- **Validate kindly and early** — inline, near the field, explaining how to fix it; don't wait until submit to reveal six errors.
- Mark required vs optional clearly; preserve entered data across rotation, backgrounding, and errors.
- Provide **defaults** and remember prior choices.

## 10. Accessing user data & privacy

- **Request access in context**, at the moment the feature needs it, after explaining **why** — and word the usage-description strings specifically and honestly.
- **Degrade gracefully** when permission is denied; keep the rest of the app working and offer a path to enable later.
- **Collect the least** data necessary; prefer on-device processing; be transparent. Map to **App Privacy "nutrition label"** disclosures.
- Use the system pickers (Photos picker, Contacts picker, document picker) that grant **scoped** access without full-library permission.

## 11. Notifications

- **Earn the opt-in.** Explain the value before the system permission prompt; ask when it's relevant, not at first launch.
- **Be relevant, timely, and infrequent.** Each notification should be worth the interruption; offer granular categories users can tune.
- Write a clear title + body; add **actions** for quick responses; **group** related notifications.
- Respect Focus, quiet hours, and the user's settings. Provide value in-app too — don't make notifications the only way to see something.

## 12. Other patterns

- **Drag and drop** — support it where it speeds a task (especially iPad/Mac); give clear drop targets and feedback; never the *only* way to do something.
- **Undo / redo** — make destructive/edit actions reversible; support shake-to-undo (iOS) and ⌘Z (Mac); prefer **undo over confirmation** for routine reversible actions.
- **Ratings & reviews** — use **`SKStoreReviewController`**; prompt **after** a positive moment, not mid-task, and rarely (the system rate-limits). Never block features behind a rating.
- **Collaboration & sharing** — use the system share sheet and standard collaboration UI; show presence/permissions clearly.
- **File management** — use the document picker / Files integration; don't hide users' documents in an opaque sandbox when they expect to manage them.
- **Going full screen / multitasking** — support Split View, Slide Over, and Stage Manager on iPad; keep state across size changes.
- **Charting data** — label axes and series; make data points selectable; provide **audio graphs**/VoiceOver; never distinguish series by color alone.
- **Playing media / haptics** — respect the silent switch and system volume; don't autoplay sound; for audio output device references in apps, name the output **"External Headphones"** when that's the device.

## 13. Inputs, gestures & haptics

### Gestures

- **Adopt the system's standard gestures and their default responses** — tap, swipe-to-delete (rows), pull-to-refresh, edge-swipe back, pinch-to-zoom, long-press for context menus, two-finger/edit gestures.
- **Don't override or block system gestures** (especially edge-swipe back and Control/Notification Center pulls). Custom gestures that **conflict** with system ones are a top rejection cause.
- Make custom gestures **discoverable** (visible affordance) and provide a **non-gesture alternative** — never make a gesture the only way to perform an action.
- Keep gestures consistent with their meaning across the app; give immediate visual/haptic feedback.

### Haptics

- Use the standard generators for consistency:
  - **`UIImpactFeedbackGenerator`** — physical "tap" feedback (light/medium/heavy/soft/rigid) for collisions, toggles, snapping.
  - **`UINotificationFeedbackGenerator`** — success / warning / error outcomes.
  - **`UISelectionFeedbackGenerator`** — light tick as a selection changes (pickers, segmented changes).
  - **Core Haptics** — for custom, designed haptic patterns synced with audio/visuals.
- **Pair haptics with a visual (and sometimes audio) cue** — never haptic-only for essential info; respect the system haptics setting.

### Match the input to the platform

- **iOS / iPadOS (touch)** — direct manipulation; design for fingers (44×44pt) and standard gestures.
- **iPadOS / macOS (pointer + keyboard)** — precision targeting, hover states, right-click context menus, and **full keyboard support** + shortcuts; support trackpad gestures.
- **Apple Pencil / Scribble (iPad)** — low-latency drawing/handwriting; Scribble converts handwriting to text in any text field; support double-tap/squeeze where relevant.
- **Digital Crown (watchOS)** — primary precise scroll/adjust input; provide haptic detents; pair with on-screen feedback.
- **Siri Remote / focus (tvOS)** — focus-based navigation at a distance; design a clear **focus state** and simple directional movement; nothing requires precise pointing.
- **visionOS (eyes + hands)** — **eye tracking targets, indirect pinch selects**; design generous, well-spaced targets and respect ergonomic comfort zones; avoid requiring large arm movement.
- **Game controllers, keyboards, the Action button, nearby interactions, accelerometer/gyroscope** — support via the standard frameworks; let users remap where possible.

## 14. App Store review pitfalls

Most design-related rejections come from **breaking platform conventions**. Avoid:

- **Custom controls that conflict with standard gestures** (e.g., a horizontal swipe that fights edge-swipe back).
- **Non-standard controls that obscure their function** — buttons that don't look tappable, hidden-only gestures, ambiguous icons with no label.
- **Flows that bypass accessibility** — no VoiceOver labels, hit targets well under 44pt, text that ignores Dynamic Type / truncates at large sizes.
- **Modals that trap the user** with no clear dismissal, or **Cancel that destroys data** without confirmation.
- **Permission/sign-in walls** before any value is shown; vague or dishonest permission-usage strings.
- **Splash screens / heavy intros** that delay launch; launch screens used as advertising.
- **Distorted images** (wrong aspect ratio), **stacked redundant navigation**, and color-only signifiers.

## Reference

- HIG Patterns: https://developer.apple.com/design/human-interface-guidelines/patterns
- Inputs: https://developer.apple.com/design/human-interface-guidelines/inputs
- Design tips: https://developer.apple.com/design/tips
- App Review Guidelines: https://developer.apple.com/app-store/review/guidelines/
