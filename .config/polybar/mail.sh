# Count unread mail using notmuch
UNREAD=$(notmuch count tag:unread)

if [ "$UNREAD" -gt 0 ]; then
  # Envelope icon (Font Awesome/Nerd Font) + count
  echo " $UNREAD"
else
  echo ""
fi
