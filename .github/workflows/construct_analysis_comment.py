"""
This script processes linting results and generates a formatted analysis report suitable to be posted as a comment.

Usage:
------
```bash
python script_name.py [LINTS_FILE] PR_NUMBER] [OUTPUT_FILE]
```

Parameters:
- LINTS_FILE: The file path containing the linting results.
- PR_NUMBER: The number of the PR being analyzed.
- OUTPUT_FILE: The file path where the generated comment will be saved.

Example:
--------
```bash
python script_name.py "lint_results.txt" "abcd1234" "http://example.com/pr" "report.md"
```
"""

import sys

LINTS_FILE = sys.argv[1]
PR_NUMBER = sys.argv[2]
OUTPUT_FILE = sys.argv[3]


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
- **Infos**: {infos}
- **Warnings**: {warnings}
- **Errors**: {errors}

<details>
<summary>Click to see the full report</summary>

```
{chr(10).join(LINTS)}
```

</details>

---

[View annotated files]({PR_NUMBER}/files)
"""

with open(OUTPUT_FILE, "w") as f:
    f.write(comment)
