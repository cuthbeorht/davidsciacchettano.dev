---
layout: post
title: REST Params
date: 2021-05-20 08:21:00
categories: Dev blog update
---

# Rest Params

I always get `Query Params` mixed up with `Path Params`. I think it's time I write about it so as to never forget again!

## REST API Call

```curl
GET https://api.somedomain.com/path/to/resource?id=998
```

Here is an example of a REST API call. Let's break it down.

- GET: The HTTP method
- https: The protocol used to make the call. In this case it is Hyper Text Transfer Protocol. [Here](https://www.w3.org/People/Bos/PROSA/rep-protocols.html) is a more complete list.
- api: subdomain of the main domain
- somedomain: Domain of the server hosting the REST API
- com: The type of web site. This is known as a [Top Level Domain (TLD)](https://en.wikipedia.org/wiki/Top-level_domain)
- /path/to/resource: This is the relative path or the URI to the Resource we want to query.
- id=998: This is a Query Param

We could modify this to use a `Path Variable`:

  - ```curl
    GET https://api.somedomain.com/path/to/resource/998
    ```
If you notice, now, there is no more `id=998`, but simply `/resource/998`.

As a matter of best practice, some prefer that Query Params **ONLY**  be used for filtering on the HTTP Resource and that Path Params be used as much as possible to identify resources.