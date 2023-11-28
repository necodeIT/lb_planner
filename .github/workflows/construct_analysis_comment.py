import sys

LINTS_FILE = sys.argv[1]
COMMIT_SHA = sys.argv[2]
PR_URL = sys.argv[3]
OUTPUT_FILE = sys.argv[4]


# Read the file
with open(LINTS_FILE, "r") as f:
    LINTS = f.read().splitlines()

# Remove first line as it is always "Analyzing [package-name]..." and we don't want to include it in the comment
LINTS.pop(0)

# Remove empty lines
LINTS = [line.strip() for line in LINTS if line]

infos = 0
warnings = 0
errors = 0

for line in LINTS:
    if line.startswith("info"):
        infos += 1
    elif line.startswith("warning"):
        warnings += 1
    elif line.startswith("error"):
        errors += 1

comment = f"""
# Analysis Report ({COMMIT_SHA})

- **Infos**: {infos}
- **Warnings**: {warnings}
- **Errors**: {errors}

<details>
<summary>Click to see the full report</summary>

```bash
{chr(10).join(LINTS)}
```

</details>

---

[View annotated files]({PR_URL}/files)
"""

with open(OUTPUT_FILE, "w") as f:
    f.write(comment)
