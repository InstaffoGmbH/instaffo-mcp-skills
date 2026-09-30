---
name: define-criteria
description: "Creates or updates the hiring criteria file for one Instaffo job: must-haves, nice-to-haves, red flags, salary range, and the one gate question. Use when the user starts working on a new job, says 'set up criteria', 'what are we looking for', or when another recruiting skill finds no criteria file."
user-invocable: true
---

# Define criteria

Every other recruiting skill reads `recruiting/<job-slug>/criteria.md`. This skill writes it.

## Steps

1. `list_jobs` and let the user pick the job. Slug = job name in kebab-case.
2. If `recruiting/<job-slug>/criteria.md` exists, show it and ask what changed.
3. Ask for the job ad text or a link. The MCP has no job description.
4. Interview the user. One question at a time, and propose an answer from the ad each time:
   - What must a hire have on day one? Maximum 4 items.
   - What is the **gate**: the one criterion that ends the process when missing?
   - What would be nice but is not required?
   - Red flags seen in past candidates.
   - Salary range, location and remote rules, languages, notice period limit.
   - Interview process: steps and who runs them.
5. Write the file with the template below. Show it and ask for corrections.

## Template

```markdown
---
job: <job name>
job_id: <uuid>
---

# Gate

<one criterion, and how to test it in one question>

# Must-have

1. <criterion>: <what a strong answer or CV line looks like>

# Nice-to-have

- <item>

# Red flags

- <pattern>

# Hard facts

- Salary: <range>
- Location: <rule>
- Languages: <rule>
- Notice: <max>

# Process

1. <step>
```

Every criterion must be testable with one real, recent example from the candidate. Rewrite vague criteria ("team player", "passionate") until they are.
