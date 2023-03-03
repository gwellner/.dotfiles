#!/bin/sh
# Launsches xdg-open jira for $1 beeing DWA-12234

if [[ $1 =~ ^DWA ]]; then
    xdg-open "https://jira.porscheinformatik.com/jira/browse/$1"
elif [[ $1 =~ ^TIP ]]; then
    xdg-open "https://jira.risedev.at/browse/$1"
else
    echo "oops regex didnt hit."
fi

