# Repository Guidelines

## Project Structure & Module Organization

This is a Jekyll site for Cloud Tax Accountants, published through CloudCannon. Page files live in `pages/`, layouts in `_layouts/`, snippets in `_includes/`, structured content in `collections/`, and data in `_data/`. Styles are authored in `_sass/` and compiled from `assets/css/main.scss`. Static assets live under `assets/`, with uploaded content in `uploads/`.

Do not edit `_site/`; it is generated build output. CloudCannon configuration is in `cloudcannon.config.yaml`, and the client editor is `https://cloudtaxaccountants.com.au/update`.

## Build, Test, and Development Commands

- `bundle install`: install Ruby/Jekyll dependencies from `Gemfile.lock`.
- `bundle exec jekyll serve`: run the site locally at `http://localhost:4000`.
- `bundle exec jekyll build`: generate the static site into `_site/`.

Use Ruby `2.7+` if local installs fail on locked native gems. Avoid committing platform-only `Gemfile.lock` changes unless intentionally updating dependency support.

## Coding Style & Naming Conventions

Use the existing style in nearby files. Jekyll pages use YAML front matter followed by Liquid/HTML. Layouts and includes use two-space indentation. Sass uses four-space indentation inside rules; keep selectors scoped to page/layout classes.

Name new public pages with lowercase, hyphen-free or simple hyphenated filenames under `pages/`, and set explicit `permalink` values when URL stability matters, for example `/fbt2026v2/`.

## Testing Guidelines

There is no automated test suite. Treat `bundle exec jekyll build` as required validation before pushing. For page changes, inspect `_site/<page>/index.html` and confirm key strings, embeds, and links. For visual/editor changes, verify in CloudCannon after deploy.

## Commit & Pull Request Guidelines

Use short sentence-case commit messages, for example `Add FBT 2026 Cognito preview page`. CloudCannon may create commits like `Updated 2 files via CloudCannon.`; do not rewrite them unless cleaning history is explicitly requested.

PRs should include a summary, affected URLs, validation performed, and screenshots for visible layout changes. Mention CloudCannon editor impact.

## Security & Configuration Tips

Do not commit secrets, API tokens, or Cloudflare credentials. Pushes to `master` trigger a CloudCannon build and publish to `cloudtaxaccountants.com.au`, live in under one minute.

CloudCannon Client Sharing lets external clients edit this site using the `/update` login and a site-specific password. Zeenet's client editor login is stored in 1Password. Keep editor-facing fields clear and safe for non-technical users.

Be careful with Cognito form embeds and Cloudflare redirect rules. FBT save/resume links may depend on the yearly Cloudflare Page Rule as well as the embedded form ID. Check the rule before promoting a new FBT form, for example `/fbt2024*` forwarding to the current `/fbt2026...` path.
