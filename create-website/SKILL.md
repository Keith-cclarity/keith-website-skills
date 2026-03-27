---
name: create-website
description: Beginner-friendly guide to building and deploying a personal website from scratch. Guides anyone — no terminal/GitHub/domain experience needed — through Astro + Cloudflare Pages + GitHub Actions. Use when the user wants to create, scaffold, or deploy a new website.
---

# Create Website Skill

Guide the user through building and deploying a complete website, from zero to live. This skill is written for people who have NEVER used a terminal, GitHub, or deployed anything before. Every step must be explained in plain language. Nothing assumed. Nothing skipped.

## How to use

`/create-website [domain name or site idea]`

`$ARGUMENTS` is the domain name or site description (e.g. `keithteo.ai`, `my portfolio site`, `a site for my bakery`). If not provided, ask the user what they want their site to be about and what domain they have (or want).

---

## Before you begin

Say this to the user at the start:

> "We're going to build you a real, live website — step by step. I'll explain what each thing does as we go. If anything is confusing, just ask.
>
> We'll use:
> - **Astro** — a tool that turns your content into a fast website
> - **GitHub** — a place to store your code (think of it as Dropbox, but for code)
> - **Cloudflare Pages** — a free hosting service that puts your site on the internet
>
> Each step is numbered. We'll check off as we go."

---

## Step 1: Check Prerequisites

Do each check in order. If something is missing, install it before moving on.

### 1A — Node.js

Run this command to check if Node.js is installed:

```bash
node --version
```

**If it works:** You'll see something like `v20.11.0`. That's good. Move on.

**If it fails (command not found):** Tell the user:

> "Node.js is the engine that runs our build tools. Let's install it now."

Direct them to install Node.js version 20 (LTS) from nodejs.org, or via Homebrew on Mac:

```bash
brew install node@20
echo 'export PATH="/opt/homebrew/opt/node@20/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

Verify after: `node --version` should show `v20.x.x`.

### 1B — Git

```bash
git --version
```

**If it fails:** On Mac, running this triggers automatic installation. Tell the user to follow the popup. On Windows, direct them to git-scm.com.

### 1C — GitHub CLI (gh)

```bash
gh --version
```

**If it fails:** Install via Homebrew:

```bash
brew install gh
```

Then authenticate:

```bash
gh auth login
```

Tell the user:

> "This connects Claude Code to your GitHub account. Follow the prompts — choose 'GitHub.com', then 'HTTPS', then 'Login with a web browser'. It'll open a page and ask you to paste a code."

### 1D — Cloudflare Account

Ask the user:

> "Do you have a Cloudflare account? It's free — go to cloudflare.com and sign up if not."

Once they have an account, they need an API token. Tell them:

> "Go to: cloudflare.com → click your profile icon top-right → 'My Profile' → 'API Tokens' → 'Create Token' → Use the 'Edit Cloudflare Workers' template → click 'Use template' → 'Create Token'. Copy that token — you'll need it in a minute."

Also get their Account ID:

> "Back on the Cloudflare dashboard main page, look at the right sidebar — your Account ID is there. Copy it too."

Store both in environment for this session:

```bash
export CF_API_TOKEN="[user's token]"
export CF_ACCOUNT_ID="[user's account id]"
```

### 1E — GitHub Repo + Secrets Setup

Determine the project slug from the domain or site idea (e.g. `keithteo-website`, `bakery-site`).

Create the repo:

```bash
gh repo create [slug] --public --confirm
```

Tell the user:

> "This creates a storage box on GitHub for your website's code. 'Public' means others can see the code — that's fine for a personal site."

Add secrets to the repo:

```bash
gh secret set CLOUDFLARE_API_TOKEN --body "$CF_API_TOKEN" --repo [github-username]/[slug]
gh secret set CLOUDFLARE_ACCOUNT_ID --body "$CF_ACCOUNT_ID" --repo [github-username]/[slug]
```

Tell the user:

> "Secrets are like a password manager for GitHub Actions — they let our automated deployment tool access Cloudflare without you having to type in your credentials every time."

---

## Step 2: Scaffold the Project

### 2A — Create the Astro Project

Navigate to a good location (ask the user where they keep projects, default to Desktop):

```bash
cd ~/Desktop
npm create astro@latest [slug] -- --template minimal --install --no-git
cd [slug]
```

Tell the user:

> "Astro just created the skeleton of your website — the basic structure every site needs. The 'minimal' template starts us with a clean slate."

### 2B — Initialise Git

```bash
git init
git remote add origin https://github.com/[github-username]/[slug].git
```

### 2C — Create the CI/CD Workflows

Create `.github/workflows/` directory:

```bash
mkdir -p .github/workflows
```

Create `deploy.yml` — this runs every time you push code to GitHub:

```yaml
# .github/workflows/deploy.yml
name: Deploy

on:
  push:
    branches: [main]
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: '20'

      - name: Install dependencies
        run: npm ci

      - name: Build
        run: npm run build

      - name: Deploy to Cloudflare Pages
        uses: cloudflare/wrangler-action@v3
        with:
          apiToken: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          accountId: ${{ secrets.CLOUDFLARE_ACCOUNT_ID }}
          command: pages deploy dist/ --project-name=[slug] --branch=main
```

Tell the user:

> "This file is your autopilot. Every time you push a change to GitHub, this runs automatically: it installs your tools, builds your site, and sends it to Cloudflare. You never have to manually deploy."

Create a `.gitignore`:

```
node_modules/
dist/
.env
.env.*
.DS_Store
```

### 2D — Create the Cloudflare Pages Project

```bash
npx wrangler pages project create [slug] --production-branch main
```

This registers your site name with Cloudflare Pages. The URL will be `[slug].pages.dev` initially.

---

## Step 3: Build the Pages

Now invoke the `/frontend-design` skill to design the actual pages.

**ALWAYS invoke `/frontend-design` before building any HTML/CSS.** Do not produce generic layouts. The frontend-design skill handles design thinking, layout decisions, and component design.

Ask the user:

> "What pages do you need? Most personal sites start with:
> - Home (who you are + what you do)
> - About (your story)
> - Contact (how to reach you)
>
> Do you want all three, or something different?"

Based on their answer, invoke `/frontend-design` with the brief, then build the Astro pages.

### Page File Structure

Each page lives in `src/pages/`. Content (blog posts, landing pages) lives in `src/content/`:

```
src/
  pages/
    index.astro                (home page → yourdomain.com/)
    about.astro                (about → yourdomain.com/about)
    contact.astro              (contact → yourdomain.com/contact)
    blog/
      index.astro              (blog listing → yourdomain.com/blog)
      [...slug].astro          (renders each blog post → yourdomain.com/blog/my-post)
    [slug].astro               (renders each landing page → yourdomain.com/my-page)
  content/
    config.ts                  (defines content schemas)
    blog/
      my-first-post.md         (drop a .md file = new blog post)
    pages/
      services.md              (drop a .md file = new landing page)
  layouts/
    Base.astro                 (shared HTML shell, head tags, nav, footer)
    BlogPost.astro             (layout for blog posts)
    Page.astro                 (layout for landing pages)
  components/
    Nav.astro
    Footer.astro
```

Tell the user:

> "This is your content system. To create a new blog post, you just drop a Markdown file in `src/content/blog/`. To create a new landing page, drop one in `src/content/pages/`. Tell Claude 'write a blog post about X' or 'create a landing page for Y' and it writes the file, you push, and it's live. No code editing needed."

### Base Layout Template

Every page must include these SEO tags in the `<head>`. Create `src/layouts/Base.astro`:

```astro
---
export interface Props {
  title: string;
  description: string;
  canonicalUrl?: string;
  ogImage?: string;
}

const { title, description, canonicalUrl, ogImage } = Astro.props;
const siteUrl = import.meta.env.SITE_URL || 'https://[domain]';
const pageUrl = canonicalUrl || new URL(Astro.url.pathname, siteUrl).href;
const image = ogImage || `${siteUrl}/og-default.png`;
---

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{title}</title>
  <meta name="description" content={description}>
  <link rel="canonical" href={pageUrl}>

  <!-- Open Graph (how your link looks when shared on social) -->
  <meta property="og:title" content={title}>
  <meta property="og:description" content={description}>
  <meta property="og:url" content={pageUrl}>
  <meta property="og:type" content="website">
  <meta property="og:image" content={image}>
  <meta name="twitter:card" content="summary_large_image">

  <!-- Fonts (add based on design) -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
</head>
<body>
  <slot />
</body>
</html>
```

Tell the user what each tag does if they ask. Keep explanations practical:

> "The 'og:' tags control how your link looks when someone shares it on LinkedIn or WhatsApp — that preview card with a title, image, and description. The canonical URL tells Google which version of the page is the 'real' one."

### Content Collections (your CMS)

This is what lets you launch new pages and blog posts by just dropping a Markdown file. No code editing needed.

Create the content config at `src/content/config.ts`:

```ts
import { defineCollection, z } from 'astro:content';

const blog = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string(),
    date: z.date(),
    image: z.string().optional(),
    draft: z.boolean().default(false),
  }),
});

const pages = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string(),
    image: z.string().optional(),
    draft: z.boolean().default(false),
  }),
});

export const collections = { blog, pages };
```

Tell the user:

> "This file defines two types of content: blog posts and pages. Each one has a title, description, and optional image. The 'draft' field lets you write something without publishing it — set `draft: true` and it won't show up on the live site."

Create a sample blog post at `src/content/blog/hello-world.md`:

```md
---
title: "My First Post"
description: "This is my first blog post."
date: 2026-03-28
---

Welcome to my blog! This is my first post.

You can write anything here using Markdown — headings, lists, links, images, bold, italic.

## What is Markdown?

It's a simple way to format text. You're reading it right now.

- **Bold** text uses double asterisks
- *Italic* text uses single asterisks
- [Links](https://example.com) use square brackets and parentheses
```

Create the blog post layout at `src/layouts/BlogPost.astro`:

```astro
---
import Base from './Base.astro';

const { frontmatter } = Astro.props;
---

<Base title={frontmatter.title} description={frontmatter.description} ogImage={frontmatter.image}>
  <article>
    <h1>{frontmatter.title}</h1>
    <time>{new Date(frontmatter.date).toLocaleDateString('en-GB', { day: 'numeric', month: 'long', year: 'numeric' })}</time>
    <slot />
  </article>
</Base>
```

Create the blog post renderer at `src/pages/blog/[...slug].astro`:

```astro
---
import { getCollection } from 'astro:content';
import BlogPost from '../../layouts/BlogPost.astro';

export async function getStaticPaths() {
  const posts = await getCollection('blog', ({ data }) => !data.draft);
  return posts.map((post) => ({
    params: { slug: post.slug },
    props: { post },
  }));
}

const { post } = Astro.props;
const { Content } = await post.render();
---

<BlogPost frontmatter={post.data}>
  <Content />
</BlogPost>
```

Create the blog listing page at `src/pages/blog/index.astro`:

```astro
---
import { getCollection } from 'astro:content';
import Base from '../../layouts/Base.astro';

const posts = (await getCollection('blog', ({ data }) => !data.draft))
  .sort((a, b) => b.data.date.valueOf() - a.data.date.valueOf());
---

<Base title="Blog" description="Latest posts">
  <h1>Blog</h1>
  <ul>
    {posts.map((post) => (
      <li>
        <a href={`/blog/${post.slug}/`}>
          <h2>{post.data.title}</h2>
          <p>{post.data.description}</p>
          <time>{new Date(post.data.date).toLocaleDateString('en-GB', { day: 'numeric', month: 'long', year: 'numeric' })}</time>
        </a>
      </li>
    ))}
  </ul>
</Base>
```

Create the landing page layout at `src/layouts/Page.astro`:

```astro
---
import Base from './Base.astro';

const { frontmatter } = Astro.props;
---

<Base title={frontmatter.title} description={frontmatter.description} ogImage={frontmatter.image}>
  <article>
    <h1>{frontmatter.title}</h1>
    <slot />
  </article>
</Base>
```

Create the landing page renderer at `src/pages/[slug].astro`:

```astro
---
import { getCollection } from 'astro:content';
import Page from '../layouts/Page.astro';

export async function getStaticPaths() {
  const pages = await getCollection('pages', ({ data }) => !data.draft);
  return pages.map((page) => ({
    params: { slug: page.slug },
    props: { page },
  }));
}

const { page } = Astro.props;
const { Content } = await page.render();
---

<Page frontmatter={page.data}>
  <Content />
</Page>
```

Tell the user:

> "You now have a content system. Here's how it works after today:
>
> **To create a new blog post:** Tell Claude 'write a blog post about X'. It creates a Markdown file in `src/content/blog/`. Push to GitHub. It's live.
>
> **To create a new landing page:** Tell Claude 'create a landing page for Y'. It creates a Markdown file in `src/content/pages/`. Push to GitHub. It's live.
>
> **To write a draft without publishing:** Add `draft: true` to the top of the file. It won't appear on the site until you change it to `false`.
>
> You never need to touch code. Just describe what you want and push."

### SEO: Sitemap and llms.txt

Install the Astro sitemap plugin:

```bash
npm install @astrojs/sitemap
```

Update `astro.config.mjs`:

```js
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: 'https://[domain]',
  integrations: [sitemap()],
});
```

Create `public/llms.txt` — this tells AI assistants what your site is about:

```
# [Site Name]

> [One sentence: what is this site and who is it for?]

## Pages

- /: [Home page — what it covers]
- /about: [About page — what it covers]
- /contact: [Contact page]

## About the Author

[Your name, role, location. 2–3 sentences.]

## Contact

[Email or booking link]
```

Tell the user:

> "llms.txt is like a business card for AI assistants — it tells ChatGPT, Claude, and Perplexity what your site is about so they can mention you accurately when someone asks."

Also create `public/robots.txt`:

```
User-agent: *
Allow: /

# AI search engine crawlers — explicitly allow all
User-agent: GPTBot
Allow: /
User-agent: ChatGPT-User
Allow: /
User-agent: Google-Extended
Allow: /
User-agent: anthropic-ai
Allow: /
User-agent: ClaudeBot
Allow: /
User-agent: PerplexityBot
Allow: /

Sitemap: https://[domain]/sitemap-index.xml
```

---

## Step 4: First Commit and Deploy

### 4A — First Push

```bash
git add .
git commit -m "Initial site setup"
git branch -M main
git push -u origin main
```

Tell the user:

> "This is the moment. You've just pushed your code to GitHub. In about 2 minutes, GitHub Actions will automatically build your site and send it to Cloudflare. You can watch it happen."

Show them how to watch the deployment:

```bash
gh run watch
```

Or tell them to go to: github.com/[username]/[slug]/actions

### 4B — Verify on Cloudflare Pages URL

Once the deploy finishes, the site will be live at:

`https://[slug].pages.dev`

Tell the user to open it and confirm it loads.

---

## Step 5: Add Analytics (PostHog)

Tell the user:

> "Your site is live, but right now you have no idea if anyone visits it. Let's add analytics so you can see who's visiting, which pages they look at, and where they came from. We'll use PostHog — it's free for up to 1 million events per month."

### 5A — Create a PostHog Account

> "Go to posthog.com and sign up for a free account. Choose 'PostHog Cloud (US)' or '(EU)' — either is fine."

Once they're in the dashboard:

> "Click the gear icon (Settings) in the left sidebar, then 'Project Settings'. You'll see your **Project API Key** — it looks like `phc_xxxxxxxxxxxx`. Copy it."

### 5B — Add PostHog to the Site

Add the PostHog snippet to `src/layouts/Base.astro`, inside the `<head>` tag, just before `</head>`:

```html
<!-- Analytics -->
<script>
  !function(t,e){var o,n,p,r;e.__SV||(window.posthog=e,e._i=[],e.init=function(i,s,a){function g(t,e){var o=e.split(".");2==o.length&&(t=t[o[0]],e=o[1]),t[e]=function(){t.push([e].concat(Array.prototype.slice.call(arguments,0)))}}(p=t.createElement("script")).type="text/javascript",p.crossOrigin="anonymous",p.async=!0,p.src=s.api_host.replace(".i.posthog.com","-assets.i.posthog.com")+"/static/array.js",(r=t.getElementsByTagName("script")[0]).parentNode.insertBefore(p,r);var u=e;for(void 0!==a?u=e[a]=[]:a="posthog",u.people=u.people||[],u.toString=function(t){var e="posthog";return"posthog"!==a&&(e+="."+a),t||(e+=" (stub)"),e},u.people.toString=function(){return u.toString(1)+".people (stub)"},o="init capture register register_once register_for_session unregister unregister_for_session getFeatureFlag getFeatureFlagPayload isFeatureEnabled reloadFeatureFlags updateEarlyAccessFeatureEnrollment getEarlyAccessFeatures on onFeatureFlags onSessionId getSurveys getActiveMatchingSurveys renderSurvey canRenderSurvey getNextSurveyStep identify setPersonProperties group resetGroups setPersonPropertiesForFlags resetPersonPropertiesForFlags setGroupPropertiesForFlags resetGroupPropertiesForFlags reset get_distinct_id getGroups get_session_id get_session_replay_url alias set_config startSessionRecording stopSessionRecording sessionRecordingStarted captureException loadToolbar get_property getSessionProperty createPersonProfile opt_in_capturing opt_out_capturing has_opted_in_capturing has_opted_out_capturing clear_opt_in_out_capturing debug getPageviewId".split(" "),n=0;n<o.length;n++)g(u,o[n]);e._i.push([i,s,a])},e.__SV=1)}(document,window.posthog||[]);
  posthog.init('[PROJECT_API_KEY]', {
    api_host: 'https://us.i.posthog.com',
    person_profiles: 'anonymous',
    capture_pageview: true,
    capture_pageleave: true,
  });
</script>
```

Replace `[PROJECT_API_KEY]` with the user's actual PostHog project API key (the `phc_xxxxxxxxxxxx` value).

If the user chose EU cloud, change `api_host` to `'https://eu.i.posthog.com'`.

Tell the user:

> "We're using 'anonymous' mode — this means PostHog tracks page views and clicks but never collects personal data like names or emails. It's privacy-friendly and doesn't need a cookie banner.
>
> Here's what you'll be able to see in PostHog:
> - **How many people visit your site** (and when)
> - **Which pages they look at** (so you know what content works)
> - **Where they came from** (Google, LinkedIn, direct link)
> - **What country they're in**
>
> Just log into posthog.com anytime to check your dashboard."

### 5C — Push the Update

```bash
git add .
git commit -m "Add PostHog analytics"
git push
```

> "Done. Analytics are live. Give it a few minutes, then visit your site and check PostHog — you should see yourself as the first visitor."

---

## Step 6: Connect Your Domain

If the user has a domain (or wants to buy one), connect it now.

Tell the user:

> "This step makes your site available at yourdomain.com instead of the long pages.dev URL. You need to have bought the domain first."

**If they don't have a domain yet:**

> "You can buy one at Cloudflare Registrar (cloudflare.com/products/registrar) — same place as everything else, and there's no markup. Domains typically cost $8–15/year. Search for your name or business."

**To connect an existing domain:**

1. Go to Cloudflare Pages → your project → Custom Domains
2. Click 'Set up a custom domain'
3. Enter their domain
4. If domain is on Cloudflare: DNS updates automatically
5. If domain is elsewhere: they'll need to update nameservers to Cloudflare's (ns1.cloudflare.com, ns2.cloudflare.com)

**DNS propagation:** Tell the user:

> "DNS changes can take anywhere from a few minutes to 48 hours to spread around the internet. If your domain doesn't work immediately, check back in an hour."

---

## Step 7: After Launch

Congratulate the user:

> "Your site is live. Here's what you now have:
> - A real website at [domain]
> - Automatic deployment — every time you push to GitHub, it updates live
> - Analytics — see who visits and which pages they view (posthog.com)
> - A blog and landing page system — just drop Markdown files to publish
> - Google-ready SEO meta tags
> - AI-search-ready llms.txt
>
> **To update your site:** Edit any file, then run:
> ```
> git add .
> git commit -m "Your change description"
> git push
> ```
> That's it. GitHub does the rest."

### Next Steps — Which Tool When

Show this guide to the user:

> **You now have two quality-check tools. Here's when to use each:**
>
> **`/audit-site`** — "Is my site built well?"
> Checks broken links, orphan pages, accessibility (alt text, aria-labels, colour contrast), responsive design, JavaScript safety, image sizes, semantic HTML, and build warnings. Fast, broad, code-level. Run this FIRST after any major build.
>
> **`/seo [command]`** — "Will people find my site?"
> Deep SEO specialist with 12 sub-commands. Checks schema markup, E-E-A-T content quality, Core Web Vitals scores, AI search readiness (GEO), sitemap quality, and gives you a scored report (0-100). Run this when you want to improve your search rankings or AI visibility.
>
> **They check different things.** /audit-site catches code problems (a missing aria-label, an oversized image, a broken link). /seo catches search problems (missing schema, weak content structure, blocked AI crawlers). Run both — they don't duplicate work.
>
> **Common commands:**
> - `/seo audit https://yourdomain.com` — full SEO audit with scoring
> - `/seo geo https://yourdomain.com` — AI search readiness only
> - `/seo schema https://yourdomain.com` — check your structured data
> - `/seo plan saas` — get an SEO strategy for your business type

Offer to run either or both now.

---

## Common Issues and Fixes

### "command not found: npm"
Node.js isn't installed or isn't in PATH. Revisit Step 1A.

### "Permission denied" when pushing
GitHub auth expired. Run `gh auth login` again.

### Site builds but CSS looks wrong
Usually a font not loading. Check the `<link>` tags in `Base.astro` are correct.

### Domain shows "Not secure" warning
SSL certificate is still generating. Wait 10–15 minutes and refresh.

### GitHub Actions fails with "Cloudflare token error"
Check that `CLOUDFLARE_API_TOKEN` and `CLOUDFLARE_ACCOUNT_ID` are set correctly in repo secrets. Go to: github.com/[username]/[slug]/settings/secrets/actions.

---

## Tone Reminders

Throughout this skill:
- Explain what each thing IS before asking them to do it
- Don't use jargon without defining it (GitHub = "code storage"; deploy = "put live on the internet")
- If they get an error, read it carefully and explain what it means in plain language before suggesting a fix
- Celebrate small wins ("Your code is on GitHub!" / "Your site is live!")
- Never make them feel stupid for not knowing something

---

## Handoff

Once everything is live, show the "Which Tool When" guide from Step 6 and offer to run `/audit-site` first (fast, catches build issues), then `/seo audit` (thorough, catches search issues).
