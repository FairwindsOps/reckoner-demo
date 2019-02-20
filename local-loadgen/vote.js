import http from "k6/http";
import { check, fail } from "k6";
import { Rate } from "k6/metrics";

export let options = {
    noConnectionReuse: true,
    thresholds: {
        "errors": ["rate<0.05"]
    }
};

export let url = "https://interact.sudermanjr.com/"
export let errorRate = new Rate("errors");
var voteLetter = ''

export default function() {
    let params = {
        headers: {
                    "User-Agent": "k6"
                 },
        redirects: 5,
        tags: { "k6test": "yes" }
    };
    let jar = http.cookieJar();
    jar.set(url, "testing", "always");

    var choice = Math.random() >= 0.5;

    if (choice) {
        voteLetter = 'a'
    } else {
        voteLetter = 'b'
    }

    let vote = {
        "vote": voteLetter
    }
    let res = http.post(url, vote,  params );

    errorRate.add(res.status != 200);
    check(res, {
        "Status 200": (r) => r.status === 200
    });
};
