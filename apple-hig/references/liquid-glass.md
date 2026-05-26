# Liquid Glass

Apple's design language introduced at WWDC 2025 (June 9, 2025) — the most extensive software design overhaul since iOS 7 in 2013. For the first time, one design language spans every platform at once: iOS 26, iPadOS 26, macOS Tahoe 26, watchOS 26, tvOS 26, and visionOS 26. Led by Alan Dye, VP of Human Interface Design. This file covers what it is, the guidance, the accessibility behavior, and the adoption APIs.

## Table of contents
- What it is
- Two variants
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
- **Regular glass** — the default. Legible by design, with enough adaptation and built-in contrast handling to use broadly across chrome and controls.
- **Clear glass** — more transparent, for media-rich surfaces where you want content to show through (e.g. video contexts like AVKit). It demands extra care: add scrims, dimming, or other legibility treatments because it does little to guarantee text contrast on its own.

> Default to Regular glass. Reach for Clear glass only when rich content behind the surface is the point, and then protect legibility deliberately.

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
- Let native components adopt the material; lean on the system look rather than re-skinning it.
- Keep chrome minimal and let content extend to the edges beneath translucent bars.
- Use clear, unambiguous SF Symbols in toolbars so icons can stand on their own.
- Group related controls so the system can render and morph them as a cohesive glass cluster.
- Verify contrast on every glass surface that carries text or controls.

**Don't**
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

This automatic adaptation is one of the strongest reasons to adopt native components rather than re-creating the look manually — hand-rolled glass won't get this for free. Still verify contrast ratios on custom surfaces (see `references/accessibility.md`).

## Adoption strategy (the fast path)
1. **Recompile against the iOS 26 / macOS Tahoe 26 SDK.** Apps already built with SwiftUI/UIKit/AppKit native components in iOS 18 adopt the new design largely automatically once rebuilt against the new SDK.
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

## Performance
The material is **GPU-intensive**, especially in scrollable or frequently updated views. Reserve it for **static, top-level surfaces** — tab bars, toolbars, navigation chrome — and avoid it on list rows, cells, or anything animating per frame. Build reusable glass components so polish, accessibility, and performance are solved once.

## App icons
Liquid Glass extends to app icons: layered, translucent compositions with blur, specular highlights, and shadows that respond to dynamic lighting, authored in **Icon Composer** and rendered across Default / Dark / Mono (and Clear/Tinted) appearances. See `references/foundations.md` (§ App icons) for the full icon workflow, sizes (1024px master, 1088px watchOS), and the still-required 1024 PNG for submission.

## Reference
- Apple Newsroom — "Apple introduces a delightful and elegant new software design": https://www.apple.com/newsroom/2025/06/apple-introduces-a-delightful-and-elegant-new-software-design/
- Adopting Liquid Glass (technology overview): https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass
- WWDC25 session 219 — Meet Liquid Glass: https://developer.apple.com/videos/play/wwdc2025/219/
- WWDC25 session 356 — Get to know the new design system: https://developer.apple.com/videos/play/wwdc2025/356/
- WWDC25 session 220 — Say hello to the new look of app icons: https://developer.apple.com/videos/play/wwdc2025/220/
- New design gallery (2026): https://developer.apple.com/design/new-design-gallery-2026/
- HIG — Materials: https://developer.apple.com/design/human-interface-guidelines/materials
