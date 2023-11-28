"""
This script is responsible for constructing a comment for unit tests run by GitHub Actions.
The constructed comment, containing a summary of the test results, will be posted to the PR via GitHub Actions.

The script retrieves test result data from a specified URL and extracts a summary of these results.
It then formats this summary into a comment, appending the specific commit ID for which the tests were run.
The final comment is written to a specified file and can be used by GitHub Actions to post back to the PR.

Usage:
------
```bash
python construct_unit_test_comment.py [URL] [COMMIT_ID] [OUT_FILE]
```

Parameters:
- URL: The endpoint from which the test result data is to be fetched. This should be a URL to a JSON file containing the test results.
- COMMIT_ID: The unique identifier of the commit for which the test results are applicable.
- OUT_FILE: The file to which the constructed comment is to be written.

Example:
--------
```bash
python construct_unit_test_comment.py "http://example.com/test-results.json" "abcd1234" "comment.txt"
```
"""

import requests as r
import json
import sys

# Retrieve the URL and commit ID from command-line arguments
URL = sys.argv[1]
COMMIT = sys.argv[2]
OUT_FILE = sys.argv[3]

# Fetch the test results from the provided URL
response = r.get(URL)

# Parse the JSON data from the response
data = json.loads(response.text)

# Extract the summary of test results
summary = data["output"]["summary"]

# Extract the badge from the summary as the summary is wrapped in a `<details>` tag and we want to display the badge outside of it
badge = summary.splitlines()[0]

# Remove the badge from the summary
summary = summary.replace(badge, "")

comment = f"""
# Test Results for " + {COMMIT}

{badge}

<details>
<summary>Click to see the full report</summary>

{summary}

</details>
"""

# Write the comment to OUT_FILE
with open(OUT_FILE, "w") as f:
    f.write(comment)
