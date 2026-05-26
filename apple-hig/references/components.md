# Components

How to choose and use Apple's standard UI components. **Rule of thumb: use the system component before building a custom one** — you inherit its appearance, motion, feedback, localization, right-to-left, and accessibility behavior for free, and you stay consistent with the platform (which also smooths App Store review).

## Table of contents

1. [Navigation & search](#1-navigation--search)
2. [Menus & actions](#2-menus--actions)
3. [Presentation (modality)](#3-presentation-modality)
4. [Selection & input](#4-selection--input)
5. [Status & feedback components](#5-status--feedback-components)
6. [Content & layout containers](#6-content--layout-containers)
7. [System experiences](#7-system-experiences)
8. [Choosing the right one](#8-choosing-the-right-one)

---

## 1. Navigation & search

### Tab bar

- **For navigation, not actions.** A tab bar switches between the app's **top-level, peer destinations**. Never put action buttons (compose, share) in it — those belong in a toolbar.
- **≤5 tabs on iPhone.** More than that, use a "More" tab or rethink the architecture. iPad/Mac can show more via a sidebar.
- Use **filled** SF Symbol variants in the tab bar; the same symbols appear as **outline** in a sidebar.
- A tab persists its own navigation state; re-tapping the current tab pops to its root / scrolls to top.
- Use **badges** for unobtrusive "new info" counts.
- Under Liquid Glass the tab bar is a floating glass surface; on iPhone it can minimize as you scroll to give content more room.
- **macOS has no tab bar** — use a sidebar or segmented control / tab view instead.

### Navigation bar

- Sits at the top of a screen in a **hierarchical (drill-down)** flow. Holds the **title**, a **back** affordance (leading), and a few screen-level controls (trailing) — optionally **search** and an edit/management menu.
- Keep the title short; use the **large-title** style for top-level screens that collapses to inline on scroll.
- Don't overload it; move secondary actions into a toolbar or an overflow (•••) menu.

### Sidebar

- The primary navigation for **iPad and macOS** when there are many top-level destinations. Lets people jump directly between sections (flatter and faster than a tab bar) and supports **groups, collapsing, reordering, and hide/show**.
- On iPad, **prefer a sidebar over a tab bar** when the app is content-rich and benefits from persistent navigation; it can collapse for more canvas.
- Use outline SF Symbols; indicate the current selection clearly.

### Search

- Use the standard **search field / search bar**; place it in the navigation bar or as a dedicated tab/field per platform convention.
- Show **results as you type** when feasible; offer **scopes**, **suggestions/recents**, and a clear empty-results state with guidance.
- Don't reinvent the field — the system one brings the clear button, dictation, tokens, and accessibility.

### Page controls

- The row of dots for paged content; keep the number of pages small and obvious. Don't use for unbounded lists.

---

## 2. Menus & actions

### Buttons

- A button must **look tappable** (clarity). Use the platform's standard styles: plain, gray, tinted, bordered, **prominent/filled** for the primary action. Under Liquid Glass, prominent actions use the prominent glass style.
- **One primary (filled/prominent) button per screen.** Everything else is secondary (bordered/plain).
- **Label for the outcome**, not the mechanism: "Add to Cart", "Send", "Delete" — not "OK", "Submit", "Confirm" when something more specific is true.
- Destructive buttons use **red**; in alerts/sheets they're marked destructive (and never the default/Cancel).

### Menus (pull-down & pop-up)

- **Pull-down menu** — a list of actions or options triggered by a button (often •••). Group related items; use separators; put destructive items last and styled destructive.
- **Pop-up menu** — lets the user choose one value from a set; shows the current selection. Good for compact single-choice on macOS/iPadOS.
- Use **submenus** sparingly (one level); add **SF Symbols** to items for scanning; mark **state** with a checkmark.

### Context menus

- Long-press (touch) / right-click (pointer) on an item to reveal **contextual actions** for that item, optionally with a preview. Don't hide *essential* actions only here — provide a visible path too.

### Toolbar

- Holds the **actions relevant to the current screen/content** (not navigation between sections).
- **iPhone:** typically a **bottom** toolbar. **iPad/Mac:** top and/or bottom. On iPadOS the navigation bar doubles as the toolbar surface (leading back/sidebar + title, trailing actions).
- Under Liquid Glass, toolbar items can be **grouped**; placement (`ToolbarItemPlacement`) decides both position and prominence. Keep to a few high-value actions; overflow the rest into a ••• menu.

### Activity views (Share)

- Use the **system share sheet** for sharing/exporting — it brings AirDrop, Messages, Markup, and third-party actions, plus the user's expected layout. Don't build a custom share grid.

---

## 3. Presentation (modality)

Modality interrupts the normal flow to focus on a self-contained task or to surface critical info. Choose the **lightest** form that fits. See also `references/patterns.md` §Modality.

### Sheets

- A card that slides up for a **self-contained subtask** (compose, edit, configure) while keeping context visible behind it.
- **Resizable detents** (iOS 16+): e.g., `medium` and `large`; pick detents that match the content. Allow the grabber when resizable.
- Support **swipe-to-dismiss** — but if there are **unsaved changes, intercept it** and confirm before discarding (see Modality rules).
- Sheets can host their **own navigation stack** (title + Done/Cancel in the sheet's nav bar). **Cancel** is leading, **Done/primary** is trailing.
- Under Liquid Glass, sheets adopt the material automatically on recompile — remove custom blurred backgrounds.

### Full-screen modal / cover

- For **immersive or focused** tasks that need the whole screen (camera, full editor, onboarding). Provide an obvious **Done/Cancel/Close**. Use less often than sheets.

### Popovers

- A transient panel anchored to its trigger, mainly on **iPad/Mac** (on iPhone popovers usually adapt into sheets). Good for a focused set of options/controls tied to a specific element. Dismiss on outside tap.

### Alerts

- For **critical information or decisions** that must interrupt — errors, destructive confirmations. Keep them rare; overuse trains people to dismiss without reading.
- A short **title** (often a full sentence), optional brief message, and **1–3 buttons**.
- **Cancel is never destructive** and is the safe default. The destructive choice is styled **destructive (red)** and is not the default button.
- No custom content/controls inside an alert — if you need them, use a sheet.

### Action sheets / confirmation dialogs

- A set of **choices in response to a user-initiated action** (e.g., "Delete photo?" → Delete / Cancel). On iPhone they slide from the bottom; on iPad/Mac they appear as a popover/menu near the trigger.
- Put the **destructive option** styled destructive at the top of the action group; **Cancel** is separate at the bottom.

---

## 4. Selection & input

- **Text fields / text views / search fields** — use system ones for free editing, dictation, autofill, undo, and accessibility. Provide a clear **placeholder** (a hint, not the label), correct **keyboard type**, and content-type hints for autofill.
- **Toggles (switches)** — for an **immediate on/off** of an independent setting. Don't use a switch for an action; don't require a separate "Apply".
- **Sliders** — for a continuous value within a range; pair with a label/value readout. Add tick marks for discrete steps.
- **Steppers** — for small incremental numeric changes.
- **Segmented controls** — for choosing **one** of a few mutually exclusive options that are visible at once (2–5). Not for navigation between unrelated sections.
- **Pickers / date pickers** — for choosing from a defined set or a date/time; use the platform-standard picker rather than a custom wheel.
- **Color wells**, **rating controls**, etc. — prefer the system component where one exists.

> Map the control to the *behavior*: switch = instant independent toggle; checkbox (macOS) = selection within a set/form; segmented control = pick-one-of-few; menu/picker = pick-one-of-many.

---

## 5. Status & feedback components

- **Progress indicators** — **determinate** bar when you know the proportion; **indeterminate** spinner when you don't. Always show progress for operations >~1s; never leave the user guessing (see `references/patterns.md` §Loading).
- **Activity / spinners** — for short, indeterminate waits. For longer waits show context ("Importing 12 of 340…").
- **Skeletons / placeholders** — show the *shape* of incoming content while it loads, then fill it in.
- **Badges** — small counts for unread/new; keep numbers low and meaningful.
- **Gauges (watchOS/widgets)** — compact value-in-range visualizations.
- **Empty states** — never a blank screen: explain why it's empty and give a **clear next action**.

---

## 6. Content & layout containers

- **Lists / tables** — the workhorse for rows of data. Use standard cells (with the system's leading image / title-subtitle / trailing accessory layouts) for consistency, swipe actions, reordering, and accessibility. Group related rows with section headers/footers; use inset-grouped style for settings-like screens.
- **Collection views / grids** — for 2-D arrangements (photos, tiles). Use compositional layouts that adapt to width and Dynamic Type.
- **Scroll views** — content scrolls; chrome stays. Respect safe areas and scroll-edge effects.
- **Split views** — multi-column layouts (sidebar → content → detail) on iPad/Mac that collapse responsively.
- **Charts** — use **Swift Charts**; label axes, support VoiceOver (audio graphs), and don't rely on color alone to distinguish series (see `references/patterns.md` §Charting).
- **Boxes / group boxes / disclosure groups (macOS)** — to visually group related content/controls.

---

## 7. System experiences

Standard surfaces that live partly outside your app — use the official APIs so they look and behave like the platform:

- **Notifications** — concise, actionable, respectful of frequency; support notification actions and grouping. See `references/patterns.md` §Notifications.
- **Widgets** — glanceable, focused content on the Home/Lock Screen and macOS desktop; multiple sizes; tap targets route into the app. Adopt Liquid Glass styling.
- **Live Activities (iOS)** — real-time, glanceable status on the Lock Screen and in the Dynamic Island (e.g., a delivery, a game score). Keep it to the essential live data.
- **Complications (watchOS)** — tiny, glanceable data on the watch face.
- **App Shortcuts / Controls / Action button** — expose key actions to Spotlight, Shortcuts, Control Center, and the Action button via App Intents.
- **Status bars, the Dock, Control Center, Home Screen quick actions** — don't fight or fake them; integrate through the provided APIs.

---

## 8. Choosing the right one

- **Switch between top-level sections?** → Tab bar (iPhone) / sidebar (iPad, Mac).
- **Drill into detail?** → Navigation stack + navigation bar.
- **Run a self-contained subtask?** → Sheet (with detents); full-screen cover only if it needs the whole screen.
- **Offer a list of actions from a control?** → Pull-down menu or context menu.
- **Force a critical decision / show an error?** → Alert (rare) or confirmation dialog/action sheet.
- **Pick one of a few visible options?** → Segmented control. **One of many?** → Menu/picker.
- **Toggle an independent setting instantly?** → Switch.
- **Show that work is happening?** → Determinate progress bar (known) / spinner (unknown) / skeleton.

## Reference

- All components: https://developer.apple.com/design/human-interface-guidelines/components/all-components
- HIG home: https://developer.apple.com/design/human-interface-guidelines
