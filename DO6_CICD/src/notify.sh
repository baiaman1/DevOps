#!/bin/bash

STATUS=$1
TELEGRAM_BOT_TOKEN="5974752186:AAHvmkfGmGkhMP-9NG2wo5JLvoLl9ZmyMtY"
TELEGRAM_USER_ID="1006266594"

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Deploy status: $STATUS%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null