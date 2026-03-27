# TripleD UI Component Catalogue

Reference for `/frontend-design` skill. 137 components from [ui.tripled.work](https://ui.tripled.work/components) — full page blocks, cards, native components, transitions, and decorative effects. Built with React + Framer Motion + shadcn/ui + Tailwind.

For React projects, copy from: `~/Desktop/Claude/ui-components/tripled/packages/components/`

When building vanilla HTML/CSS/JS, use the descriptions below to recreate the design pattern and feel.

---

## Native Components (28)

Small, reusable interactive elements with polished animations.

| Component | What it does | Vanilla approach |
|---|---|---|
| **user-card** | Profile card with avatar, name, handle, action button | Card with flexbox, hover scale transition |
| **tooltip** | Glassmorphism tooltip with spring animations | `backdrop-filter: blur()` + `opacity`/`transform` transition on hover |
| **likes-counter** | Interactive counter with avatar stack, popup details | Overlapping avatars via negative margin, counter with CSS `@property` animation |
| **dialog** | Glassmorphism modal with backdrop blur | `<dialog>` element + `backdrop-filter: blur(12px)` + scale/opacity transition |
| **social-login-button** | Animated social auth buttons (GitHub, Google, X) | Buttons with brand colours, hover `translateY(-2px)` + `box-shadow` grow |
| **button** | Glassmorphism button with smooth animations | `backdrop-filter: blur()` + gradient border + hover brightness shift |
| **tabs** | Sliding background indicator between tabs | Absolutely-positioned pill with `left`/`width` transition following active tab |
| **typewriter** | Typewriter effect with speed control, looping, cursor | JS `setInterval` adding characters, CSS blinking cursor via `@keyframes` |
| **flip-text** | 3D blur word flip transition | `rotateX(90deg)` + `filter: blur(4px)` exit, `rotateX(0)` enter, per-word swap |
| **badge** | Glass, glow, outline variant badges | CSS variants with `backdrop-filter`, `box-shadow: 0 0 15px`, border styles |
| **counter-up** | Animated number counter with easing | `@property --num` counter animation, or JS `requestAnimationFrame` easing |
| **magnetic** | Cursor-following magnetic effect on content | JS `mousemove` calculates offset, apply `transform: translate()` with spring easing |
| **notification-bell** | Bell with badge and ringing animation | `@keyframes ring { rotate(-15deg) → rotate(15deg) }` + red dot badge |
| **verified-badge** | Multiple variants (outline, shield) | SVG checkmark + CSS variant classes |
| **morphing-button** | FAB that morphs into action menu | `width`/`height`/`border-radius` transition from circle to rectangle, staggered menu items |
| **liquid-button** | Liquid fill effect with progress tracking | CSS `background-size` or `clip-path` animation filling left-to-right |
| **avatar-expand** | Avatar expands to reveal name on click | `max-width` transition from avatar-only to avatar+text |
| **avatar-with-name** | Hover shows directional name tooltip | `opacity` + `translateY` tooltip, direction detected via mouse enter position |
| **image-checkbox** | Image with grayscale filter toggle | `filter: grayscale(1)` → `grayscale(0)` on check, checkmark overlay with `scale` transition |
| **delete** | Expand to confirmation button | `width` transition, text swap with `opacity` crossfade |
| **start-now** | Sparkle effects + loading states | CSS `@keyframes sparkle` particles + spinner state toggle |
| **follow-cursor** | Label follows cursor with spring physics | JS `mousemove` + `transform: translate()` with CSS `transition: transform 0.15s` |
| **hover-card** | Avatar expands on hover to profile info | `max-height`/`opacity` transition on hover, card grows to show details |
| **bottom-modal** | Slide-up modal with glassmorphism | `transform: translateY(100%)` → `translateY(0)` + `backdrop-filter: blur()` |
| **nested-list** | Expandable tree with animations | `max-height` transition per node, indent via `padding-left`, chevron rotation |
| **profile-notch** | Dynamic Island-style expanding notch | `width`/`height`/`border-radius` transition, spring easing |
| **notch** | Draggable Dynamic Island with expandable content | Drag via JS, `width`/`height` morph, spring physics |
| **folder-animation** | Folder card with motion blur effect | CSS `filter: blur()` on translate, folder open via `rotateX` |

---

## Blocks (36)

Full page sections ready to compose into landing pages.

| Block | What it does | Use for |
|---|---|---|
| **glowy-waves-hero** | Hero with glowing wave effects | Landing page hero with atmosphere |
| **stocks-dashboard** | Portfolio dashboard with data table + modal | SaaS dashboard reference |
| **dashboard** | Interactive dashboard with status cards | Product dashboard layout |
| **hero-block** | Portfolio hero with animated avatar, staggered text, socials | Personal brand landing (keithteo.ai) |
| **testimonials-block** | Animated grid with star ratings, hover effects | Social proof section |
| **cta-block** | CTA with gradient overlay, animated buttons, status indicator | Conversion section |
| **contact-block** | Contact form with animated info cards, working hours | Contact page |
| **new-hero-section** | Gradient background, animated stats, CTA buttons | Product landing hero |
| **about-us-section** | Value cards with icons and reveal effects | About page |
| **contact-form-section** | Animated inputs with validation | Contact forms |
| **our-services-section** | Service cards with badges and hover animations | Services page |
| **team-section-block** | Team cards with avatars, roles, socials | Team page |
| **newsletter-signup-block** | Subscription form with success state, gradient bg | Email capture |
| **feature-comparison-block** | Pricing comparison table with animated checkmarks | Pricing page |
| **gallery-grid-block** | Filterable gallery with lightbox | Portfolio/gallery |
| **footer-block** | Links, newsletter signup, socials, scroll-to-top | Site footer |
| **cta-hero-block** | Email signup + video preview + social proof | High-conversion hero |
| **bento-grid-block** | Layered bento grid with metrics, motion reveals | Feature showcase |
| **services-grid-block** | 8-column responsive grid with icons | Services overview |
| **stats-counter-block** | Animated counters with icons, gradient bg | Stats/metrics section |
| **notion-blog-page** | Notion-style page with rich text, toggles | Blog post layout |
| **timeline-block** | Vertical timeline with alternating cards, progress line | Company history / roadmap |
| **faq-accordion-block** | Expandable FAQ with smooth accordion | FAQ section |
| **glassmorphism-hero-block** | Hero with glass effects, animated orbs, CTAs | Premium landing hero |
| **feature-cards-block** | Three feature cards with glassmorphism hover | Feature highlights |
| **glassmorphism-cta-block** | Glassy CTA card with gradient bg | Premium CTA section |
| **glassmorphism-pricing-block** | Pricing cards with glass effects, hover animations | Pricing page (premium feel) |
| **glassmorphism-testimonials-block** | Glass testimonial cards with ratings | Social proof (premium) |
| **glassmorphism-launch-timeline** | Roadmap milestones with glass style | Product launch timeline |
| **glassmorphism-minimal-metrics** | Metric cards with glass surfaces | Dashboard stats |
| **glassmorphism-logo-showcase** | Partner grid with floating motion | Logo wall / partners |
| **glassmorphism-portfolio** | Personal portfolio with profile + socials | Portfolio page |
| **glassmorphism-product-updates** | Changelog cards with status badges | Product updates page |
| **n8n-workflow-block** | Visual workflow builder with animated nodes | Automation showcase |
| **interactive-logs-table** | Logs panel with filters, search, expandable rows | Dev tool / observability UI |
| **kanban-board** | Drag-and-drop board with glass styling | Project management UI |

---

## Cards (14)

Standalone card components for various use cases.

| Card | What it does |
|---|---|
| **conference-ticket** | Animated ticket with holographic glassmorphism |
| **theater-ticket** | Cinematic ticket with rip effect and barcode |
| **cinema-ticket** | Movie ticket variant with tear effect |
| **glass-wallet-card** | Crypto wallet card with balance, trend, actions |
| **project-card** | Portfolio card with links, tags, hover effects |
| **glass-blog-card** | Blog card with image zoom, author info |
| **glass-order-summary** | E-commerce order card with item list, checkout |
| **glass-checkout-card** | Payment card with method selector, inputs |
| **hover-expand-card** | Card that lifts and expands on hover |
| **detail-task-card** | Task detail panel with assignee chips, editor |
| **ecommerce-highlight-card** | Product spotlight with bundle selector |
| **image-slider-card** | Accessible image carousel with keyboard support |
| **cards-slider** | Draggable cards slider with spring physics |
| **user-card** | Compact profile card with spring animations |

---

## Components (32)

Complex interactive components and full UI patterns.

| Component | What it does |
|---|---|
| **notification-center** | Multi-variant notification stack with actions |
| **weather-dashboard** | Weather dashboard with hourly chart, weekly outlook |
| **browse-folder** | Folder browser with animated tabs |
| **animated-list** | Staggered item list with checkmarks |
| **messenger** | Chat workspace with quick replies |
| **ai-chat-interface** | Chat input with attachments, model selector |
| **news-feed** | Interactive feed with categories, search, cards |
| **comment-thread** | Nested comments with rich interactions |
| **web-performance-page** | Web vitals analysis dashboard |
| **course-content-page** | Course page with video, curriculum, progress |
| **blog-typography** | Blog post typography (text, links, images, code) |
| **animated-profile-menu** | Floating avatar revealing action cards |
| **draggable-list** | Reorderable list with drag-and-drop springs |
| **glass-sign-in-card** | Glassmorphic sign-in with social auth |
| **glass-sign-up-card** | Glassmorphic sign-up flow |
| **glass-forgot-password-card** | Reset password with glass styling |
| **glass-verification-code-card** | Code entry with glass inputs |
| **glass-profile-settings-card** | Profile settings with avatar upload |
| **glass-account-settings-card** | Account management with subscription info |
| **command-palette** | Command palette with search + keyboard nav |
| **multiple-accounts** | Account switcher dropdown |
| **context-menu** | Right-click menu with nested items |
| **projects-block** | Project cards with hover effects |
| **interactive-timeline** | Scroll-triggered animated timeline |
| **context-menu-bubble** | Radial expanding circular menu |
| **expanding-search-dock** | Search icon expanding to full input |
| **ai-response-typing** | Character-by-character AI typing stream |
| **synced-lyric-captions** | Timed captions with audio sync |
| **currency-converter-card** | Finance converter with animated inputs |
| **glassmorphism-statistics-card** | Stats card with hover reveal |
| **floating-chat-widget** | Chat widget with AI agent selection |
| **volume-component** | Draggable volume slider |

---

## Page Transitions (11)

Full section entrance/exit animations for page composition.

| Transition | What it does | Vanilla approach |
|---|---|---|
| **staggered-hero** | Hero with staggered text reveal | `animation-delay: calc(var(--i) * 80ms)` per word |
| **profile-page** | User profile with gradient cover, stats, posts | Scroll-triggered fade-ins via IntersectionObserver |
| **hero-section** | Staggered text and button reveal | Cascade delays on `opacity` + `translateY` transitions |
| **scroll-reveal** | Section animates in on scroll | IntersectionObserver + CSS class toggle |
| **stats-section** | Animated stats cards with counters | Counter animation + staggered card entrance |
| **pricing-section** | Pricing cards with hover effects | Cards with `transform: translateY(-8px)` on hover |
| **feature-grid-section** | Staggered card + icon reveals | Grid items with cascade `animation-delay` |
| **faq-section** | Expandable FAQ with transitions | `max-height` accordion pattern |
| **cta-banner-section** | Animated CTA with gradient bg | Gradient background + button hover animations |
| **auto-revealing-heading** | Per-letter/word stagger on scroll | Split text into spans, IntersectionObserver triggers staggered `opacity` |
| **dynamic-spotlight-cta** | Cursor spotlight reveals gradient text | `radial-gradient` at `var(--mx), var(--my)` following cursor, `background-clip: text` |

---

## Decorative (8)

Background effects, cursors, and atmospheric elements.

| Effect | What it does | Vanilla approach |
|---|---|---|
| **liquid-cursor** | Liquid colour-mixing cursor effect | Canvas + cursor trail with blending |
| **gradient-animation** | Smooth transitioning gradient background | `@keyframes gradient { background-position }` cycling |
| **floating-gradient** | Animated floating gradient blobs | Multiple `radial-gradient` layers with `@keyframes` position shifts |
| **dynamic-tag-cloud** | Floating tags that rearrange on hover | Absolute-positioned tags with random `translate` animations, reflow on hover |
| **animated-quote-block** | Typewriter quote that breathes | Typewriter JS + `@keyframes breathe { scale(1) → scale(1.02) }` |
| **floating-info-panel** | Drifting tooltip that fades in/out | `@keyframes float { translateY(-5px) → translateY(5px) }` + opacity pulse |
| **holographic-wall** | Hieroglyph wall with golden cursor light | SVG pattern + radial gradient mask following cursor |
| **folder-animation** | Folder with motion blur | `filter: blur()` proportional to translate speed |

---

## Resumes (4)

| Resume | Style |
|---|---|
| **resume-card** | Interactive with animated sections |
| **professional-resume** | Clean, formal, corporate |
| **minimal-resume** | Vercel-inspired, clean typography |
| **standard-resume** | Sidebar layout, most industries |

---

## Forms (1)

| Form | What it does |
|---|---|
| **wizard-form** | Multi-step wizard with animated transitions, validation, progress |

---

## Microinteractions (2)

| Effect | What it does |
|---|---|
| **preview-details-card** | Link hover reveals smooth detail preview box |
| **ai-unlock-animation** | Premium unlock with particles, ripples, loading states |
