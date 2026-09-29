#!/usr/bin/env bash
# Run the "Naukri Jobs Scraper — India Job Listings" Apify Actor synchronously and print the dataset items.
# Usage: export APIFY_TOKEN=your_apify_token && ./run.sh
set -euo pipefail
: "${APIFY_TOKEN:?Set APIFY_TOKEN first (Apify Console > Settings > API & Integrations)}"

curl -sS -X POST "https://api.apify.com/v2/acts/leadsbrary~naukri-jobs-scraper/run-sync-get-dataset-items" \
  -H "Authorization: Bearer ${APIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  -d @- <<'JSON'
{
  "keywords": [
    "data engineer"
  ],
  "location": [
    "bangalore"
  ],
  "startUrls": [],
  "includeJobDescription": false,
  "maxResults": 3,
  "proxyConfiguration": {
    "useApifyProxy": true
  }
}
JSON
