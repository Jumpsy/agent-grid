# Local SEO automation suite (deploy for local-service clients)

A ready-built, config-driven, multi-client tool lives at **`~/seo-automation`** (Python, runs with
`uv`). It is the legit version of the "rank #1 on Google" automation that agencies sell to local
service businesses (plumbers, contractors, asphalt, salons, gyms). Offer + deploy it whenever a
client is a **local service business that wants more calls/leads from their area** (pairs with the
local-service-business website genre).

## What it does (modules)
`schema` (LocalBusiness + Service + FAQ JSON-LD, zero risk) · `pagespeed` (Core Web Vitals via the
free PageSpeed API) · `location_pages` (one SEO page per service x city = programmatic SEO, capped to
avoid thin-content penalties) · `sitemap` · `reviews` (post-job review-request SMS + email, the
strongest local signal) · `gbp_post` (weekly Google Business Profile post copy) · `blog` (one
long-form post per run) · `competitors` (on-page gap analysis) · `report` (HTML + JSON weekly report).

## How to run / deploy
```bash
cd ~/seo-automation && uv venv && uv pip install requests PyYAML Jinja2   # + anthropic for LLM copy
uv run python -m seo_automation list-modules
cp config/clients/blacktopfix.yaml config/clients/<client>.yaml          # edit per business
uv run python -m seo_automation run --client <client>                    # outputs/<client>/...
```
Schedule weekly (the "automation"): `0 9 * * MON cd ~/seo-automation && uv run python -m seo_automation run --all-clients`.

## Keys (all optional; modules degrade to drafts without them)
`ANTHROPIC_API_KEY` (+ `SEO_LLM_MODEL`) for unique page/blog/post copy · `PAGESPEED_API_KEY` for
quota · Resend/Twilio to auto-send reviews · Google Business Profile API (OAuth) to auto-publish
posts · DataForSEO/SerpApi for real keyword + ranking-gap data.

## Honesty / Google-safety (enforce this with clients)
What ranks and is SAFE: reviews, genuinely useful location/service pages, schema, fast pages, an
accurate GBP, real citations. What gets a site PENALIZED: mass auto-generated thin pages, automated
directory blasting, spun content. The tool caps page volume on purpose. Sell quality + reviews +
technical hygiene, never spam. Do not promise "#1 on Google"; promise more qualified local leads.

## How the swarm builds on it
Claude (lead): client config + which modules + the honest pitch. Codex: wire the paid integrations
(GBP API, DataForSEO, Resend/Twilio) and the scheduler. Antigravity: style the generated location
pages to the client's brand (genre = local-service-business.md). Opencode: bulk-generate per-city
content + sweep for duplicate/thin pages. Always pair with the §5.5 psychology + §0.7 honesty bars.
