---
name: instaffo-mcp-basics
description: "Rules and traps for the Instaffo Recruiter MCP tools (list_jobs, list_applications, get_application, get_screening, list_messages, notes, stage moves). Auto-loads before any call to an Instaffo MCP tool, and whenever a recruiting skill reads or writes Instaffo data."
user-invocable: false
---

# Instaffo MCP basics

## Write safety (strict)

These tools change what candidates or colleagues see. Draft first, show the draft, and call the tool only after the user says yes to that exact draft:

- `send_message`: the candidate is notified at once
- `screen_application`: `reject` concludes the application and notifies the candidate
- `move_application_stage`
- `create_note`, `update_note`, `delete_note` (delete cannot be undone)

Approval covers one action. "Post the note" does not approve a rejection. Set `notify_responsibles` only when the user asks for it.

## Reading data

- Chain IDs: `list_jobs` → job `uuid` → `list_applications(job_id)` → application `uuid` → everything else.
- Filter `list_applications` by `stage` on older jobs, or you page through hundreds of rejected rows. `meta.total` tells you if the list is partial.
- `get_screening`: `fit_analysis.results` is null when not scored. Null never means a score of 0. `hard_facts` (location, language, salary) is a separate, deterministic signal.
- `list_messages` returns `invalid_stage` for untriaged applications. Accept them with `screen_application` first, which only the user may approve.
- `candidate.email` and `phone` are null until the recruiter unlocks contact details in the panel.
- `data_archived: true` means the profile was purged. Say so, do not guess.
- `talent_feed: true` means the recruiter sourced the candidate. The candidate did not apply, so expect less context in the chat.

## What the MCP cannot do

- No job description. Job criteria come from the user (see `/define-criteria`).
- No hire, and no rejection after triage. Give the user the application `url` for the panel.
- No attachments. `documents` lists file names only.

## Notes format

`create_note` takes HTML: `p`, `strong`, `em`, `ul`, `ol`, `li`, `a`, `blockquote`, `h1`-`h6`. Record the verdict in `reaction` (`yes`, `not_sure`, `no`) with `reaction_reasons`, not only in the text.

## Personal data

Candidate data is personal data under GDPR. Keep local files inside the user's working folder. Do not paste profiles into other services.
