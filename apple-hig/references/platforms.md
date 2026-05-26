# Platforms

How to adapt a design across Apple's platforms. The HIG's recurring lesson: **translate intent, don't replicate layout.** A great experience honors each platform's input model, ergonomics, and conventions instead of shipping one UI everywhere. Liquid Glass now spans all of them (see `references/liquid-glass.md`), but the interaction models below remain distinct.

## Table of contents
- The core principle: adapt, don't replicate
- iOS
- iPadOS
- macOS
- watchOS
- tvOS
- visionOS
- Games
- Choosing where features live
- Reference

## The core principle: adapt, don't replicate
Start from the user's intent, then express it with each platform's strengths. A blown-up iPhone screen is a poor iPad app; an iPad app stretched to a window is a poor Mac app. Keep the conceptual model consistent (same features, same vocabulary) while letting the interface, navigation, and input adapt. Lean into platform-defining capabilities — Live Activities on iOS, complications on watchOS, the menu bar on macOS, immersive Spaces on visionOS.

## iOS
- **Primary input is touch** — design for fingers with 44×44pt minimum hit targets and comfortable spacing.
- **Tab bar** for top-level navigation, **five items maximum**; use a "More" tab beyond that.
- Compact, often one-handed, single-column layouts; content scrolls vertically.
- Embrace system experiences: Live Activities, widgets, notifications, App Intents/Shortcuts, Handoff.
- Respect system gestures (edge-swipe back, swipe-up home) — don't override them.

## iPadOS
- **Larger canvas with multitasking**: Split View, Slide Over, and Stage Manager — design for resizable windows and multiple instances, not one fixed size.
- Use **sidebars and multi-column** layouts (e.g. three-column list/detail) to use the width; collapse gracefully to compact width.
- Support **pointer and keyboard** (hover states, keyboard shortcuts) alongside touch.
- Support **Apple Pencil** where content allows (drawing, markup, handwriting/Scribble).
- Don't ship a scaled-up iPhone UI; elevate the design to the larger surface (WWDC25 session 208).

## macOS
- **Pointer and keyboard first**: precise click targets, hover affordances, full keyboard navigation, and rich **keyboard shortcuts**.
- The **menu bar** is the canonical home for every command — expose full functionality there, not just in toolbars.
- **Resizable, often multiple windows**; dense, information-rich layouts are expected and welcome.
- Standard controls, traffic-light window chrome, and Mac conventions (drag-and-drop, Services, contextual menus).
- **No Dynamic Type** — type sizing differs from iOS; respect Mac sizing conventions.

## watchOS
- **Glanceable**: design for interactions measured in seconds; show the most important thing first.
- **Digital Crown** for precise scrolling/adjustment; large, easily tapped controls for the small screen.
- **Complications** put your app on the watch face — a key engagement surface; keep them timely and useful.
- Uses **SF Compact**; app icons are circular and authored at **1088px** (see `references/foundations.md` § App icons).
- Favor short, focused tasks and notifications over deep navigation.

## tvOS
- **Focus-based navigation** with the Siri Remote — there is no cursor; the user moves focus between elements, so design clear focus states and a logical focus order.
- **Viewed from a distance** on a large screen: large text, generous spacing, high contrast, and bold imagery.
- Lean on the focus engine's parallax and motion; keep layouts simple and navigable by directional input.

## visionOS
- **Spatial UI**: windows, volumes, and immersive Spaces. Design floating glass windows that sit comfortably in the user's space (Liquid Glass originated here).
- **Eyes + indirect pinch** is the primary input: the user looks at a target and pinches to select. Make targets large and well-spaced so eye-tracking is reliable; give clear hover/highlight feedback on gaze.
- **Ergonomics and comfort** matter physically: place content within comfortable viewing zones, avoid forcing large head movements, and avoid head-locked content or rapid motion that can cause discomfort.
- Use depth and scale meaningfully rather than decoratively.

## Games
- Games can define their own interaction model and visual world, but should still **respect system conventions** where they touch the OS: standard pause/settings, Game Center, proper **controller** support, and accessibility.
- Honor platform input (touch, controller, keyboard) and the platform's performance and safe-area expectations.

## Choosing where features live
Map each feature to the surface that fits the platform:
- Quick status / ongoing activity → **Live Activities & widgets** (iOS), **complications** (watchOS).
- Full command surface → **menu bar** (macOS).
- Immersive or 3D content → **volumes / Spaces** (visionOS).
- System integration / voice → **App Intents & Shortcuts** (all).
Keep the feature set conceptually consistent across platforms; change only how it's surfaced and operated.

## Reference
- HIG — Platforms (overview): https://developer.apple.com/design/human-interface-guidelines/platforms
- Designing for iOS: https://developer.apple.com/design/human-interface-guidelines/designing-for-ios
- Designing for iPadOS: https://developer.apple.com/design/human-interface-guidelines/designing-for-ipados
- Designing for macOS: https://developer.apple.com/design/human-interface-guidelines/designing-for-macos
- Designing for watchOS: https://developer.apple.com/design/human-interface-guidelines/designing-for-watchos
- Designing for tvOS: https://developer.apple.com/design/human-interface-guidelines/designing-for-tvos
- Designing for visionOS: https://developer.apple.com/design/human-interface-guidelines/designing-for-visionos
- Designing for games: https://developer.apple.com/design/human-interface-guidelines/designing-for-games
- WWDC25 session 208 — Elevate the design of your iPad app: https://developer.apple.com/videos/play/wwdc2025/208/
