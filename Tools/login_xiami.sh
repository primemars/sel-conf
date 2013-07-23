curl  --data "done=%2F&email=xxx&password=xxx&submit=%E7%99%BB+%E5%BD%95"   http://www.xiami.com/member/login -D /tmp/xiami_cookie
curl --data "" --user-agent "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.112 Safari/535.1" \
    -H "Origin: http://www.xiami.com" \
    -H "Referer: http://www.xiami.com/" \
    -H "X-Requested-With: XMLHttpRequest" \
    -v http://www.xiami.com/task/signin -b /tmp/xiami_cookie