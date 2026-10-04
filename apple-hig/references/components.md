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
- **As few tabs as the app needs; five or fewer by default on iPhone.** Fewer tabs are easier to navigate.
- **Don't let tabs overflow.** When tabs don't fit, the system turns the trailing one into a **More** tab, and the HIG now says to avoid that: hidden tabs are harder to reach and notice. If you have more sections than fit, rethink the architecture or use a tab bar that adapts to a sidebar (below). Don't plan for a More tab.
- **Keep it visible and stable.** Don't hide the tab bar as people navigate (a modal covering it is the exception), and don't disable or remove a tab when its content is unavailable: show an empty state that explains why.
- **Labels are single words**; use **filled** SF Symbol variants in the tab bar (the same symbols appear as **outline** in a sidebar).
- A tab persists its own navigation state; re-tapping the current tab pops to its root / scrolls to top.
- **Badges are for critical information only**, so they keep their meaning.
- **Don't color tab labels like the content behind them.** If the content layer is bright and colorful, keep the bar monochrome or choose an accent that clearly differs.
- **iPhone:** the tab bar floats at the bottom on Liquid Glass. With an attached accessory (like Music's MiniPlayer) it can **minimize on scroll** (`TabBarMinimizeBehavior`). A **dedicated search tab** sits at the trailing end (see Search).
- **iPad:** the tab bar sits **near the top**. Choose a fixed bar (`tabBarOnly`) or one with a button that converts it to a sidebar (`sidebarAdaptable`). Let people customize which tabs appear, with a default of five or fewer.
- **iPhone Duo:** on the closed outer display, and on the inner display in landscape, the tab bar becomes a **vertical tab bar on the side**, automatically. The inner display in portrait keeps the standard horizontal bar. See `references/iphone-duo.md`.
- **macOS has no tab bar** — use a sidebar or segmented control / tab view instead.

### Navigation bar (now a top toolbar)

Since 2025 the HIG folds navigation bar guidance into **Toolbars** and treats "navigation bar" as an iOS name for a toolbar used for navigation. The behavior is the same; the vocabulary changed.

- Sits at the top of a screen in a **hierarchical (drill-down)** flow. Holds the **title**, a **back** affordance (leading), and a few screen-level controls (trailing).
- **Use the standard Back and Close buttons** with their standard symbols. Don't label them with the words "Back" or "Close".
- Keep the title short (**under about 15 characters**) and never use the app name as a title. Use the **large-title** style on top-level screens; it collapses to inline on scroll.
- Don't overload it; see Toolbar in §2 for grouping, primary action, and overflow rules.

### Sidebar

- The primary navigation on **macOS**, and on **iPad** when there are more top-level areas than a tab bar holds. Lets people jump directly between sections and supports **groups, collapsing, reordering, and hide/show**.
- **On iPhone and iPad, start with a tab bar.** It leaves more room for content. If you need more areas than fit, use the adaptable style (`sidebarAdaptable`): a tab bar that converts to a sidebar, and back, with one button. You rarely have to choose between the two anymore.
- **Show no more than two levels of hierarchy.** Deeper than that, use a split view with a content list between the sidebar and the detail.
- **Extend rich content beneath the sidebar.** It floats on the Liquid Glass layer; let content scroll under it or apply the background extension effect.
- **Icon colors need a reason.** Sidebar icons take the app accent color by default, and on macOS they follow the system accent color people choose. Use a fixed color only where it carries meaning (Mail's yellow VIP star) and sparingly.
- Use outline SF Symbols; indicate the current selection clearly.

### Search

- Use the standard **search field**. Don't reinvent it: the system one brings the clear button, dictation, tokens, and accessibility.
- Show **results as you type** when feasible; offer **scope bars, tokens, suggestions/recents**, most relevant results first, and a clear empty-results state. Use placeholder text to say what can be searched. Default to the broader scope and let people narrow it.
- **iPhone has three entry points.** Pick one by how central search is:
  - **A search tab** at the trailing end of the tab bar. *Standard tab*: opens a search landing page with suggestions and categories; use it when browsing and discovery matter (Apple TV, Music). *Button appearance*: focuses the field and raises the keyboard at once, then returns people to the tab they came from; use it when search should resolve quickly.
  - **In a toolbar.** **Prefer the bottom when there is room** (Settings, Mail, Notes), where it is easy to reach. Put it at the top only when the bottom of the screen has content that must stay clear, or there is no bottom toolbar.
  - **Inline with content**, above the list it filters, when the position shows what the search applies to (search within one view, or an app with more than one search field).
- **iPad and Mac:** the trailing side of the toolbar for most apps; the top of the sidebar when filtering the sidebar itself; a dedicated sidebar or tab item when search is a discovery area. Keep the two platforms consistent, and make sure search stays reachable when the window shrinks to compact width.

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
- Use **submenus** sparingly (one level); mark **state** with a checkmark.
- **Menu item icons: few, and each one earning its place** (guidance tightened June 2026). Use an icon for the most common actions and key features, file-system locations, devices, visual concepts (rotate, flip), and user content such as folders. If no icon clearly fits, leave it out. Use the **standard icons** for standard actions (Share, Print, Search). Within one group of items, give icons to **all or none**.

### Context menus

- Long-press (touch) / right-click (pointer) on an item to reveal **contextual actions** for that item, optionally with a preview. Don't hide *essential* actions only here — provide a visible path too.

### Toolbar

- Holds the **actions relevant to the current screen/content** (not navigation between sections).
- **iPhone:** typically a **bottom** toolbar. **iPad/Mac:** top and/or bottom. On iPadOS the navigation bar doubles as the toolbar surface (leading back/sidebar + title, trailing actions).
- Under Liquid Glass, toolbar items are **grouped** into glass sections; placement (`ToolbarItemPlacement`) decides both position and prominence. Three homes: **leading** (back, sidebar toggle, then the title), **center** (common controls; customizable on iPad/Mac), **trailing** (important items, the More menu, the primary action).
- **Group by function and frequency; aim for three groups at most.** Give navigation controls and critical actions (Done, Close, Save) their own visually distinct section.
- **One primary action, `.prominent`, on the trailing side** (Done, Submit). It gets tint and separation so the bar has one focal point.
- **Prefer symbols without borders** for items; the glass section is already the container. Use text only where no symbol reads clearly (Edit). **Keep text-labeled items apart** from symbol items and from each other with fixed space, or they read as one control.
- **Overflow:** on iPadOS and macOS the system adds the overflow menu when items no longer fit; don't add your own, and don't design a layout that overflows by default. Decide which items move there first. On iPhone, a More (•••) menu holds the secondary actions.
- **iPhone Duo:** on the closed outer display, and on the inner display in landscape, top and bottom toolbars become **vertical bars on the side** (the inner display in portrait keeps horizontal bars). Give every item a title and a symbol, set visibility priority, and let the system overflow menu take the rest, because less fits on the side. See `references/iphone-duo.md` §4.

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
- **Arrangement views (iOS 27.1)** — a container, new with iPhone Duo, for a primary and a secondary view. **Split** divides the space between them (side by side when wider than tall, stacked when taller than wide) and adjusts around the fold; **overlay** layers one over the other and moves them to opposite sides of the fold when the device is partially folded. Navigation stays outside it. See `references/iphone-duo.md` §6.
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
- **Siri AI (27 generation)** — Siri reaches your app through the same App Intents: actions, entities, and (new) **app schemas** that map them to domains Siri already understands. Annotate on-screen content so people can refer to "this". Design the response for both eyes and ears, keep dialogue succinct, don't advertise. See `references/patterns.md` §Generative AI, Siri & snippets.
- **Snippets** — the compact view Siri, Spotlight, or Shortcuts shows for an app intent. Two types: **confirmation** (Cancel + a primary button you label) and **result** (Done). Keep the custom view **no taller than 400 pt**, label the primary button with the outcome ("Order", not "OK"), and let the view carry the meaning rather than the spoken dialogue. iOS, iPadOS, macOS only.
- **Status bars, the Dock, Control Center, Home Screen quick actions** — don't fight or fake them; integrate through the provided APIs.

---

## 8. Choosing the right one

- **Switch between top-level sections?** → Tab bar (iPhone, and first choice on iPad; adaptable to a sidebar) / sidebar (Mac, complex iPad apps).
- **Drill into detail?** → Navigation stack + top toolbar (navigation bar).
- **Search?** → Search tab (central to the app) / bottom toolbar (important, room available) / inline (scoped to one list).
- **Two related views that should arrange themselves around a fold (iPhone Duo)?** → Arrangement view. **List + detail?** → Split view, as on iPad.
- **An action Siri or Shortcuts should perform?** → App Intent, with a snippet for the result.
- **Run a self-contained subtask?** → Sheet (with detents); full-screen cover only if it needs the whole screen.
- **Offer a list of actions from a control?** → Pull-down menu or context menu.
- **Force a critical decision / show an error?** → Alert (rare) or confirmation dialog/action sheet.
- **Pick one of a few visible options?** → Segmented control. **One of many?** → Menu/picker.
- **Toggle an independent setting instantly?** → Switch.
- **Show that work is happening?** → Determinate progress bar (known) / spinner (unknown) / skeleton.

## Reference

- All components: https://developer.apple.com/design/human-interface-guidelines/components/all-components
- Tab bars: https://developer.apple.com/design/human-interface-guidelines/tab-bars
- Toolbars: https://developer.apple.com/design/human-interface-guidelines/toolbars
- Sidebars: https://developer.apple.com/design/human-interface-guidelines/sidebars
- Search fields: https://developer.apple.com/design/human-interface-guidelines/search-fields
- Menus: https://developer.apple.com/design/human-interface-guidelines/menus
- Snippets: https://developer.apple.com/design/human-interface-guidelines/snippets
- WWDC26 session 292 — Design intuitive search experiences: https://developer.apple.com/videos/play/wwdc2026/292/
- HIG home: https://developer.apple.com/design/human-interface-guidelines
