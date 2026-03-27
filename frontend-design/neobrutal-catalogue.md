# Neobrutal UI Component Catalogue

Reference for `/frontend-design` skill. 21 neobrutalism-styled components from [neobrutalui.live](https://www.neobrutalui.live/). Built with Base UI + React + Tailwind CSS. Also available as **plain HTML with Tailwind** (no React needed).

For React projects, copy from: `~/Desktop/Claude/ui-components/neobrutal/components/ui/`
For HTML projects, use the vanilla patterns below.

---

## Design System — The Neobrutalism Rules

Every component follows these rules. When recreating in vanilla HTML/CSS, apply these consistently:

```css
:root {
  --main: #B6ACE4;      /* accent colour — swap per project */
  --bg: #f0eefc;        /* page background */
  --white: #ffffff;      /* component backgrounds */
  --black: #000000;      /* text and borders */
  --radius: 5px;         /* border radius — intentionally small */
  --shadow-brutal: 4px 4px 0px 0px var(--black);  /* THE signature shadow */
}
```

**Core visual rules:**
- `border: 2px solid black` on everything
- `box-shadow: 4px 4px 0px 0px black` (hard offset, no blur)
- Hover: `translate(1px, 1px)` + shadow disappears (pressed-in effect)
- Small border-radius (5px) — not rounded, not sharp
- Bold font weights
- Flat, bright, saturated accent colours — no gradients
- Fonts: geometric sans-serif (Space Grotesk, Public Sans, IBM Plex Sans)

**Theme variants** (swap `--main` and `--bg`):
- Lavender: `#B6ACE4` / `#f0eefc`
- Mint: `#97ee88` / `#eefbec`
- Peach: `#f5a8a8` / `#fef0f0`
- Sky: `#88c8ee` / `#ecf5fb`
- Lemon: `#f5e888` / `#fefaec`

---

## Components (21)

### Button
Variants: default (accent bg + brutal shadow), noShadow (accent bg, flat), neutral (white bg + brutal shadow). All: `border-2 border-black`, hover slides 1px and drops shadow.
**Vanilla:** `border: 2px solid black; box-shadow: 4px 4px 0 0 black; transition: all 0.1s;` + `:hover { transform: translate(1px, 1px); box-shadow: none; }`

### Card
Container with black border + brutal shadow. Sub-components: Header, Title (bold 2xl), Content, Footer.
**Vanilla:** `border: 2px solid black; box-shadow: 4px 4px 0 0 black; border-radius: 5px; padding: 1rem; background: white;`

### Accordion
Collapsible sections with black borders. Trigger has chevron that rotates on open. Content slides down with animation.
**Vanilla:** `details`/`summary` HTML elements styled with black borders. Chevron via CSS `transform: rotate(180deg)` transition.

### Alert
Bordered alert box with icon, title, description. Same brutal shadow treatment.
**Vanilla:** Div with `border: 2px solid black`, left accent border in colour, brutal shadow.

### Avatar
Circular image with black border. Fallback shows initials on accent background.
**Vanilla:** `border-radius: 50%; border: 2px solid black; overflow: hidden;`

### Badge
Small label with accent bg, black border. Variants for different colours.
**Vanilla:** `display: inline-flex; border: 2px solid black; border-radius: 5px; padding: 2px 8px; font-weight: bold; font-size: 0.75rem;`

### Checkbox
Square checkbox with black border. Checked state fills with accent colour + checkmark.
**Vanilla:** Custom checkbox via `appearance: none; border: 2px solid black; width: 20px; height: 20px;` + `:checked { background: var(--main); }`

### Dialog
Modal with brutal shadow, black border, backdrop overlay. Slides in with animation.
**Vanilla:** `<dialog>` element + `border: 2px solid black; box-shadow: 4px 4px 0 0 black;` + backdrop via `::backdrop { background: rgba(0,0,0,0.5); }`

### Input
Text input with black border. Focus adds accent ring. Clean, bold styling.
**Vanilla:** `border: 2px solid black; border-radius: 5px; padding: 8px 12px;` + `:focus { outline: 2px solid var(--main); outline-offset: 2px; }`

### Label
Bold text label for form fields.
**Vanilla:** `font-weight: 700; font-size: 0.875rem;`

### Pagination
Page navigation with numbered buttons. Active page gets accent bg. All buttons have black borders.
**Vanilla:** Flex container of buttons, each with `border: 2px solid black`. Active: `background: var(--main);`

### Popover
Floating panel triggered by click. Black border + brutal shadow. Positioned with arrow.
**Vanilla:** Absolute-positioned div with brutal shadow. Toggle via JS click handler. CSS `opacity`/`transform` transition.

### Progress
Horizontal progress bar. Outer has black border, inner fills with accent colour.
**Vanilla:** `border: 2px solid black; border-radius: 5px; height: 20px;` Inner: `background: var(--main); width: var(--progress); transition: width 0.3s;`

### Radio Group
Radio buttons with black borders. Selected fills with accent colour.
**Vanilla:** Custom radios via `appearance: none; border: 2px solid black; border-radius: 50%; width: 20px; height: 20px;` + `:checked` inner dot.

### Select
Dropdown select with black border + brutal shadow. Chevron indicator. Options panel drops down.
**Vanilla:** Custom select wrapper with `border: 2px solid black; box-shadow: 4px 4px 0 0 black;` Dropdown via absolute-positioned list.

### Slider
Range slider with track (black border) and thumb (accent colour, black border, brutal shadow).
**Vanilla:** Custom range via `appearance: none` + `::-webkit-slider-thumb { border: 2px solid black; background: var(--main); box-shadow: 4px 4px 0 0 black; }`

### Switch
Toggle switch with black border. On state fills with accent colour. Thumb slides with transition.
**Vanilla:** `width: 44px; height: 24px; border: 2px solid black; border-radius: 12px;` Thumb: `transform: translateX(0/20px); transition: transform 0.2s;`

### Tabs
Tab navigation with accent underline/background on active. Black borders on tab container.
**Vanilla:** Flex tabs, active tab gets `background: var(--main); border: 2px solid black;` Content panels toggle via `display: none/block`.

### Textarea
Multi-line input with black border, same styling as Input.
**Vanilla:** `border: 2px solid black; border-radius: 5px; padding: 8px 12px; resize: vertical;`

### Toast
Notification popup with black border + brutal shadow. Slides in from edge. Auto-dismisses.
**Vanilla:** Fixed-position div with brutal shadow. Entrance: `transform: translateX(100%)` → `translateX(0)`. Auto-dismiss via `setTimeout`.

### Tooltip
Small floating label on hover. Black border + accent bg.
**Vanilla:** Absolute-positioned span, `opacity: 0` → `opacity: 1` on parent `:hover`. `border: 2px solid black; background: var(--main); padding: 4px 8px;`

---

## When to use Neobrutal

- **Workshop landing pages** — stands out, says "this isn't boring"
- **Creative tools** — playful, rebellious feel
- **Personal projects** — personality over polish
- **Internal tools** — bold, clear, no-nonsense UI
- **Anything targeting developers/creators** — they appreciate the aesthetic

## When NOT to use Neobrutal

- Enterprise/corporate clients (too casual)
- Luxury/premium positioning (wrong tone)
- Sites that need to feel "trustworthy" to conservative audiences

## CLI Reference

```bash
# Init in a project
npx neobrutal init

# Add specific components
npx neobrutal add button card dialog

# Add all components
npx neobrutal add -a

# List available components
npx neobrutal list

# Check for updates
npx neobrutal diff button
```
