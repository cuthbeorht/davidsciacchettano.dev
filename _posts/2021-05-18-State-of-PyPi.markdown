---
layout: post
title: Update to the Status of PyPi
date: 2021-05-18 08:00:00
categories: Dev blog update
---

# Update to the Status of PyPi

- [Original article](https://dustingram.com/articles/2021/04/14/powering-the-python-package-index-in-2021/)

## What is PyPi?

- PyPi is a critical infrastructure for Python develoipment
- It is a repository of all published packages built for the language
- Canonical storage of package names
  - What does `canonical` mean?
- Entirely volunteer-driven/maintained

## List of Current Maintainers

- PyPI maintainers/administrators:
  - Donald Stufft
    - Ee W Durbin III
    - Dustin Ingram (me)
- PyPI moderators:
  - Yeray Diaz
    - Jason Madden
    - Joachim Jablon
    - Pradyun Gedam
    - Thea Flowers
- PyPI committershttps://dustingram.com/articles/2021/04/14/powering-the-python-package-index-in-2021/
  - Nicole Harris
  - Sumana Harihareswara
  - Alex Gaynor

## Services

- 2016 Monthly cost: $35K USD
- Today: $1.8M USD / Month

### Fastly

- Majority of traffic goes thru here
- Provides caching
- Much helping for cost & scalability
- Great discount - FREE!

### Google Cloud

- Host of public [datasets via BigQuery](https://console.cloud.google.com/marketplace/product/gcp-public-data-pypi/pypi)
- Recently moved to Google Cloud Storage from AWS S3 due to [CDN Interconnect Discount](https://cloud.google.com/network-connectivity/docs/cdn-interconnect)
  - Cheaper since the majority of the cost per month was going to bandwidth
- Google also pays the bill! - $10K / Month

### AWS

- Still use AWS for SQS, SNS, RDS, Elasticache (review), Route 53
- AWS also gives it's services for free - $7K / Month

### Other service

- Of note, they use Datadog

## Funding

- Largley donation based
- Enough to keep the lights on
- Not enough to pay for feature development/improvments
- What is on the books:
  - Full stack rewrite
  - Enabled 2FA, API tokens, localization - essentially security
- Malware detection and prevention
- Add support staff to manage improvments
- General tooling improvments

## Growth

- Lots growth in the last 4 years:
  - from 12 TB peak per day to 900 TB peak per day
- Next Steps
  - Need money
  - Volunteers
    - [List of good first isues for devs](https://github.com/pypa/warehouse/labels/good%20first%20issue)
