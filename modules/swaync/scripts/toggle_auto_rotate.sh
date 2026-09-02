pgrep -f "hypr/auto_rotate.sh" >/dev/null \
  && pkill -f "hypr/auto_rotate.sh" \
  || "hypr/auto_rotate.sh" &
