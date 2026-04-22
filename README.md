# Claude Code Skills

Pre-built skills for Claude Code that help you build, audit, and optimise websites.

## Skills included

| Skill | What it does |
|---|---|
| `/create-website` | Guides you through building and deploying a website from scratch (Astro + Cloudflare Pages + GitHub Actions) |
| `/frontend-design` | Designs distinctive, production-grade pages with high design quality |
| `/audit-site` | Checks your site for broken links, accessibility issues, and code quality |
| `/seo` | Deep SEO analysis with 12 sub-commands, scores your site 0-100, checks AI search readiness |

## Install (recommended)

This clones the repo to your current folder, then copies each skill into `~/.claude/skills/` without touching any other skills you already have there.

```bash
git clone https://github.com/Keith-cclarity/keith-website-skills.git
cd keith-website-skills
./install.sh
```

Restart Claude Code and try `/create-website`.

## Install manually (step-by-step)

If you'd rather see every step:

```bash
# 1. Make sure the skills folder exists
mkdir -p ~/.claude/skills

# 2. Clone the repo (creates a keith-website-skills folder here)
git clone https://github.com/Keith-cclarity/keith-website-skills.git

# 3. Copy all four skills into place
cp -R keith-website-skills/audit-site ~/.claude/skills/
cp -R keith-website-skills/create-website ~/.claude/skills/
cp -R keith-website-skills/frontend-design ~/.claude/skills/
cp -R keith-website-skills/seo ~/.claude/skills/
```

## Install a single skill

If you only want one (e.g. just `/seo`):

```bash
mkdir -p ~/.claude/skills
git clone https://github.com/Keith-cclarity/keith-website-skills.git
cp -R keith-website-skills/seo ~/.claude/skills/
```

## Update later

To pull the latest version of the skills:

```bash
cd keith-website-skills
git pull
./install.sh
```

## Requirements

- [Claude Code](https://claude.ai) (requires Claude Pro, Max, or Team subscription)
- Node.js 20+
- Git

## Author

Keith Teo — [keithteo.ai](https://keithteo.ai)
