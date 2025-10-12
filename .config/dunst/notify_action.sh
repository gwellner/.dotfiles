#!/bin/sh
{
  echo "APP_NAME: $DUNST_APP_NAME"
  env | grep DUNST_

  # not really needed, but an example of using rofi to choose an option
  # CHOICE=$(printf "op1\nop2" | rofi -dmenu -p "Choose option:")
  # [ -n "$CHOICE" ] && notify-send "You chose: $CHOICE"

  echo "Arguments:" "$@"
  echo "Action argument: $1"

  dunstify -C "$DUNST_ID"

  # Retrigger with marker
  ACTION=$(dunstify -a "$DUNST_APP_NAME - script handled" \
    -u "$DUNST_URGENCY" \
    -t "$DUNST_TIMEOUT" \
    -h string:category:mytag \
    -A yes,ACCEPT -A no,DECLINE \
    "$DUNST_SUMMARY" "$DUNST_BODY")

  echo "ACTION: $ACTION"

  case "$ACTION" in
  "yes")
    echo "selected yes"
    ;;
  "no")
    echo "selected no"
    ;;
  "2")
    echo "closed notification"
    ;;
  "1")
    echo "timeout notfication"
    ;;
  esac
} >>/tmp/dunst_script.log 2>&1

# TEST IT WITH
#
# dunstify -A yes,ACCEPT -A no,DECLINE "Call waiting"
