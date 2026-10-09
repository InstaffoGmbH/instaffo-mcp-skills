# Changelog

## 0.3.3

### Changed

- `instaffo-mcp-basics`: new Messages section. Never answer a candidate's question on your own, copy the user's current template for "the usual message", and show the text before the first send
- `recruiting-best-practices`: invites no longer answer open candidate questions. New red flags: maximum on every self-rating, basic tool use as proof of advanced skill (the criteria file defines the levels), courses as practice, replies copied from an AI tool

## 0.3.2

### Changed

- `recruiting-best-practices`: always check profile links (GitHub, portfolio) and ask the user to check them too. Self-rated skill years are not evidence. Weigh the latest station, and check which side "Full Stack" work is on. Flag disagreeing location texts. Where earlier employers were is not a criterion
- `recruiting-best-practices` and `define-criteria`: whether freelance-only careers fit depends on the job; ask once and store it in the criteria file
- `pre-screen`: open profile links, list them for the user, and turn the user's overrides into criteria after asking

## 0.3.1

### Changed

- `instaffo-mcp-basics`: accepting posts the job greeting, so agents draft no first message. Flag greetings that ask for hard facts and suggest screening questions instead
- `pre-screen` and `prep-interview` point to the greeting rules

## 0.3.0

### Added

- `help-center` skill: answers how Instaffo features work from the public Help Center, with the source link

## 0.2.1

### Changed

- `write-note`: no "Not covered" section and no lines about unasked questions. The decision line states the interviewer's doubts

## 0.2.0

### Added

- `recruiting-best-practices` skill: CV linearity, station length, job hopping and gaps. A missing chat reply is no reason to wait or reject

### Changed

- `pre-screen` and Scout follow the best practices and propose a call or one follow-up instead of waiting for replies
- `instaffo-mcp-basics`: language levels are buckets, use the panel labels. GDPR: humans decide, delete files after the process
- `prep-interview`: no questions the screening answers already settle, open with a real question
- `write-note`: format for profile-only pre-screen notes
- An invite always moves the candidate to `first_interview` in the same approved step
- `analyze-interview`: check for a second transcript before calling a call failed

## 0.1.1

### Changed

- The plugin no longer adds its own Instaffo MCP server. Connect the MCP once in your tool, see README
- README: beta access notice, requirements, correct install command

## 0.1.0

### Added

- Scout agent for recruiting workflows on the Instaffo MCP
- `/define-criteria`, `/pre-screen`, `/prep-interview`, `/analyze-interview`, `/write-note`
