# UseLayouts Component Catalogue

Reference for `/frontend-design` skill. These are design patterns from [uselayouts.com](https://uselayouts.com) — an animated React micro-interaction library. When building vanilla HTML/CSS/JS, recreate the *feel* described below using CSS transitions, CSS animations, and minimal vanilla JS.

For React projects (get.cclarity.io, MossOwl), copy components directly from: `~/Desktop/Claude/ui-components/registry/default/example/`

---

## Layout & Grid Components

### bento-card
Tabbed dashboard card with animated sidebar. Active tab has a pill-shaped highlight that slides between items using shared layout animation. Content area crossfades. Spring physics: stiffness ~200, damping ~20.
**Vanilla approach:** CSS grid + absolute-positioned pill with `transition: top 0.3s cubic-bezier(0.34, 1.56, 0.64, 1)`. Crossfade content with opacity transitions.

### magnified-bento
Horizontal scrolling tag carousel with a draggable magnifying lens. Two layers: normal and zoomed (scale 1.25). Dragging the lens reveals the zoomed layer via CSS clip-path circle. Rows scroll in alternating directions.
**Vanilla approach:** Two identical layers, top layer clipped with `clip-path: circle()` following mouse position via JS. `transform: scale(1.25)` on the zoomed layer.

### fluid-expanding-grid
2-row image gallery. Clicking a card expands it to full width, pushing its neighbour to the other row. Smooth layout reflow with spring transitions.
**Vanilla approach:** CSS grid with `grid-template-columns` transitions. Toggle between `1fr 1fr` and `2fr 0fr` on click. Use `transition: grid-template-columns 0.4s ease`.

### stacked-list
Member directory with collapsible footer bar. Avatars morph between collapsed (small circles) and expanded (full list) states. Staggered entry animations for list items.
**Vanilla approach:** CSS transitions on height/width. Stagger with `transition-delay: calc(var(--i) * 50ms)` per item.

---

## Navigation & Tabs

### discrete-tabs
Tab buttons where active tab expands horizontally to show text + icon, inactive show icon only. Shine/sparkle effect on first activation. Spring: stiffness 230, damping 20.
**Vanilla approach:** `width: auto` transition with `overflow: hidden`. Active tab gets `max-width: 200px`, inactive `max-width: 40px`. Shine via CSS `@keyframes` gradient sweep.

### vertical-tabs
Service showcase: left sidebar tabs with auto-play progress bar, right image carousel. Direction-aware slide transitions (up/down based on which tab you came from). Hover pauses auto-play.
**Vanilla approach:** CSS `transform: translateY(±100%)` with direction class toggled via JS. Progress bar via CSS animation `width: 0 to 100%` with `animation-play-state: paused` on hover.

### bottom-menu
Bottom navigation bar with expandable submenus. Dynamic height measurement for smooth open/close. Icons with labels.
**Vanilla approach:** Fixed bottom bar, submenu with `max-height: 0` → `max-height: var(--content-height)` transition. Measure content height with JS on mount.

### smooth-dropdown
Hamburger button that expands into a 220px dropdown. Button shrinks to icon when open. Menu items slide in staggered. Outside click closes.
**Vanilla approach:** `width` transition from 40px to 220px. Staggered items via `transition-delay`. `document.addEventListener('click', closeOnOutside)`.

---

## Cards & Content

### pricing-card
Pricing tiers with monthly/yearly toggle and user count adjuster. Selected plan expands to reveal features with staggered checkmarks. Animated number transitions for price changes.
**Vanilla approach:** Expandable card with `max-height` transition. Number animation via `CountUp.js` or CSS `@property` counter. Stagger checkmarks with delays.

### shake-testimonial-card
Stacked testimonial cards that auto-rotate every 1.5s. Top card shakes (scale wobble + horizontal translate) then slides off-screen. Remaining cards cascade down. Click to advance.
**Vanilla approach:** Absolute-positioned stack with `z-index`. Exit animation: `@keyframes shake { 0% { scale(1) } 25% { scale(1.05) translateX(-5px) } ... }` then `translateY(-150%)`. Cards below shift up.

### empty-testimonial
Empty state with 3D folder. Click opens the folder — paper sheets fan outward with different spring curves. Envelope tilts back with `rotateX` for depth.
**Vanilla approach:** CSS `perspective` + `rotateX`/`rotateY` transforms. Each sheet has different `transition-duration` and `cubic-bezier` for staggered feel.

### 3d-book
Interactive book that rotates in 3D based on cursor position. Uses CSS 3D transforms (`rotateY`) mapped to mouse X position via linear interpolation.
**Vanilla approach:** `perspective: 1000px` container. JS `mousemove` maps `clientX` to `rotateY(-30deg to 30deg)`. Apply with `transform` and `transition: transform 0.1s`.

---

## Buttons & Micro-interactions

### status-button
Save button with three states: idle → loading (spinner) → success (checkmark). Text letters pop in/out individually. Status indicator scales and blurs between states.
**Vanilla approach:** Three-state class toggle. Letter animation via `span` per character with staggered `transition-delay`. Spinner via CSS `@keyframes rotate`. Success checkmark scales in.

### delete-button
Two-state delete: first click shows confirmation countdown, characters stagger-animate. Second state has countdown timer before auto-cancel.
**Vanilla approach:** Split text into `span` elements. Stagger with `transition-delay: calc(var(--i) * 30ms)`. Countdown via `setInterval`.

### discover-button
Search bar that expands on click. Tab switcher inside with animated "bubble" indicator that slides between options.
**Vanilla approach:** `width` transition from icon-only to full bar. Bubble indicator via absolutely-positioned element with `left` transition.

---

## Carousels & Galleries

### feature-carousel
Vertical feature list on left (blue panel), image card stack on right. Active image centred at full opacity, prev/next offset and scaled down with rotation. Auto-plays every 3s.
**Vanilla approach:** Absolute-positioned cards. Active: `transform: none; opacity: 1`. Prev: `translateX(-30%) scale(0.85) rotateY(5deg); opacity: 0.5`. Transition all properties.

### expandable-gallery
Collapsed: 3 overlapping photos at angles. Click expands to grid (2-col mobile, 3-col desktop). Cards morph from staggered to aligned positions.
**Vanilla approach:** Collapsed state uses absolute positioning with `rotate()` and `translate()`. Expanded toggles to CSS grid. Use `transition: all 0.5s` on each card. FLIP animation technique for best results.

### animated-collection
View switcher (list / card / pack). Items morph between layouts with spring transitions. Pack view stacks items like a deck of cards.
**Vanilla approach:** Three layout modes via CSS classes. FLIP technique: measure before, apply class, measure after, animate delta. Or use `View Transitions API`.

---

## Forms & Inputs

### morphing-input
Search input where clicking an icon cycles placeholder text. Each character flips in/out with `rotateX` 3D animation + blur, staggered by 15ms per character.
**Vanilla approach:** Split placeholder into `span` elements. Exit: `rotateX(90deg) + blur(3px)`. Enter: `rotateX(0)`. Stagger with `transition-delay`.

### inline-edit
Username field toggles between read-only and edit mode. Icons swap with spring entrance/exit. Focus ring appears in edit mode.
**Vanilla approach:** Toggle `contenteditable` or swap `span`/`input`. Icon swap via `opacity` + `scale` transitions with slight offset timing.

### multi-step-form
3-step wizard with directional slide transitions. Card height animates to fit content. Step indicator dots scale. Content slides left/right based on navigation direction.
**Vanilla approach:** `overflow: hidden` container. Steps positioned with `translateX(±110%)`. Active step at `translateX(0)`. Height transition via JS measuring content. Direction class determines slide direction.

### day-picker
Frequency selector (daily/weekly/custom) with modal day picker. Blur effects on background. Spring: stiffness 400, damping 30.
**Vanilla approach:** Modal overlay with `backdrop-filter: blur(8px)`. Day chips with `:active` scale animation. Toggle states with CSS classes.

---

## Toolbars & Menus

### dynamic-toolbar
Horizontal toolbar pill with two panels. Expand button slides to reveal secondary tools. Width animates to fit each panel. Icons blur when in opposite state.
**Vanilla approach:** `overflow: hidden` container with `width` transition. Inner flex container with `translateX`. `filter: blur(2px)` on inactive icons.

### list-item
Circular filter button that expands to dropdown. 6 categories slide in staggered. Shared layout between button icon and menu.
**Vanilla approach:** Button expands to dropdown via `width`/`height` transition. Items stagger in with `transition-delay: calc(var(--i) * 40ms)`.

---

## Special Effects

### folder-interaction
3D folder that opens to reveal fanning paper sheets. Each sheet has different spring stiffness/damping for staggered response. Glossy folder lid with blur filter.
**Vanilla approach:** `perspective` container. Sheets with `rotateX` transitioning from `90deg` (closed) to individual angles. `backdrop-filter: blur()` on lid. Different `transition-timing-function` per sheet.

### bucket
Rotating chip carousel inside an SVG bucket shape. Auto-plays every 2s. Mobile-responsive with `useIsMobile` detection.
**Vanilla approach:** Circular arrangement of chips with `@keyframes rotate` on the container. Or vertical carousel with `translateY` cycling.
