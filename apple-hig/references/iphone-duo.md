# iPhone Duo (the folding iPhone)

iPhone Duo is Apple's first folding iPhone: a compact **outer display** you use closed, a large **inner display** you use open, and a center **hinge** that supports a range of poses in between. It was announced September 9, 2026 and ships October 23, 2026 on **iOS 27.1**. Apple published a dedicated HIG page for it ("Designing for iPhone Duo", new on September 9, 2026), a developer overview, and six Tech Talks. This file is the working summary of all of them.

Apple's framing is the first thing to absorb: the form factor is new, but you are still designing for iPhone. It is not a new platform and not a small iPad. Everything in `references/platforms.md` § iOS still applies; what changes is that the app must **resize** and that the bars **move to the side**.

> Sourcing: rules below are from Apple's HIG page, the "Preparing your app for iPhone Duo" overview, and the Duo Tech Talks unless marked otherwise. Everything is paraphrased; follow the links in §13 for Apple's wording. Items marked *(derived)* are this skill's own reasoning from those rules, not Apple's guidance.

## Table of contents

1. The one idea: one app that resizes
2. Anatomy
3. Poses and size classes
4. Vertical controls (the signature pattern)
5. Dynamic layouts and reserved regions
6. Split views and arrangement views
7. Multitasking, windows, and the second display
8. Games, media, and camera
9. Adoption: SDK tiers, APIs, testing
10. Why it works (philosophy and psychology)
11. Duo review checklist
12. Anti-patterns
13. Reference

## 1. The one idea: one app that resizes

The goal Apple sets: an app that fits both displays and feels continuous as the device opens and closes.

- **Design two layouts, not six.** A **compact-width** layout for the outer display and a **regular-width** layout for the inner display are the foundation for every pose. Supporting the poses does not call for a custom layout per pose.
- **Expand, don't reinvent.** When the app resizes, let the layout you already have grow into the space it is given rather than swapping in a different design.
- **Same app inside and out.** Keep functionality and element state identical between displays. People open and close the device mid-task, so the app has to behave the same on both displays. Never tie a feature to a pose.
- **Standard components do most of the work.** An app built from standard system components that already supports resizing adapts to the poses with very little extra work. An app that already resizes well on iPad, on Mac, or in iPhone Mirroring is most of the way there.

## 2. Anatomy

| Part | Behavior |
|---|---|
| **Outer display** | Used when the device is closed. Wider and shorter than the display on other iPhone models, so the system puts toolbars and tab bars **on the side** to keep vertical space for content. |
| **Inner display** | Used when open. Regular width. In **landscape** the controls stay on the side (continuity with the outer display); in **portrait** there is enough height to keep standard horizontal bars. |
| **Hinge** | In the center. Supports many poses, and changes the space available to content as the device folds. |
| **Outer front camera** | In the corner, always visible, vertically aligned with the side controls. It expands into the Dynamic Island for Live Activities. |
| **Inner front camera** | Under the display; hidden until the camera is active, at which point the UI moves aside to show it. |
| **Dynamic Island and status bar** | Redesigned to sit **vertically on the side** of both displays. |
| **Authentication** | **Touch ID in the side button**, not Face ID. Never hardcode "Face ID" in copy or icons; ask the system which biometry is present. |

System UI follows the same logic: Lock Screen controls and the Home Screen Dock sit on the side, and the open Home Screen shows two pages with Today View on the left.

### Hardware numbers (orientation only, never layout inputs)

| | Outer display | Inner display |
|---|---|---|
| Diagonal | 5.4 in | 7.6 in |
| Pixels (Apple tech specs) | 1398 × 2034 at 460 ppi | 1878 × 2670 at 430 ppi |
| Proportion *(derived)* | about 1.45 : 1 | about 1.42 : 1 |
| App Store screenshot | 1398 × 2034 | 2007 × 2853 |

Both displays are far squarer than a bar iPhone (roughly 2.17 : 1). The outer display works out to 466 × 678 pt at @3x *(derived from the pixel size; Apple does not publish point sizes for Duo)*, which is wider and much shorter than a 402 × 874 pt iPhone 17 Pro. The inner display's point size is unpublished; the screenshot size suggests roughly 669 × 951 pt *(third-party inference, unverified)*.

Apple removed per-device dimension tables from the HIG Layout page in the same September 2026 update and tells you to avoid metrics that belong to one particular screen. Use these numbers to picture the device, then lay out against size classes, margins, and safe areas.

## 3. Poses and size classes

People hold and set down the device in many ways: closed, fully open (wide or tall), partially folded like a book, folded like a laptop on a surface, standing like a tent or on its edges.

| Where the app is | Horizontal | Vertical |
|---|---|---|
| Outer display, portrait | compact | regular |
| Outer display, landscape | compact | compact |
| Inner display, any orientation | regular | regular |
| Inner display, in Split View | read it at runtime; don't assume | |

- **The outer display rotates like any iPhone. The inner display does not honor your supported interface orientations.** A portrait-only app still gets resized there, so base layout decisions on size classes, never on interface orientation.
- **Never branch on device idiom or orientation.** They say nothing about available space. Size classes, scene geometry, layout margins, and safe area insets do.
- **Treat a pose change like a window resize**, not like a new screen. Whatever was visible and selected stays visible and selected.

## 4. Vertical controls (the signature pattern)

On Duo, the things that normally sit at the top and bottom move to **one side**, in this order from top to bottom: **Dynamic Island, status bar, toolbar (including navigation buttons), tab bar**. The exception is the inner display in portrait.

Why Apple did it: the outer display is wide and short, so side controls leave the content one unbroken area, they are easier to reach with the thumb, and keeping them on the side when the device opens in landscape preserves continuity.

Two properties are easy to miss:

- **They are hardware-aligned.** They hold the same position relative to the camera and **stay on the same side in right-to-left languages**. This is one of the few places where you must not mirror for RTL.
- **In Split View each app's controls sit on its outer edge**, so the left app has controls on the left.

### Rules

- **Don't override the default bar placement.** Apple treats vertical controls as a core pattern of the device. You get it for free from standard navigation containers; custom bars built on `UIToolbar`, `UINavigationBar`, or `UITabBar` don't.
- **Account for asymmetry.** Controls on one edge make the content area asymmetrical. Use safe areas, and don't assume the insets on opposite sides are equal. In Split View the controls may be on either side of your app.
- **Keep relative positions stable across poses** so people don't relearn where actions live.
- **Follow the standard order.** Top of the axis: primary navigation (Back, Close), then prominent actions (Done). The rest keep their original groupings; the system adds a vertical gap between items that came from the top bar and the bottom bar.
- **Give every toolbar item both a title and a symbol.** The system shows the symbol vertically, the title in overflow menus. An item with only a title, or with a custom view, **is not presented vertically** and stays in a horizontal bar. So keep text-only buttons to a minimum; wide items such as segmented controls stay in the top bar.
- **Set visibility priority.** Items overflow from bottom to top by default. Keep frequently used actions (Compose, New Note) and status-bearing items (anything with a badge) visible longest.
- **Use the system overflow menu.** Move any custom overflow into it, and reserve the ellipsis symbol for overflow only.
- **Group, don't space.** Use toolbar item groups; never add fixed spacing by hand.
- **Decide what survives when space is tight.** Navigation-focused view: toolbar items collapse into overflow and the tab bar stays (the default). Task-focused view: minimize the tab bar and keep the toolbar.
- **Keep controls near the content they affect.** In a two-pane layout, controls for the leading pane stay above that pane; only the trailing pane's controls go to the side.
- **Go full width when there are no bars.** A non-scrolling, immersive view can span the whole display as long as nothing collides with the Dynamic Island or status bar. Calculator does this, switching from four columns of five to five columns of four. A hero image can span full width while the scrolling content stays inset; extend it under the vertical bar with a background extension effect.

### Where the system chooses vertical or horizontal

| Context | Bars |
|---|---|
| Outer display | Vertical |
| Inner display, portrait | Horizontal |
| Split view with several columns | Horizontal for sidebar and content, vertical for detail |
| Inspector | Horizontal |
| Sheet on the outer display | Vertical by default (can be turned off) |
| Sheet on the inner display | Horizontal when centered or leading, vertical when trailing |

## 5. Dynamic layouts and reserved regions

On top of ordinary safe areas, Duo has **reserved regions**: areas content avoids or components adapt to.

| Region | When it exists | Kind |
|---|---|---|
| Outer front camera | Always | Occlusion |
| Inner front camera | Only while the camera is active | Occlusion |
| Folding region | Only while the device is partially open | Division: it splits the inner display into two usable areas |

- **System components already handle them.** Alerts, context menus, and sheets move off the fold; toolbar buttons are nudged aside; split views rebalance their columns so the panes sit symmetrically either side of the fold (Notes goes from a narrow list plus a wide note to two equal panes).
- **Keep interactive elements out of the curve.** Text, images, and controls shift away from the center when the device is partially folded. **Scrolling content doesn't need to avoid it.**
- **Let the fold be a divider.** Prefer containers that adapt on their own. In grids, **prefer an even number of columns** so content divides cleanly.
- **Avoid extreme layout changes while folding.** Shift only what has to move for elements to stay visible and tappable. Controls that vanish or jump are hard to track.
- **Custom views** read the reserved regions and reposition themselves (APIs in §9).
- **Hinge angle is for effects, not layout.** Apple's guidance is to use hinge data for interactions and effects, and the arrangement and region APIs for layout.

## 6. Split views and arrangement views

**Split views** behave exactly as they do between regular and compact widths elsewhere: several panes on the inner display, one pane on the outer display. Use the extra room to **show one more level of the hierarchy**, not a different app. Mail shows either the list or a message when closed, and both side by side when open.

**Arrangement views** are new with Duo. An arrangement view is a container for a **primary** and a **secondary** view that organizes them by display size, orientation, and reserved regions.

| Style | Behavior | Use it when your layout is already |
|---|---|---|
| **Split** | Divides its area between the two views: side by side when wider than tall, stacked when taller than wide. Adjusts around the fold. | Two views side by side or stacked (an `HStack` or `VStack`) |
| **Overlay** | Primary sits on top of secondary when closed or fully open. Partially folded, the two views move to opposite sides of the fold. | One view layered over another (a `ZStack`), such as controls over media |

- You can restrict a split arrangement to one axis, and collapse the secondary view of an overlay.
- **Keep navigation outside.** An arrangement view lays out content; it doesn't navigate. Put navigation split views and tab views around it, never inside it.
- Don't nest it in a navigation split view, list, or scroll view where part of it could become unreachable.

## 7. Multitasking, windows, and the second display

- **Split View comes to iPhone.** Two apps sit side by side on the inner display in a 50/50 split; people can also open two windows of the same app and save app pairs. **All apps participate**, so yours will be shown at half width whether or not you planned for it.
- **Multiple windows.** Duo is the first iPhone to support multiple instances of an app's UI. If the app supports that on iPad, it does on Duo. New windows can't be created on the outer display, so offer "open in new window" through the system activation action, which hides itself when unavailable.
- **Picture in Picture can be pinned** to the top of the screen; the app resizes vertically into what is left. One more reason to resize freely.
- **The outer display as a second surface.** With the device fully open and a camera session running full screen, a camera capture accessory can show UI on the outer display, for example a preview or teleprompter for the person being photographed.
- **StandBy** works on either display, including unplugged.

## 8. Games, media, and camera

- **Games must be playable in every pose.** Locking to portrait or landscape is allowed, but fill the screen as the pose changes. Keep text and control sizes as consistent as possible when resizing. Prefer changing the aspect ratio over letterboxing or pillarboxing; if you can't avoid bars, fill them with artwork.
- **Background art** scales to fill; don't change its aspect ratio and don't leave it cropped by accident.
- **Wide video on a squarish display** *(derived)*. 16:9 content leaves large bands on the inner display. Plan what occupies them: an overlay arrangement puts the video on one side of the fold and the controls or details on the other when the device is propped half open.
- **Camera.** There are three cameras (outer front, inner front, rear). Opening, closing, and rotating can change which display the app is on and flip which way the active camera faces, so choose cameras by the direction they face rather than by a fixed device.

## 9. Adoption: SDK tiers, APIs, testing

### What you get per SDK

| Built with | On iPhone Duo |
|---|---|
| Xcode 26 or earlier | Runs, in a compatibility presentation. Closed: uses the space to the left of the status bar and camera. Open: shown at a conventional iPhone size and aspect ratio. |
| iOS 27 SDK | Extends to the left of the status bar area on the inner display. |
| **iOS 27.1 SDK (Xcode 27.1)** | Extends to the edge of the screen; standard navigation and toolbar buttons lay out vertically. This is the full experience. |

### APIs (all iOS 27.1)

| Need | SwiftUI | UIKit |
|---|---|---|
| Read the fold and cameras | `GeometryProxy.reservedRegions(kind:options:layoutDirectionBehavior:)` → `ReservedRegion` | `UIView.reservedRegions(kind:options:)` → `UIView.ReservedRegion` |
| Two-view adaptive container | `ArrangementView` + `.arrangementViewStyle(.split.axes(.horizontal))` | `UIArrangementViewController` |
| Know whether bars are vertical | `toolbarVerticalEdge` environment value | `verticalBarEdge` trait |
| Opt a view out of vertical bars | `toolbarVerticalBehavior(_:)` | `preferredVerticalBarBehavior` |
| Sheet placement | `presentationPlacement(_:)` | `preferredPlacement` |
| Item in or out of the vertical layout | `axisBehavior(_:)` | `UIBarButtonItem.axisBehavior` |
| Overflow order | `visibilityPriority(_:)` | `UIBarButtonItem.visibilityPriority` |
| Toolbar or tab bar yields first | `ToolbarVerticalCompressionBehavior` | `UIVerticalBarCompressionBehavior` |
| Put items straight into overflow | `ToolbarOverflowMenu` | `additionalOverflowItems` |
| Pin Done; custom Back or Close | `.topBarPinnedTrailing`; `.cancellationAction` | `pinnedTrailingGroup`; `leadingItemGroups` |
| Image under a vertical bar | `backgroundExtensionEffect()` | `UIBackgroundExtensionView` |
| Hinge-driven effects | `onHingeChange` | `UIHingeInteraction` |
| UI on the outer display while shooting | `CameraCaptureAccessory` in `.sceneAccessory` | scene accessories |

Layout hygiene that the tiers assume: size views relative to their container, compute from scene or view bounds rather than screen dimensions, use Auto Layout or SwiftUI layout, track size-class traits, and never use `userInterfaceIdiom` or `UIInterfaceOrientation` for layout.

### Testing

- Run the **iPhone Duo simulator in Device Hub** (Xcode 27.1). Its controls open, close, rotate, and fold the device.
- Walk every view, sheet, and popover through: closed portrait and landscape, open wide and tall, partially folded, and **both sides of Split View**.
- Repeat at the largest Dynamic Type size and in a right-to-left language (checking that the side bar does *not* flip).
- App Store screenshots for Duo use the sizes in §2; App Store Connect lists upload support as coming later in 2026.

## 10. Why it works (philosophy and psychology)

- **Flexibility: keep the person's place** (`references/philosophy.md` §12). Apple's 2026 principle reads almost as a Duo spec: content and controls stay where people expect them, and transitions are eased with natural animation. Opening the device is a context change the design must survive.
- **Familiarity.** It is still iPhone: same components, same hierarchy, same order of controls, only rotated onto another axis. Jakob's Law is why Apple tells you not to override bar placement.
- **Fitts's Law.** On a short, wide display the side edge is the thumb's natural arc, and an edge is an easy target. Priority order plus overflow keeps the frequent action closest.
- **Habituation and spatial memory.** Controls keep their relative positions across poses and stay on the same physical side in every language, so muscle memory transfers.
- **Gestalt (common region, proximity).** The fold becomes a real divider; controls sit beside the pane they affect.
- **Coherence of hardware and software.** Controls align with the camera and the hinge. The pixels acknowledge the object, the same idea as concentricity.
- **Subtraction.** Two size classes instead of a layout per pose: the system absorbs the complexity so neither the designer nor the user has to.

A consideration to weigh *(derived)*: a side bar favors the hand on that side. Keep the usual in-content routes to frequent actions (swipe actions on rows, edge-swipe back) so reach doesn't depend on the bar alone.

## 11. Duo review checklist

- [ ] **Resizes freely.** No fixed widths, breakpoints, or screen-specific metrics; layout driven by size classes, margins, safe areas.
- [ ] **Two layouts, one app.** Compact outside, regular inside; same features, same state, same selection after opening or closing.
- [ ] **No pose-locked functionality.** Everything reachable closed, open, and folded.
- [ ] **Standard navigation containers**, so bars go vertical automatically; default placement not overridden.
- [ ] **Toolbar items have a title and a symbol**; text-only items kept to the few that must stay horizontal.
- [ ] **Visibility priorities set**; primary action and badged items survive overflow; system overflow menu used; ellipsis reserved for it.
- [ ] **Asymmetric safe areas respected**, including the opposite edge in Split View.
- [ ] **Nothing interactive in the folding region** when partially folded; grids use even column counts; layout shifts are small.
- [ ] **Inner display shows one more level of hierarchy** (split view), not a stretched phone screen.
- [ ] **Works at half width** in Split View, on either side.
- [ ] **Vertical bar does not mirror in RTL.**
- [ ] **No "Face ID" assumptions** in copy or icons.
- [ ] **Games and media fill the screen** in every pose; no bare letterbox bars.
- [ ] **Tested in Device Hub** across poses, rotation, Split View, and largest Dynamic Type.

## 12. Anti-patterns

- **A separate "tablet mode"** on the inner display with different features or navigation.
- **A layout per pose**, switched on device model, idiom, orientation, or hinge angle.
- **Custom bars** that stay horizontal on the outer display and eat the vertical space the system was protecting.
- **Centering the primary control on the fold**, or a grid with an odd column count straddling it.
- **Big rearrangements while folding**, so controls disappear or jump.
- **Blowing up the phone layout** to fill the inner display instead of revealing more hierarchy.
- **Assuming a portrait lock holds** on the inner display.
- **Hardcoded point sizes** for either display.

## 13. Reference

- HIG, Designing for iPhone Duo: https://developer.apple.com/design/human-interface-guidelines/designing-for-iphone-duo
- HIG, Layout (size classes; updated September 9, 2026): https://developer.apple.com/design/human-interface-guidelines/layout
- Preparing your app for iPhone Duo (developer overview): https://developer.apple.com/documentation/technologyoverviews/preparing-your-app-for-iphone-duo
- Tech Talk, Design for iPhone Duo: https://developer.apple.com/videos/play/tech-talks/111466
- Tech Talk, Prepare your app for iPhone Duo: https://developer.apple.com/videos/play/tech-talks/111461
- Tech Talk, Raise the bar with iPhone Duo: https://developer.apple.com/videos/play/tech-talks/111462
- Tech Talk, Strike a pose with adaptive layouts on iPhone Duo: https://developer.apple.com/videos/play/tech-talks/111463
- Tech Talk, Leverage multiple displays and scenes on iPhone Duo: https://developer.apple.com/videos/play/tech-talks/111464
- Tech Talk, Build a great camera experience for iPhone Duo: https://developer.apple.com/videos/play/tech-talks/111465
- Apple Newsroom, Apple unveils iPhone Duo: https://www.apple.com/newsroom/2026/09/apple-unveils-iphone-duo/
- iPhone Duo tech specs: https://www.apple.com/iphone-duo/specs/
- App Store screenshot specifications: https://developer.apple.com/help/app-store-connect/reference/app-information/screenshot-specifications
- Apple Design Resources (templates, product bezels for Duo): https://developer.apple.com/design/resources/
