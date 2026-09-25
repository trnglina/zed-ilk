⚠️ WARNING: This project is AI-generated, and is a **placeholder** for real editor support.

---

# zed-ilk

Zed extension for [Ilk](../ilk): syntax highlighting for `.ilk` documents and `.ilkm` meta files, using the grammars in [tree-sitter-ilk](../tree-sitter-ilk).

## Install

In Zed, run `zed: install dev extension` and pick this directory. Zed fetches and compiles the grammars itself; no other tooling is needed.

## Dimming markup

Every capture in `languages/ilk/highlights.scm` has an `ilk.*` fallback (e.g. `@operator @ilk.operator`). Zed tries the rightmost capture first, and resolves names by longest dot-prefix, so:

- by default no theme defines `ilk.*`, and markup uses the theme's usual colours;
- defining `ilk` in `theme_overrides` restyles all non-prose syntax at once;
- defining `ilk.<capture>` (e.g. `ilk.operator`) refines a single category.

Overrides are per theme, and there is no opacity setting for syntax, so dimmed colours are explicit. These are One Dark's colours blended halfway toward its background (`#282c33`); add them to `settings.json`:

```json
{
  "theme_overrides": {
    "One Dark": {
      "syntax": {
        "ilk": { "color": "#6a6f78" },
        "ilk.comment": { "color": "#424851" },
        "ilk.constant": { "color": "#84765c" },
        "ilk.function": { "color": "#4e6c8e" },
        "ilk.label": { "color": "#4e6c8e" },
        "ilk.number": { "color": "#74604e" },
        "ilk.operator": { "color": "#4b7079" },
        "ilk.punctuation.special": { "color": "#6c423f" },
        "ilk.string": { "color": "#64765a" },
        "ilk.string.escape": { "color": "#585d66" }
      }
    }
  }
}
```

`ilk` on its own covers punctuation, variables, and anything not listed. `.ilkm` files are all code, so the meta language has no `ilk.*` captures.

## Updating the grammar

1. Commit the change in `tree-sitter-ilk`.
2. Update both `rev` fields in `extension.toml` to the new commit.
3. Update the queries in `languages/` to match any node changes. These are maintained here, separately from the queries in `tree-sitter-ilk`.
4. Rebuild the dev extension from the Extensions page.
