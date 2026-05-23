# 🎬 Video Recording Script — read this while you record

**Total time: about 6–8 minutes. Speak slowly and clearly. You can record in several takes.**

**Screen setup (like the reference videos):**
- LEFT side of screen: PowerShell window (in your K6_TEST folder)
- RIGHT side of screen: your GitHub README open in a browser
- Second browser tab: https://jsonplaceholder.typicode.com/posts

---

## PART 1 — Intro (~30 seconds)
*(README visible on screen)*

> "Hi, my name is Mariatulkaftiah binti Othman. This is my ITT440 individual assignment, titled: Comprehensive Performance Testing and Bottleneck Analysis of the JSONPlaceholder REST API Using Grafana k6. In this video, I will explain my tool, show my test scripts, run a test live, and walk through my results and findings."

---

## PART 2 — The Target API (~30 seconds)
*(Click your JSONPlaceholder browser tab)*

> "This is my target — the public API endpoint jsonplaceholder dot typicode dot com slash posts. It's a free REST API made for testing. As you can see, it returns a list of fake blog posts in JSON format. This is what I will send traffic to during my tests."

---

## PART 3 — Tool & Scripts (~1.5 minutes)
*(Open your load-test.js file — in Notepad or VS Code)*

> "My testing tool is Grafana k6. I chose it because it's open-source, lightweight enough to simulate hundreds of users on a normal laptop, and the tests are written in simple JavaScript. I created three test scripts.

> This is my LOAD test. The important part is this 'stages' section — it ramps up to 20 virtual users, holds for one minute, then ramps down. This simulates normal everyday traffic. Each virtual user sends a GET request to read posts, and sometimes a POST request to create one, with a one-second pause to act like a real human.

> My STRESS test is similar but climbs much higher — 50, then 100, 200, and 300 virtual users — to find the breaking point.

> My SPIKE test jumps suddenly from 10 to 300 users in just 10 seconds, to simulate a sudden traffic burst, then drops back down to test recovery."

---

## PART 4 — Run a Test LIVE (~2 minutes) ⭐ MOST IMPORTANT PART
*(Click the PowerShell window)*

> "Now I'll run my load test live. I type: k6 run load-test dot j-s, and press enter."

*(Let it run. While the progress bar moves:)*

> "You can see k6 is now running. Here's the live progress bar, the number of virtual users climbing, and the requests being sent to the API in real time."

*(When the summary table appears, point at it:)*

> "Now it's finished. Here's the summary table. This line, http-req-duration, is the response time. This line, http-req-failed, is the error rate — you can see zero percent failures. And http-reqs here shows the throughput, the requests per second."

---

## PART 5 — Results & Charts (~2 minutes)
*(Switch to README, scroll to Results & Analysis with your 3 charts)*

> "Here are my full results across all three tests.

> My first chart is the response time comparison. Notice the average and p95 stayed low and steady — around 300 and 900 milliseconds — even as users increased from 20 to 300. But the maximum response time jumped to almost 9 seconds under stress. This is my main bottleneck, called tail latency — most requests are fast, but a few are very slow.

> My second chart is throughput. It shows the API scaled well, handling over 100 requests per second under heavy load without any failures.

> My third chart is the error rate. Surprisingly, my normal load test had the highest failure rate at 8.4 percent, while the heavy tests had almost none. This was not real errors — it was a cold-start effect, because the load test ran first, before the network connections had warmed up."

---

## PART 6 — Conclusion (~30 seconds)

> "In conclusion, the JSONPlaceholder API was very robust — it handled 300 concurrent users with zero real failures across more than 48,000 requests. Its main weakness was tail latency. My biggest lesson was discovering the cold-start effect, which taught me that connections should be warmed up before measuring. My recommendations include using caching and a CDN to reduce tail latency, and running these tests continuously in a CI/CD pipeline. Thank you for watching."

---

**🎥 That's it! After recording, upload to YouTube (can be Unlisted), copy the link, and paste it into your README's Demo Video section.**
