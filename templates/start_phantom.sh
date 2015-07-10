#!/bin/bash
export PHANTOM_COUNT=7
export SELENIUM_HUB=http://127.0.0.1:4444

COUNT=1
while [ $COUNT -le $PHANTOM_COUNT ]; do

  let PORT=COUNT
  if [ $COUNT -ge 4 ]; then
    let PORT=PORT+1
  fi

  # --proxy=10.70.204.44:8080 --proxy-type=http
  /local/phantom/phantomjs --webdriver=444${PORT} --webdriver-selenium-grid-hub=$SELENIUM_HUB --ignore-ssl-errors=true --web-security=false --ssl-protocol=any 2>&1 >> /local/phantom/worker-${PORT}.log &
  let COUNT=COUNT+1
done
