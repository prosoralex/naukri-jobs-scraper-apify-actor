# Naukri Jobs Scraper — India Job Listings — Apify Actor usage guide

[![Run on Apify](https://img.shields.io/badge/Apify-Run%20this%20Actor-24C1E0)](https://apify.com/leadsbrary/naukri-jobs-scraper?fpr=aupara)
[![Try Apify free](https://img.shields.io/badge/Apify-Try%20it%20free-24C1E0)](https://console.apify.com/sign-up?fpr=aupara)

A naukri jobs scraper that turns Naukri.com job searches into structured data: title, company, salary range, experience, skills, location, posted date and job URL. Export to JSON, CSV or Excel. From $0.22 per 1,000 results.

> **This repository does not contain the Actor's source code.** The Actor is closed-source and
> runs on Apify's infrastructure. This repo is documentation plus ready-to-run client examples
> (curl, Python, JavaScript) that call the hosted Actor with **your own** Apify API token.

**Run it on Apify →** [https://apify.com/leadsbrary/naukri-jobs-scraper?fpr=aupara](https://apify.com/leadsbrary/naukri-jobs-scraper?fpr=aupara)

## What it does

The Actor queries naukri.com's public job-search pages for the keywords, locations and filters you give it. A plain HTTP request to Naukri's search API is blocked by an Akamai bot check, so the Actor drives a fingerprinted headless browser and reads the same JSON response (`jobapi/v3/search`) the site's own page already loads — no HTML/DOM scraping. Listings are deduplicated by Naukri's own job ID and one dataset row is delivered per unique job. Only data naukri.com already shows to any visitor without logging in is collected — no login, no candidate profiles, no recruiter dashboard, and no recruiter emails or phone numbers.

## Use cases

- Bulk collection of Naukri job listings for an India-focused job board or aggregator, refreshed on a schedule.
- Recruiter and staffing-agency lead sourcing: find companies actively hiring for a given role and city.
- HR and market analytics: track hiring volume, salary bands and in-demand skills by keyword, location and experience level over time.
- Competitive hiring intelligence: monitor which roles named target companies are advertising publicly.


## Input

| Field | Type | Required | Description |
|---|---|---|---|
| `keywords` | array | no | Job titles, skills or free-text queries to search on Naukri. Each keyword is searched separately. |
| `location` | array | no | City or region filter as used by Naukri search (e.g. bangalore, delhi-ncr). Empty means all India. |
| `startUrls` | array | no | Optional Naukri search-results page URLs to process directly, instead of keywords/location (individual job-detail URLs are not supported). Only naukri.com URLs are accepted. |
| `experienceYears` | integer | no | Minimum years of experience filter (0-30). Leave empty for no filter. |
| `postedWithinDays` | integer | no | Freshness filter: only jobs posted within the last N days (Naukri supports 1, 3, 7, 15, 30). Leave empty for no filter. |
| `salaryMinLakhs` | integer | no | Minimum annual salary filter in INR lakhs, mapped to Naukri's own salary facet buckets. Leave empty for no filter. |
| `includeJobDescription` | boolean | no | Fetch each job's detail page to add the full description text, employment type and applicant count. Slower and one extra page load per result. |
| `onlyNewSince` | string | no | Skip listings whose posted date is older than this ISO 8601 timestamp, so scheduled runs only bill new jobs. |
| `maxResults` | integer | yes | Hard cap on delivered results across all keywords; also caps spending. |
| `proxyConfiguration` | object | no | Naukri blocks unfingerprinted/datacenter-heavy traffic; Apify Proxy is recommended. Select a residential-friendly group your account has access to if the default pool gets blocked. |

The full input form (with defaults and validation) is on the [Actor page](https://apify.com/leadsbrary/naukri-jobs-scraper?fpr=aupara).


## Output (sample item)

```json
{
  "jobId": "050826500995",
  "title": "Data Engineer",
  "company": "Cisco",
  "companyUrl": "https://www.naukri.com/cisco-jobs-careers-59823",
  "companyRating": 4.1,
  "location": [
    "Bengaluru"
  ],
  "experienceMinYears": 4,
  "experienceMaxYears": 8,
  "salary": null,
  "skills": [
    "Computer science",
    "Data analysis",
    "Agile scrum",
    "Analytical",
    "Manager Technology",
    "PLSQL",
    "data integrity",
    "cisco"
  ],
  "jobType": null,
  "workMode": null,
  "postedAt": "2026-08-30T00:00:00.000Z",
  "postedAtRaw": "30+ Days Ago",
  "description": "Meet The Team Our team works in a fast-paced, complex environment. We have the opportunity and obligation to provide accurate and timely foundation data to different functions across Cisco. In this role, you will work very closely with Ops delivery lead on Customer and partner Data Operations to ensure smooth and efficient operations. You will also get to work with several cross functional stakeholders, vendors, technical IT teams, senior leadership and customers / partners. We are a highly collaborative and energetic team focused on innovation and thought leadership. Your Impact Highly detail-oriented with strong analytical abilities, including advanced data analysis skills using MS Excel/Access, Oracle SQL, and PL/SQL. Conduct exploratory data analysis (EDA) to uncover trends, identify anomalies, and highlight business opportunities. Demonstrates excellent verbal and written communication skills, as well as effective business partnering capabilities. Validates data from various third-party sources and develops strategies for optimal utilization. Applies AI techniques such as predictive analytics, LLM, NLP, and intelligent data enrichment. Possesses solid business knowledge, enabling the integration and extraction of data from multiple sources to support solutions with high data integrity. Adopts a problem-solving mindset and collaborates effectively across global, cross-functional teams. Connect with different stake holders, cross functional teams, Ops teams and IT teams for understanding data issues and fixes Self-motivated, results-driven, proactive, and adaptable; able to work independently in a fast-paced, dynamic environment while being a collaborative team player with strong interpersonal skills. Minimum Qualifications Bachelor s degree in computer science, Information Technology, Engineering, or a relevant field Minimum 4 to 8 years data delivery experience Proven experience achieving business outcomes, in a fast paced highly cross-functional organization Proficient in SQL, PL/SQL for data analysis Strong knowledge on Geo Postal data maintenance Strong Agile (Scrum) experience Preferred Qualifications Experience working in AI-powered analytics solutions that improved business decision accuracy and reduced manual reporting effort. Strong understanding of Cisco s Go to Market Strategies. Previous experience in Cisco tools like Customer master data, SAVM, SFDC, SHARE, PDB, PGTMV, CAV etc. Ability to handle high levels of ambiguity but seek clarification when needed Excellent problem-solving, analytical, communication, and collaboration skills. Why Cisco At Cisco, we re revolutionizing how data and infrastructure connect and protect organizations in the AI era and beyond. We ve been innovating fearlessly for 40 years to create solutions that power how humans and technology work together across the physical and digital worlds. These solutions provide customers with unparalleled security, visibility, and insights across the entire digital footprint. Fueled by the depth and breadth of our technology, we experiment and create meaningful solutions. Add to that our worldwide network of doers and experts, and you ll see that the opportunities to grow and build are limitless. We work as a team, collaborating with empathy to make really big things happen on a global scale. Because our solutions are everywhere, our impact is everywhere. We are Cisco, and our power starts with you. This job posting has been aggregated from external source. Role details, content, and availability are subject to change. Applicants are advised to confirm the latest information directly on the company website before applying",
  "openings": null,
  "applicantCount": null,
  "url": "https://www.naukri.com/job-listings-data-engineer-cisco-bengaluru-4-to-8-years-050826500995",
  "searchKeyword": "data engineer",
  "scrapedAt": "2026-09-29T05:32:11.579Z"
}
```

## Pricing

Pay only for results: about **$0.33 per 1,000 results** on the Apify Free plan, down to **$0.22 per 1,000** on paid Apify plans.

Prices can change — the [Actor page](https://apify.com/leadsbrary/naukri-jobs-scraper?fpr=aupara) always shows the current pricing.

## Quick start

You need an Apify account and an API token (Apify Console → **Settings → API & Integrations**).
Never commit your token: export it as the `APIFY_TOKEN` environment variable.

### cURL

```bash
curl -X POST "https://api.apify.com/v2/acts/leadsbrary~naukri-jobs-scraper/run-sync-get-dataset-items" \
  -H "Authorization: Bearer $APIFY_TOKEN" \
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
```

### Python (`apify-client`)

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])

run_input = {
    "keywords": [
        "data engineer"
    ],
    "location": [
        "bangalore"
    ],
    "startUrls": [],
    "includeJobDescription": False,
    "maxResults": 3,
    "proxyConfiguration": {
        "useApifyProxy": True
    }
}

run = client.actor("leadsbrary/naukri-jobs-scraper").call(run_input=run_input)
for item in client.dataset(run["defaultDatasetId"]).iterate_items():
    print(item)
```

### JavaScript (`apify-client`)

```javascript
import { ApifyClient } from 'apify-client';

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });

const runInput = {
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
};

const run = await client.actor('leadsbrary/naukri-jobs-scraper').call(runInput);
const { items } = await client.dataset(run.defaultDatasetId).listItems();
console.log(items);
```

Runnable versions live in [`examples/`](./examples).

## Troubleshooting

- **401 / "User was not found or authentication token is not valid"** — check that `APIFY_TOKEN` is set and copied completely.
- **The run finished but the dataset is empty** — widen your search input or check the run log on the Apify Console.
- **Run stops early** — you may have reached the maximum cost per run you set in Apify; raise it in the run options.
- **Need something else?** Open an issue in this repository or use the Issues tab on the Actor page.

## Don't have an Apify account yet?

[Sign up here](https://console.apify.com/sign-up?fpr=aupara) — new accounts get $5 of free platform usage every month, enough to try most Actors without paying upfront.
Browse the full [Apify Store](https://apify.com/store?fpr=aupara) or [all Actors from this developer](https://apify.com/leadsbrary?fpr=aupara).

## Links

- Actor page: [https://apify.com/leadsbrary/naukri-jobs-scraper?fpr=aupara](https://apify.com/leadsbrary/naukri-jobs-scraper?fpr=aupara)
- All Actors from this developer: [https://apify.com/leadsbrary?fpr=aupara](https://apify.com/leadsbrary?fpr=aupara)
- Apify API reference: [https://docs.apify.com/api/v2](https://docs.apify.com/api/v2)

## Keywords

naukri jobs scraper, naukri job scraper, naukri.com scraper, scrape naukri jobs, naukri job listings api, india jobs scraper, india job board scraper, naukri jobs api, job scraper india, naukri job data export, indian job listings dataset, recruitment data scraper india, job postings scraper, naukri salary data, hiring data india

#naukri #jobscraper #jobs #india #recruiting #hrtech #jobboard #webscraping #leadgeneration #dataextraction #apify #jobsapi

## License

The example code in this repository is released under the MIT License — see [LICENSE](./LICENSE).
It does not cover the Actor itself, which remains closed-source and is operated by its developer on Apify.
