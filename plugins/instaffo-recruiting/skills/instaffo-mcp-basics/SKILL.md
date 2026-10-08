---
name: instaffo-mcp-basics
description: "Rules and traps for the Instaffo Recruiter MCP tools (list_jobs, list_applications, get_application, get_screening, list_messages, notes, stage moves). Auto-loads before any call to an Instaffo MCP tool, and whenever a recruiting skill reads or writes Instaffo data."
user-invocable: false
---

# Instaffo MCP basics

## Write safety (strict)

These tools change what candidates or colleagues see. Draft first, show the draft, and call the tool only after the user says yes to that exact draft:

- `send_message`: the candidate is notified at once
- `screen_application`: `accept` posts the job greeting in the chat (see Greeting), `reject` concludes the application and notifies the candidate
- `move_application_stage`
- `create_note`, `update_note`, `delete_note` (delete cannot be undone)

Approval covers one action. "Post the note" does not approve a rejection. The one exception: approving an invite also approves moving the candidate to `first_interview`. Set `notify_responsibles` only when the user asks for it.

## Reading data

- Chain IDs: `list_jobs` → job `uuid` → `list_applications(job_id)` → application `uuid` → everything else.
- Filter `list_applications` by `stage` on older jobs, or you page through hundreds of rejected rows. `meta.total` tells you if the list is partial.
- `get_screening`: `fit_analysis.results` is null when not scored. Null never means a score of 0. `hard_facts` (location, language, salary) is a separate, deterministic signal.
- `list_messages` returns `invalid_stage` for untriaged applications. Accept them with `screen_application` first, which only the user may approve.
- `candidate.email` and `phone` are null until the recruiter unlocks contact details in the panel.
- `data_archived: true` means the profile was purged. Say so, do not guess.
- `talent_feed: true` means the recruiter sourced the candidate. The candidate did not apply, so expect less context in the chat.

## Greeting

Each job has a greeting. Accepting with `screen_application` posts it as the first chat message. In `list_messages` it is the first message, with `uuid: null`.

- Do not draft or send your own first message on accept. Use the `message` parameter only for something the greeting does not cover.
- A good greeting asks only what the screening questions do not cover. Example: how the candidate's way of working with AI tools changed, or one concrete example from their work.
- Check the greeting every time you see it. If it asks for salary expectation, CV, start date, notice period, location or similar hard facts, tell the user at once. These belong in the job's screening questions, where Instaffo collects them in a structured way (`get_screening` shows them). Suggest moving them there.
- No reply to the greeting is not a red flag. See `recruiting-best-practices`.

## What the MCP cannot do

- No job description. Job criteria come from the user (see `/define-criteria`).
- No hire, and no rejection after triage. Give the user the application `url` for the panel.
- No attachments. `documents` lists file names only.
- No CV file. `get_application` returns the parsed profile only. The uploaded CV and linked profiles can be newer.
- No product docs. For how a feature or setting works, use `help-center`.

## Language levels

`languages[].rating` values (`A2`, `B2`, `C1`, `C2`) are buckets, not exact CEFR levels. `C2` also covers native speakers, `A2` also covers A1. Use the company panel labels in notes: `A2` basic, `B2` conversational, `C1` fluent, `C2` business fluent. Never write a code as if it were a test result.

Judge the level the job needs, never whether someone is a native speaker. Requiring or preferring native speakers is discrimination by origin under the AGG.

## Notes format

`create_note` takes HTML: `p`, `strong`, `em`, `ul`, `ol`, `li`, `a`, `blockquote`, `h1`-`h6`. Record the verdict in `reaction` (`yes`, `not_sure`, `no`) with `reaction_reasons`, not only in the text.

## Personal data

Candidate data is personal data under GDPR. Keep local files inside the user's working folder. Do not paste profiles into other services.

- **Humans decide.** Every accept, reject and verdict is the user's decision. Your proposal is input, never an automated decision (GDPR Art. 22).
- **Retention.** Files in `recruiting/` are only needed while the process runs. Remind the user to delete a candidate's files once the process is closed and the company's retention period has passed.
