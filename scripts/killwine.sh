#!/usr/bin/env bash

wine_cellar="${HOME}/.local/share/wine"

if (($#)); then
    if [[ -e "${wine_cellar}/$1" ]]; then
        WINEPREFIX="${wine_cellar}/$1"
        shift
    elif [[ "${1:0:1}" != "-" ]]; then
        echo "ERROR: Didn't understand argument '$1'?" >&2;
        exit 1
    fi
fi

if ((${#WINEPREFIX})); then
    pids=$(
        grep -l "WINEPREFIX=${WINEPREFIX}$" $(
            ls -l /proc/*/exe 2>/dev/null |
            grep -E 'wine(64)?-preloader|wineserver' |
            perl -pe 's;^.*/proc/(\d+)/exe.*$;/proc/$1/environ;g;'
        ) 2> /dev/null |
        perl -pe 's;^/proc/(\d+)/environ.*$;$1;g;'
    )
else
    pids=$(
        ls -l /proc/*/exe 2>/dev/null |
        grep -E 'wine(64)?-preloader|wineserver' |
        perl -pe 's;^.*/proc/(\d+)/exe.*$;$1;g;'
    )
fi

if ((${#pids})); then
    set -x
    kill $* $pids
fi

