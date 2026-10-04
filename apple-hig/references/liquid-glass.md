# Liquid Glass

Apple's design language introduced at WWDC 2025 (June 9, 2025) — the most extensive software design overhaul since iOS 7 in 2013. For the first time, one design language spans every platform at once: iOS 26, iPadOS 26, macOS Tahoe 26, watchOS 26, tvOS 26, and visionOS 26. It was refined, not replaced, in the **27 generation** (iOS 27, iPadOS 27, macOS 27, watchOS 27, tvOS 27, visionOS 27; released September 14, 2026). This file covers what it is, what changed in 27, the guidance, the accessibility behavior, and the adoption APIs.

## Table of contents
- What it is
- Two variants
- What changed in the 27 generation
- Lineage
- The design system that comes with it
- Design guidance — do / don't
- Accessibility (handled automatically for system components)
- Adoption strategy (the fast path)
- SwiftUI APIs
- UIKit / AppKit APIs
- Toolbars & scroll-edge effects
- Performance
- App icons
- Reference

## What it is
Liquid Glass is a translucent, dynamic **meta-material** that behaves like real glass: it reflects and refracts surrounding content, bends light, and reacts to touch, pointer, and motion in real time with specular highlights. Its color is informed by the content behind and around it, and it adapts intelligently between light and dark environments. The intent is **deference** — chrome recedes so content takes priority, while controls feel alive and tactile.

It applies across the system to navigation bars, tab bars, toolbars, sidebars, controls (buttons, sliders, switches), the Dock, Control Center, alerts, widgets, and app icons. Controls now sit **concentric** with the rounded corners of modern hardware and app windows rather than being designed for rectangular screens.

## Two variants
- **Regular glass** — the default. It blurs and adjusts the luminosity of what is behind it to keep text and foreground elements legible. Most system components use it. Use it whenever the background could hurt legibility or the component carries a lot of text (alerts, sidebars, popovers).
- **Clear glass** — highly translucent, for components floating over visually rich media (photos, video) where the content should stay prominent. It does little to guarantee contrast on its own, so decide on a dimming layer: **if the content behind is bright, add a dark dimming layer of about 35% opacity**; if it is already dark, or you use AVKit's standard playback controls (which bring their own), you don't need one.

> Default to Regular glass. Reach for Clear glass only when rich content behind the surface is the point, and then protect legibility deliberately.

Both variants can look different on a given device: the HIG notes their appearance changes with the look a person has picked for Liquid Glass in Settings, and when Reduce Transparency or Increase Contrast is on.

## What changed in the 27 generation
The second year kept the language and the APIs and changed the tuning. What matters for design:

- **A user-facing Liquid Glass slider.** Settings now lets each person set Liquid Glass anywhere between nearly clear (the ultraclear end) and fully tinted. Transparency is no longer only an accessibility toggle; it is an everyday preference. **Design and test across the whole range.** Nothing may depend on seeing through the glass (at fully tinted you can't) or on the glass being opaque (at ultraclear it isn't).
- **More uniform refraction and better contrast**, plus sharper, more defined app icons. Apple presents the pass as a move toward focus and approachability. Legibility won over spectacle.
- **The opt-out is gone.** `UIDesignRequiresCompatibility`, the Info.plist key that kept the pre-Liquid Glass look, is **ignored when you build for iOS 27, iPadOS 27, Mac Catalyst 27, macOS 27, or tvOS 27 or later**. Any app on the 27 SDK is a Liquid Glass app.
- **No new Liquid Glass API to learn.** `glassEffect`, `GlassEffectContainer`, `.glassProminent`, and `ToolbarSpacer` are unchanged from iOS 26. Apps pick up the refined look and respond to the slider automatically when rebuilt.
- **macOS 27**: more uniform toolbars, edge-to-edge sidebars, colored sidebar icons, and custom glass elements can be marked interactive as on iOS.
- **iPhone Duo (iOS 27.1)** moves the glass control layer to the side of the display. Same material, same rules, new axis. See `references/iphone-duo.md`.

## Lineage
Aqua (Mac OS X) → the flat turn of iOS 7 (2013) → the depth and layering of iPhone X → the spatial, glass-like UI of visionOS → Liquid Glass, which generalizes the visionOS material to every Apple platform.

## The design system that comes with it
Liquid Glass is not just a material; it ships with a refreshed system aesthetic:
- **Neutral, content-deferential palette** — chrome stays quiet so app content and brand color lead.
- **Bolder, left-aligned typography** — larger, heavier titles, predominantly left-aligned, for clear hierarchy.
- **Concentricity** — nested rounded shapes share a common center and consistent corner radii, aligning controls to hardware and window curvature.
- **Content-first layering** — edge-to-edge content with minimal chrome floating above it on glass.

## Design guidance — do / don't
**Do**
- Keep glass to the **functional layer**: controls and navigation floating above content. That separation is the whole point of the material.
- Let native components adopt the material; lean on the system look rather than re-skinning it.
- Keep chrome minimal and let content extend to the edges beneath translucent bars.
- Use clear, unambiguous SF Symbols in toolbars so icons can stand on their own.
- Group related controls so the system can render and morph them as a cohesive glass cluster.
- Verify contrast on every glass surface that carries text or controls, at both ends of the Liquid Glass slider.
- **Put brand color in the content layer**, where it scrolls beneath the glass and gets picked up by it. On controls, use the accent color sparingly: primary actions and status indicators such as badges or the selected tab.
- If the content layer is already bright and colorful, keep tab bars monochrome or pick an accent that clearly differs from it.

**Don't**
- **Don't use Liquid Glass in the content layer.** Use standard materials for content surfaces such as backgrounds. The one exception is a control with a transient interactive element (a slider thumb, a toggle), which takes on glass while it is being operated.
- Don't spread glass across many custom controls. The HIG reserves it for the few functional elements that matter most.
- Don't mix text and an icon inside a single glass element — it reads as one button and confuses tap targets. Use one or the other per element.
- Don't stack glass on glass; layering translucent materials muddies legibility.
- Don't over-tint or over-badge — tint and badges are occasional accents, not defaults.
- Don't put Liquid Glass on high-frequency surfaces like list rows or per-frame animations (see Performance).
- Don't fight the system palette with heavy custom chrome that competes with content.

## Accessibility (handled automatically for system components)
When you use native components, Liquid Glass already responds to the user's accessibility settings:
- **Reduce Transparency** → surfaces become frostier/more opaque, reducing background bleed-through.
- **Increase Contrast** → the system adds borders and flattens translucency to sharpen edges and text.
- **Reduce Motion** → the elastic, fluid responses are dropped in favor of simpler transitions.
- **The Liquid Glass slider (27 generation)** → system components follow the person's chosen look, from ultraclear to fully tinted, with no work from you.

This automatic adaptation is one of the strongest reasons to adopt native components rather than re-creating the look manually — hand-rolled glass won't get this for free. Still verify contrast ratios on custom surfaces (see `references/accessibility.md`).

## Adoption strategy (the fast path)
1. **Recompile against the current SDK (27).** Apps built with SwiftUI/UIKit/AppKit native components adopt the design largely automatically once rebuilt. On the 26 SDK you could postpone with `UIDesignRequiresCompatibility`; on the 27 SDK that key is ignored, so there is no compatibility mode to hide in.
2. **Use native controls everywhere it's possible** — tab bars, sheets, toolbars, navigation. The more native components you use, the more of the redesign you get with zero custom work.
3. **Remove legacy translucency hacks** that now conflict with the system material — e.g. manual `.presentationBackground()` overrides, `UIBlurEffect`, and `UIVisualEffectView` blur workarounds that predate the material.
4. **Then fine-tune** with the new APIs only where the defaults aren't enough.

## SwiftUI APIs
- `.glassEffect()` — apply the material to a view (optionally shaped/tinted/interactive variants).
- `GlassEffectContainer` — group multiple glass elements so they blend and morph together when close; required for fluid shape transitions between elements.
- `matchedGeometryEffect` — drive smooth morphs between glass shapes across state changes.
- `.glassProminent` — a prominent glass button style for primary/confirming actions.

```swift
Text("Hello, World!")
    .font(.title)
    .padding()
    .glassEffect()
```

## UIKit / AppKit APIs
- `UIGlassEffect` applied through a `UIVisualEffectView` is the UIKit entry point. Glass views placed within a container's spacing blend their shapes together for a fluid appearance.

```swift
let glassEffect = UIGlassEffect()
let glassView = UIVisualEffectView(effect: glassEffect)
```

## Toolbars & scroll-edge effects
- The toolbar/tabs APIs largely keep the same shape and pick up the glass look without code changes; new APIs only fine-tune behavior.
- **`ToolbarItemPlacement` controls both placement and appearance.** `.confirmationAction` automatically applies the `.glassProminent` style for the primary action; `.cancellationAction` for cancel.
- **Tint and badge sparingly** — `.tint(...)` and `.badge(...)` on toolbar items are occasional accents; rely on placement semantics first.
- **Never mix text and icon in one glass toolbar element** (see do/don't above).
- **Scroll-edge effects** keep titles and controls legible as content scrolls beneath translucent bars. In UIKit: `scrollView.topEdgeEffect.style = .automatic` and `scrollView.bottomEdgeEffect.style = .hard`; individual edges can be hidden (`scrollView.leftEdgeEffect.isHidden = true`). `.automatic` lets the system choose; `.hard` gives a defined edge.
- **Scroll-edge rules (HIG, refined June 2026):** prefer the **automatic** style, which already gives a more opaque separation for crowded top toolbars, text outside glass controls, and pinned table headers; if you choose **soft**, test legibility thoroughly. Use an edge effect **only where a scroll view sits behind floating elements**: it isn't decoration and it isn't a dimming overlay. Apply **one per view**; in split layouts each pane may have its own, kept at a consistent height.
- **Don't put a solid or semi-opaque background behind bars.** Use the scroll-edge effect, and extend full-bleed backgrounds under sidebars, toolbars, and tab bars. Where a sidebar or inspector would cover the important part of an image, use the **background extension effect** (`backgroundExtensionEffect()` / `UIBackgroundExtensionView`), which mirrors and blurs the image beneath it.

## Performance
The material is **GPU-intensive**, especially in scrollable or frequently updated views. Reserve it for **static, top-level surfaces** — tab bars, toolbars, navigation chrome — and avoid it on list rows, cells, or anything animating per frame. Build reusable glass components so polish, accessibility, and performance are solved once.

## App icons
Liquid Glass extends to app icons: layered, translucent compositions with blur, specular highlights, and shadows that respond to dynamic lighting, authored in **Icon Composer** and rendered across Default / Dark / Mono (and Clear/Tinted) appearances. The current Icon Composer adds per-layer **Refraction** (layers pick up color and shape from what is behind them) and covers iPhone, iPad, Mac, and Apple Watch from one file; existing Icon Composer files render with the sharper 27-generation material automatically. See `references/foundations.md` (§ App icons) for the full icon workflow, sizes (1024px master, 1088px watchOS), and the still-required 1024 PNG for submission.

## Reference
- Apple Newsroom — "Apple introduces a delightful and elegant new software design": https://www.apple.com/newsroom/2025/06/apple-introduces-a-delightful-and-elegant-new-software-design/
- Adopting Liquid Glass (technology overview): https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass
- Apple Newsroom — "Major updates for Apple's software platforms are now available" (September 14, 2026; slider, refinements): https://www.apple.com/newsroom/2026/09/major-updates-for-apples-software-platforms-are-now-available/
- `UIDesignRequiresCompatibility` (ignored from the 27 SDKs): https://developer.apple.com/documentation/bundleresources/information-property-list/uidesignrequirescompatibility
- WWDC26 session 269 — What's new in SwiftUI: https://developer.apple.com/videos/play/wwdc2026/269/
- WWDC25 session 219 — Meet Liquid Glass: https://developer.apple.com/videos/play/wwdc2025/219/
- WWDC25 session 356 — Get to know the new design system: https://developer.apple.com/videos/play/wwdc2025/356/
- WWDC25 session 220 — Say hello to the new look of app icons: https://developer.apple.com/videos/play/wwdc2025/220/
- New design gallery (2026): https://developer.apple.com/design/new-design-gallery-2026/
- HIG — Materials: https://developer.apple.com/design/human-interface-guidelines/materials
- HIG — Color (Liquid Glass color): https://developer.apple.com/design/human-interface-guidelines/color
- HIG — Branding (brand color in the content layer; September 2026): https://developer.apple.com/design/human-interface-guidelines/branding
- HIG — Scroll views (scroll edge effects): https://developer.apple.com/design/human-interface-guidelines/scroll-views
- Icon Composer: https://developer.apple.com/icon-composer/
