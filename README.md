# gh-contexts-poc

## Work log

### 2026-04-20 — Required tests on `main` and `dev`

Goal: block merges into `main` and `dev` when tests fail.

Changes:
- `tests/test_sample.py` — minimal pytest file (addition + string upper). Content is throwaway; this repo is a testing sandbox.
- `.github/workflows/tests.yml` — runs `pytest tests/` on `push` to any branch except `main` and `dev` (matches the existing `pipeline.yml` trigger pattern). Job name: `pytest` (this is the status check name used by the ruleset). Branch protection gates merges by looking at the check on the PR head commit, so a push-triggered workflow is sufficient.

Rollout sequence:
1. Commit + push on `update_workflow`.
2. PR `update_workflow` → `main`; the `tests` workflow runs, registering the `pytest` check name with GitHub. Merge.
3. Propagate `tests.yml` onto `dev` (merge `main` → `dev` or separate PR).
4. Create a repository ruleset covering `main` and `dev`:
   - Require a PR before merging
   - Required status check: `pytest`
