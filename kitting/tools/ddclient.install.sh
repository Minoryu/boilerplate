#!/bin/sh
source ./util/comments.sh

# reference: https://qiita.com/gorohash/items/8287738ffe47ab52a36f
# reference: https://support.google.com/domains/answer/6147083?hl=ja


if !(type "ddclient" > /dev/null 2>&1); then
    comments "${BASH_SOURCE[0]##*/}" "let's go"
    apt install ddclient -y

    cat <<-EOD
    daemon=60

    ssl=yes
    use=web
    protocol=googledomains
    login=<<userid>>
    password=<<password>>
    <<domain include sub domain>>


    ### reference
    # to excute one time
    # ddclient -daemon=0 -verbose

    # restart app.
    # /usr/local/etc/rc.d/ddclient start

EOD

    vi /etc/ddclient.conf
fi
