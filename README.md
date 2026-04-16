# Claude Code Skills

Pre-built skills for Claude Code that help you build, audit, and optimise websites.

## Skills included

| Skill | What it does |
|---|---|
| `/create-website` | Guides you through building and deploying a website from scratch (Astro + Cloudflare Pages + GitHub Actions) |
| `/frontend-design` | Designs distinctive, production-grade pages with high design quality |
| `/audit-site` | Checks your site for broken links, accessibility issues, and code quality |
| `/seo` | Deep SEO analysis with 12 sub-commands, scores your site 0-100, checks AI search readiness |

## Install all skills (one command)

```bash
git clone https://github.com/Keith-cclarity/keith-website-skills.git ~/.claude/skills
```

Then open Claude Code and use any skill by name (e.g. "run /create-website").

## Install a single skill

If you only want one skill, download just that folder:

```bash
# Create the skills directory
mkdir -p ~/.claude/skills

# Download a specific skill (replace SKILL_NAME with: create-website, audit-site, frontend-design, or seo)
cd ~/.claude/skills
git clone --depth 1 --filter=blob:none --sparse https://github.com/Keith-cclarity/keith-website-skills.git temp
cd temp
git sparse-checkout set SKILL_NAME
cp -r SKILL_NAME ..
cd .. && rm -rf temp
```

Or just tell Claude Code: "Download and install the create-website skill from https://github.com/Keith-cclarity/keith-website-skills"

## Requirements

- [Claude Code](https://claude.ai) (requires Claude Pro, Max, or Team subscription)
- Node.js 20+
- Git

## Author

Keith Teo — [keithteo.ai](https://keithteo.ai)
