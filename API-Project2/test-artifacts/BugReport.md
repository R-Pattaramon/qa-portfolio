### Bug Report

## Bug ID: BUG-01

**Title:** POST does not validate required field (title)

- Severity: Medium

- Steps:
  1. Send POST request without "title" in request body
  2. Check response

- Expected:
  API should return 400 Bad Request, "title is null"

- Actual:
  API returns 201 Created without validating required field
