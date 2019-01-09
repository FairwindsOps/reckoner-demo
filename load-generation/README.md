# Load Testing

## Vote

Generate random votes on the vote application.

`k6 run vote.js --vus=1 --max=10 --duration=0`

When you kill it, you will see some stats on the response times.

