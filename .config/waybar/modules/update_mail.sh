new="$(notmuch search tag:unread | wc -l)"
old="$(cat ~/.status/EMAIL_COUNT)"

mbsync -a
notmuch reindex '*'
notmuch new

if [ "$new" -gt "$old" ]; then
  echo $new > ~/.status/EMAIL_COUNT
else
  echo ''
fi
