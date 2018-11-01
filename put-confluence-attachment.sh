#!/bin/bash

#
# Creates or updates an attachment in Confluence Cloud.
# https://developer.atlassian.com/cloud/confluence/rest/#api-content-id-child-attachment-put
#

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
    --username )
        shift; USERNAME=$1
        ;;
    --password )
        shift; PASSWORD=$1
        ;;
    --filename )
        shift; FILENAME=$1
        ;;
    --comment )
        shift; COMMENT=$1
        ;;
    --domain )
        shift; DOMAIN=$1
        ;;
    --content-id )
        shift; CONTENT_ID=$1
        ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

if [ -z "$USERNAME" ]; then
    echo "Missing username"
    exit 1
fi

if [ -z "$PASSWORD" ]; then
    echo "Missing password"
    exit 1
fi

if [ -z "$FILENAME" ]; then
    echo "Missing filename"
    exit 1
fi

if [ -z "$COMMENT" ]; then
    echo "Missing comment"
    exit 1
fi

if [ -z "$DOMAIN" ]; then
    echo "Missing domain"
    exit 1
fi

if [ -z "$CONTENT_ID" ]; then
    echo "Missing content id"
    exit 1
fi

curl -D- \
    -u $USERNAME:$PASSWORD \
    -X PUT \
    -H "X-Atlassian-Token: nocheck" \
    -F "file=@$FILENAME" \
    -F "minorEdit=true" \
    -F "comment=$COMMENT" \
    https://$DOMAIN.atlassian.net/wiki/rest/api/content/$CONTENT_ID/child/attachment
