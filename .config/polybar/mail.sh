MAILDIR=~/Mail/INBOX/new # Adjust to your maildir path
NEW=$(find "$MAILDIR" -type f | wc -l)

if [ "$NEW" -gt 0 ]; then
  # Unicode envelope icon + count
  echo " $NEW"
else
  echo ""
fi
