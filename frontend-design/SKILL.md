---
name: frontend-design
description: Create distinctive, production-grade frontend interfaces with high design quality. Use this skill when the user asks to build web components, pages, or applications. Generates creative, polished code that avoids generic AI aesthetics.
---

# Frontend Design Skill

Design and build production-grade frontend interfaces that feel intentional, branded, and human — not like generic AI output.

## How to use

`/frontend-design [what to build]`

`$ARGUMENTS` is a description of the page, component, or app to design (e.g. `landing page for my SaaS`, `dashboard for analytics app`, `pricing page`). If not provided, ask the user what they want to build.

**Improving an existing design?** Before changing anything, audit what's already working (layout, hierarchy, copy, rhythm). Run the litmus checks — only flag what actually FAILS. Propose only targeted fixes for the failures. If a rule conflicts with an established design direction that's working, the design wins. Design rules are judgment tools, not a checklist. "Does this change improve the page?" is the only test that matters.

## Step 0: Establish the brand system (once per project, reuse everywhere)

Before designing anything, check if this project already has a brand guide. If not, define one:

- **Palette** — Primary, secondary, accent, background, text colours. Use CSS variables. Define tokens: `background`, `surface`, `primary-text`, `muted-text`, `accent`. Avoid purple-on-white defaults. No purple bias or dark mode bias.
- **Typography** — One headline font, one body font. Max two. Define sizes, weights, line heights. Use expressive, purposeful fonts. Avoid default stacks (Inter, Roboto, Arial, system) unless the brand guide explicitly calls for them. Define roles: `display`, `headline`, `body`, `caption`.
- **Motion language** — Pick ONE: spring physics, glassmorphism, staggered reveals, minimal/no-motion. Stick to it across every page.
- **Visual style** — Rounded or sharp? Dense or spacious? Light or dark? Editorial or playful?
- **Component patterns** — How do buttons look? Cards? Forms? Hover states? Define once, reuse always. Default to cardless layouts (sections, columns, dividers, lists, media blocks). Only use cards when the card IS the interaction.
- **Spacing system** — Consistent scale (e.g. 4px/8px/16px/32px/64px).

Save the brand guide as a file in the project root (e.g. `brand-guide.md` or `DESIGN.md`). Every subsequent page or component in that project MUST follow it. Consistency across pages is what makes a product feel professional. A landing page, dashboard, and settings page should all feel like the same product.

**If a brand guide already exists** (check CLAUDE.md Brand Details, project files, or memory), use it. Don't reinvent.

## Step 1: Understand the user journey (before touching any components)

- **Who is this person?** First-time visitor, warm lead from LinkedIn, returning user, workshop student?
- **What state are they in?** Sceptical, curious, comparing options, ready to act?
- **What is the ONE thing** they should feel/understand/do on this page?
- **What is the emotional arc?** Every page tells a story. Define the beats: intrigue → trust → value → action.

## Step 2: Write the design brief

Before building, write three things:

1. **Visual thesis** — One sentence describing mood, material, and energy (e.g. "Warm editorial confidence, like a well-designed magazine spread with breathing room")
2. **Content plan** — Hero → Support → Detail → Final CTA. Each section gets one job, one dominant visual idea, and one primary takeaway or action.
3. **Interaction thesis** — 2-3 motion ideas that change the feel of the page (e.g. "staggered headline reveal on hero, parallax scroll on feature images, magnetic hover on CTA buttons")

## Step 3: Design the experience

- **Information hierarchy** — What MUST they see first? What can wait? What can be cut entirely?
- **Restraint** — Remove elements that don't serve the journey. Fewer, better sections beat more sections. Aim for six or fewer sections. If a page needs more, each extra section must earn its place in the narrative arc.
- **Narrative flow** — Each section should answer the question the previous section created.
- **Constraints** — One H1 headline per page. One accent colour. One primary CTA above the fold. These keep the page focused.
- **Ground in real content** — Use real copy, product context, and project goals. Never fall back to lorem ipsum or generic placeholder patterns. Real content shapes better structure and more believable messaging.
- **All design choices must follow the brand guide from Step 0.** No one-off colours, no rogue fonts, no mixed animation styles.
- **Exception:** If working within an existing website or design system, preserve the established patterns, structure, and visual language. The brand guide from Step 0 takes precedence over these defaults.

### Landing page rules

**Hero rules:**
- **One composition.** The first viewport must read as a single composition, not a collection of parts.
- Full-bleed image or dominant visual plane. The hero must run edge-to-edge with no inherited page gutters or framed container. Constrain only the inner text/action column.
- Brand first, headline second, body third, CTA fourth. The brand or product name must be the loudest text.
- No hero cards, stat strips, logo clouds, pill clusters, or floating dashboards.
- **No hero overlays.** Do not place detached labels, floating badges, promo stickers, info chips, or callout boxes on top of hero media.
- Keep headlines to roughly 2-3 lines on desktop, readable in one glance on mobile.
- All text over imagery must maintain strong contrast and clear tap targets.
- Don't rely on flat single-colour backgrounds. Use gradients, images, or subtle patterns to build atmosphere.

**Viewport budget:** The first viewport should contain only: brand, one headline, one short supporting sentence, one CTA group, and one dominant image. Do NOT place stats, schedules, event listings, address blocks, promos, or secondary marketing content in the first viewport. If using a sticky header, it counts against the hero. Use `calc(100svh - header-height)` when needed.

**Brand test:** If the first viewport could belong to another brand after removing the nav, the branding is too weak.

### App and dashboard rules

Default to Linear-style restraint:
- Calm surface hierarchy, strong typography and spacing, few colours, dense but readable
- Minimal chrome. Cards only when the card is the interaction.
- Organise around: primary workspace, navigation, secondary context/inspector, one clear accent for action or state
- **Utility copy, not marketing copy.** Headings say what the area IS or what the user can DO ("Selected KPIs", "Plan status", "Last sync"). No aspirational hero lines, metaphors, or campaign-style language on product surfaces.
- If a section does not help someone operate, monitor, or decide, remove it.
- Litmus check: if an operator scans only headings, labels, and numbers, can they understand the page immediately?

### Imagery rules

Imagery must do narrative work, not just fill space.
- Use at least one strong, real-looking image for brands, venues, editorial pages, and lifestyle products.
- Prefer in-situ photography over abstract gradients or fake 3D objects.
- Choose or crop images with a stable tonal area for text overlay.
- Do not generate images with built-in UI frames, splits, cards, or panels.
- If the first viewport still works after removing the image, the image is too weak.

### Motion rules

Use motion to create presence and hierarchy, not noise. Ship at least 2-3 intentional motions:
- One entrance sequence in the hero
- One scroll-linked, sticky, or depth effect
- One hover, reveal, or layout transition that sharpens affordance

Motion must be: noticeable in a quick recording, smooth on mobile, fast and restrained, consistent across the page. Remove if ornamental only.

**Safe layout rule:** Keep fixed or floating UI elements (sticky headers, decorative layers, animated elements) from overlapping text, buttons, or other key content across screen sizes. Place them in safe areas, behind primary content where appropriate, and maintain sufficient spacing.

### Copy rules

- Write in product language, not design commentary.
- Let the headline carry the meaning. Supporting copy should usually be one short sentence.
- Cut repetition between sections. If deleting 30% of the copy improves the page, keep deleting.
- Do not include prompt language or design commentary in the UI.
- Give every section one responsibility: explain, prove, deepen, or convert.

### Typography line breaks

Never allow bad phrase breaks. If a phrase is "No developer needed", all three words must stay together. A short word like "no" sitting alone at the end of a line while the rest wraps is unacceptable.

**Base styles (apply to every project):**
- `text-wrap: balance` on all headlines, subheadlines, section titles, labels, buttons, short copy, pull quotes, and standalone statements (any text that reads as a single thought, not a paragraph). This distributes words evenly across lines.
- `text-wrap: pretty` on all body text and paragraphs. This prevents orphaned words on the last line.

**Key phrases that must never break:** Use `&nbsp;` between words (e.g. `No&nbsp;developer&nbsp;needed`, `9,700+&nbsp;pages`, `S$500`) or wrap in a `<span>` with `white-space: nowrap`.

## Step 4: Then pick components

Read the UI component catalogues (included in the same folder as this skill):
- `uselayouts-catalogue.md` — 27 micro-interactions (tabs, buttons, cards, carousels)
- `tripled-catalogue.md` — 137 page blocks (heroes, pricing, CTAs, footers, dashboards, auth, glassmorphism)
- `neobrutal-catalogue.md` — 21 neobrutalism components (bold borders, hard shadows, flat colours). Complete design system. Good for workshops, creative tools, developer-facing sites.

**Which library fits which brand?** Let the brand guide from Step 0 decide:

| Brand feel | Primary library | Support library |
|---|---|---|
| Premium, polished, SaaS | **TripleD** (glassmorphism blocks) | UseLayouts (micro-interactions) |
| Clean, subtle, professional | **UseLayouts** (spring physics) | TripleD (page sections) |
| Bold, playful, creative, developer-facing | **Neobrutal** (hard shadows, flat colours) | — (self-contained design system) |
| Editorial, personal brand | **TripleD** (blocks) | UseLayouts (interactive details) |

**Rule: Pick ONE primary library per project.** Don't mix Neobrutal with glassmorphism. Don't combine hard shadows with spring physics blur effects. The brand guide dictates which library, not the other way around. You can combine TripleD + UseLayouts (they share the same aesthetic), but Neobrutal stands alone.

Selection rules:
- Only pick components that **serve the journey** designed in Steps 1-3. Never pick a component just because it looks cool.
- **Adapt every component to the brand guide.** Change colours, fonts, spacing, animation timing to match. A component straight from the library is a starting point, never the final product.
- If nothing fits the experience you designed, build from scratch. The catalogues are ingredients, not the recipe.
- For React projects, copy from the component source. For vanilla HTML/CSS/JS, recreate the feel using the vanilla approaches in each catalogue.

## Reject these failures

Before shipping, check the output against these common failure modes:
- Generic SaaS card grid as the first impression
- Beautiful image with weak brand presence
- Strong headline with no clear action
- Busy imagery behind unreadable text
- Sections that repeat the same mood statement
- Carousel with no narrative purpose
- App UI made of stacked cards instead of layout
- Pill clusters, stat strips, icon rows, boxed promos competing for attention
- Dashboard with marketing hero lines instead of operational headings
- More than one dominant idea per section

## The test

Before shipping, ask:
1. "If I remove this element, does the page still work?" If yes, remove it.
2. "Does this page feel like it belongs to the same product as every other page?" If no, fix it.
3. "Is the brand unmistakable in the first screen?" If no, fix hierarchy.
4. "Can the page be understood by scanning headlines only?" If no, rewrite copy.
5. "Does motion improve hierarchy or atmosphere?" If no, remove it.
