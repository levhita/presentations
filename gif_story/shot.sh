#!/bin/bash
self=`basename $0`

case "$ACTION" in
    init)
        echo "$self: INIT"
        exit 0
        ;;
    start)
        echo "$self: START"
        ;;
    download)
        echo "$self: DOWNLOAD to $ARGUMENT"
        mogrify -resize 600x $ARGUMENT
        mv $ARGUMENT shots/$ARGUMENT
        cd shots
        ls *.JPG | awk 'BEGIN{ a=0 }{ printf "mv %s a_%03d.JPG\n", $0, a++ }' | bash
        count=$(find . -maxdepth 1 -type f|wc -l)
        cd ..
        echo "var total_images   = $count;" > photos.js
		#mogrify -format png -resize 600x *.JPG
        ;;
    stop)
        echo "$self: STOP"
        ;;
    *)
        echo "$self: Unknown action: $ACTION"
        ;;
esac

exit 0


