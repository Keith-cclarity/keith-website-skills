---
name: audit-site
description: Run a site audit (links + code quality) using 2 parallel agents. Use when the user wants to check a website for broken links, accessibility issues, or code quality problems. For deep SEO analysis, use /seo instead.
---

# Site Audit Skill

Run a thorough, production-grade audit of any website project using 2 specialised agents in parallel. Research only, no changes made.

**For SEO and GEO analysis**, use `/seo` instead — it has dedicated sub-skills for technical SEO, content quality, schema markup, and AI search optimisation.

## How to use

`/audit-site [optional: path to project root]`

If `$ARGUMENTS` contains a path, use that as the project root. Otherwise, use the current working directory.

Before launching agents, identify the project's tech stack by reading the project root for config files (package.json, astro.config.mjs, next.config.js, etc.) and scanning `src/` for page/component structure. Pass this context to each agent so they know what to look for.

## Execution

Launch BOTH agents in parallel using a single message with 2 Agent tool calls. Each agent should be `subagent_type: "Explore"`. Each agent prompt must include:
- The project root path
- The tech stack detected
- The production domain (from config or CLAUDE.md)
- The specific checklist below for that agent

## Agent 1: Link Audit

Prompt the agent to check:

### Internal Links
- Every `href=` in pages, layouts, and components points to a page that exists
- Trailing slashes are consistent (match the framework's config)
- No links to old/moved URL patterns
- Breadcrumb links match the actual page hierarchy
- Nav and footer links are consistent across all pages

### Orphan Pages
- Find pages in the pages directory that have ZERO internal links pointing to them from other pages
- These are effectively invisible to search engines and users

### External Links
- All external links use `target="_blank" rel="noopener"` consistently
- Flag any missing `rel="noopener"` on external links

### Anchor Text Quality
- Flag generic anchor text: "click here", "read more", "link", "here"
- Descriptive anchors help SEO and AI citation

### Redirect Chains
- Internal links should point to final URLs, not URLs that redirect
- e.g. linking to `/insights` when the site redirects to `/insights/` wastes crawl budget

### Sitemap Parity
- Compare the generated sitemap (or sitemap config) against all pages in the source
- Flag pages missing from sitemap or stale entries for deleted pages

### Link Equity Distribution
- Check that high-value pages (homepage, key landing pages) receive links from multiple pages, not just nav/footer
- Flag important pages with thin internal link support

### Static Files
- Check `llms.txt` and `robots.txt` for stale or missing URLs
- Check that referenced URLs in these files actually exist

Report ALL issues with file paths and line numbers.

## Agent 2: Code Quality Audit

Prompt the agent to check:

### Accessibility
- Missing `aria-label` on inputs, buttons, and interactive elements
- Decorative elements (canvas, SVG icons) missing `aria-hidden="true"`
- Images without alt text
- Links without descriptive text
- Form inputs without associated labels
- Colour contrast: flag text using `--text-faint` or similar low-contrast variables on light backgrounds
- Focus styles: interactive elements should have visible `:focus-visible` styles

### JavaScript Safety
- Null checks on DOM queries: `getElementById`, `querySelector`, `getContext` can all return null
- `<script is:inline>` blocks should be wrapped in IIFE or try/catch to prevent cascade failures
- IntersectionObserver callbacks should handle elements already in viewport on creation
- Event listeners on elements that may not exist (missing null guard before `.addEventListener`)

### Responsive Design
- Every page-level style block must have breakpoints at 768px and 480px minimum
- Flag elements that could overflow horizontally on small screens (fixed widths, wide tables, SVGs without responsive wrappers)
- Touch targets should be >= 44px on mobile
- Check for `overflow: hidden` on containers with absolutely positioned children

### Core Web Vitals Risks
- Images and media without explicit `width`/`height` (causes Cumulative Layout Shift)
- Font swap flash: fonts should use `display=swap`
- Dynamically injected content above the fold that shifts layout
- Large synchronous scripts that block rendering

### Image Optimisation
- Images in `public/` over 200KB that could be compressed
- OG images should be exactly 1200x630
- Check for unused images in `public/` that bloat the deploy

### Unused CSS
- Class names defined in `<style>` blocks that don't match any element in the same file's template
- Dead CSS adds unnecessary weight

### Semantic HTML
- Flag `<div>` soup where `<section>`, `<article>`, `<nav>`, `<main>`, `<header>`, `<footer>` would be more appropriate
- AI crawlers and screen readers use semantic landmarks for content understanding

### Head Tag Completeness
- Every page should have `lang` attribute on `<html>`, `charset` meta, `viewport` meta
- Check nothing overrides or duplicates these from the base layout

### Build Health
- Run the build command and capture any warnings (deprecations, unused imports, type issues)
- Report warnings that indicate real problems

Report ALL issues with file paths and line numbers.

## Output Format

After both agents return, consolidate into a single report:

### Summary
- Total issues found per agent
- Overall site health rating: Excellent / Good / Needs Work / Critical

### Must Fix
Issues that affect users or accessibility. Group by agent.

### Should Fix
Issues that affect code quality, maintainability, or best practices. Group by agent.

### Nice to Have
Minor improvements, consistency tweaks, future-proofing. Group by agent.

### Clean Bill of Health
List what passed. This confirms the audit was thorough and gives the user confidence in what is already solid.

Keep the report concise. File paths and line numbers for every issue. No generic advice, only specific findings from the actual codebase.

### Next Step

After the audit, suggest: **"Run `/seo` for a deep SEO and GEO analysis — it checks schema markup, E-E-A-T, AI search readiness, and gives you a scored report."**
