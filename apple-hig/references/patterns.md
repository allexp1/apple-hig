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
13. [Generative AI, Siri & snippets](#13-generative-ai-siri--snippets)
14. [Inputs, gestures & haptics](#14-inputs-gestures--haptics)
15. [App Store review pitfalls](#15-app-store-review-pitfalls)

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

- **Flat** — peer top-level sections reached directly. Tab bar (iPhone; first choice on iPad, adaptable to a sidebar) / sidebar (Mac, complex iPad apps).
- **Hierarchical** — drill down one path at a time, back to retrace. Navigation stack + top toolbar (navigation bar).
- **Content-driven / experiential** — the content defines the path (games, immersive media, a book).

Rules that hold across models:

- **Give a clear sense of place** — people should always know where they are and how to get back.
- **Use standard back/dismiss affordances** and the system's **edge-swipe back**; don't override or break it.
- **One path to a place** is simpler than many; avoid deep nesting (flatten with a sidebar where it helps).
- Don't combine redundant navigators (tab bar + custom bottom bar + FAB).
- **Navigation follows the space, not the device.** The same structure shows as a bottom tab bar on a bar iPhone, a vertical bar on the side of a closed iPhone Duo, and a tab bar or a sidebar on iPad. Declare the structure with system containers and let the system place it (see `references/iphone-duo.md`).

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

- **If search matters, give it a primary position.** On iPhone that means a search tab or the bottom toolbar; on iPad and Mac, the toolbar or sidebar (⌘F on Mac). Placement rules are in `references/components.md` §Search.
- **One place to search everything.** People want a single, clearly identified location for finding anything in the app. A local search that filters one view is fine alongside it.
- **Show the current scope** with placeholder text, a scope bar, or a title, so people know what they are searching.
- **Results as you type**, with **suggestions, recents, and scopes**; support tokens/filters for power users.
- Be **forgiving** — handle typos, partials, and synonyms; show a helpful **no-results** state with suggestions, not a dead end.
- **Search history is private.** Think about who can see the screen before showing it, and always let people clear it.
- Make content findable outside the app: index it for **Spotlight**, which is also how Siri AI finds it.

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
- **Going full screen / multitasking** — support resizable windows, Split View, Slide Over, and Stage Manager on iPad, and **Split View on iPhone Duo** (two apps, or two windows of your app, side by side). Keep state across every size change; the window can change size at any moment.
- **In-app purchase** — Apple's system is now named **Apple In-App Purchase** (September 2026). Use the current name and the system purchase UI; state price and terms plainly before the commitment.
- **Charting data** — label axes and series; make data points selectable; provide **audio graphs**/VoiceOver; never distinguish series by color alone.
- **Playing media / haptics** — respect the silent switch and system volume; don't autoplay sound; for audio output device references in apps, name the output **"External Headphones"** when that's the device.

## 13. Generative AI, Siri & snippets

The 27 generation makes intelligence a normal part of an app. Apple revised the Generative AI and Siri pages in June 2026 and added Snippets. The design job is the same as everywhere else: the person stays in charge.

### Generative features

- **Use AI where it earns its place.** Offer it when it gives clear, specific value (saves time, removes tedium), not because it is available. Keep the app good **without it**: people may opt out, and the model may be unavailable.
- **The person stays in charge.** Honor the request as asked, don't act beyond it, and **ask before an irreversible or consequential action**.
- **Be transparent.** Say where AI is used and what it can and can't do. Never let people think they are talking to a human.
- **Pick the model for privacy.** On-device models keep data on the device, respond fast, and work offline; go to a server only when the feature needs it, and say so. Ask permission before using personal data, and disclose how it is used and stored.
- **Design for wrong answers.** Models hallucinate. Show sources where you can, mark uncertainty, and keep generated output out of places where a mistake does harm.
- **Make results easy to refine or revert.** Put **Edit, Undo, Retry, Adjust** next to generated content, and acknowledge when a correction has taken effect.
- **Say what is happening while it generates.** A message that names the step ("Checking your calendar for free slots") beats a generic "Working…". Design for latency: stream or show progress.
- **Offer alternates** when several good answers exist, and **a feedback control** (thumbs up/down) on outputs.
- **Coach, don't just block.** When a request is refused or the result is poor, tell people how to ask better.

### Siri AI and App Intents

- Siri reaches your app through **App Intents**: actions, **entities** (your content), and **app schemas** that map both to domains Siri already understands. Start from your app's most-used actions and where people need them (hands-free, on another device).
- **Give context.** Annotate what is on screen so "send this" or "summarize it" resolves to the right thing; donate personally relevant content to Spotlight rather than everything.
- **Use familiar terms** for content and actions: the words people say, not your internal names.
- **Responses work for ears and eyes.** Siri picks the channel. Keep dialogue clear and as short as possible (people hear it repeatedly), device-independent, and inclusive; **omit your app name** (the system attributes it) and **don't advertise**.
- Prefer built-in responses; customize only when they don't fit. Make errors specific to the situation.

### Snippets

- A snippet is the compact view shown when Siri, Spotlight, or Shortcuts runs an app intent. **Confirmation** snippets ask before acting (Cancel + a primary button); **result** snippets show the outcome (Done).
- **Keep it glanceable:** custom view **no taller than 400 pt**, legible in light and dark, readable at large text sizes.
- **Label the confirmation button with the outcome** ("Order", "Send"), not "OK" or "Continue".
- **Let the view carry the meaning.** The spoken dialogue is for when nobody is looking; don't lean on its text on screen.

## 14. Inputs, gestures & haptics

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
- **iPhone Duo (touch, two poses)** — one-handed and compact when closed, two-handed and regular when open; controls sit on the side edge when closed and when open in landscape. Keep interactive elements off the folding region (see `references/iphone-duo.md`).
- **iPadOS / macOS (pointer + keyboard)** — precision targeting, hover states, right-click context menus, and **full keyboard support** + shortcuts; support trackpad gestures.
- **Apple Pencil / Scribble (iPad)** — low-latency drawing/handwriting; Scribble converts handwriting to text in any text field; support double-tap/squeeze where relevant.
- **Digital Crown (watchOS)** — primary precise scroll/adjust input; provide haptic detents; pair with on-screen feedback.
- **Siri Remote / focus (tvOS)** — focus-based navigation at a distance; design a clear **focus state** and simple directional movement; nothing requires precise pointing.
- **visionOS (eyes + hands)** — **eye tracking targets, indirect pinch selects**; design generous, well-spaced targets and respect ergonomic comfort zones; avoid requiring large arm movement.
- **Game controllers, keyboards, the Action button, nearby interactions, accelerometer/gyroscope** — support via the standard frameworks; let users remap where possible.

## 15. App Store review pitfalls

Most design-related rejections come from **breaking platform conventions**. Avoid:

- **Custom controls that conflict with standard gestures** (e.g., a horizontal swipe that fights edge-swipe back).
- **Non-standard controls that obscure their function** — buttons that don't look tappable, hidden-only gestures, ambiguous icons with no label.
- **Flows that bypass accessibility** — no VoiceOver labels, hit targets well under 44pt, text that ignores Dynamic Type / truncates at large sizes.
- **Modals that trap the user** with no clear dismissal, or **Cancel that destroys data** without confirmation.
- **Permission/sign-in walls** before any value is shown; vague or dishonest permission-usage strings.
- **Splash screens / heavy intros** that delay launch; launch screens used as advertising.
- **Distorted images** (wrong aspect ratio), **stacked redundant navigation**, and color-only signifiers.
- **Layouts tied to one device size** — fixed widths, hard-coded safe-area numbers, or orientation locks that break in resizable windows and on iPhone Duo's inner display (which ignores supported-orientation settings).
- **AI that hides itself or acts alone** — undisclosed AI, generated content with no way to correct or undo, or irreversible actions taken without confirmation.

## Reference

- HIG Patterns: https://developer.apple.com/design/human-interface-guidelines/patterns
- Searching: https://developer.apple.com/design/human-interface-guidelines/searching
- Generative AI: https://developer.apple.com/design/human-interface-guidelines/generative-ai
- Siri: https://developer.apple.com/design/human-interface-guidelines/siri
- Snippets: https://developer.apple.com/design/human-interface-guidelines/snippets
- App Shortcuts: https://developer.apple.com/design/human-interface-guidelines/app-shortcuts
- Inputs: https://developer.apple.com/design/human-interface-guidelines/inputs
- Design tips: https://developer.apple.com/design/tips
- App Review Guidelines: https://developer.apple.com/app-store/review/guidelines/
