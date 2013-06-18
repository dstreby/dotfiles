#!/bin/bash

CHECK=TRUE
SKIP=FALSE

for LINK in `find $PWD -name '*.sym' -print`; do
    DF=$(echo $LINK | awk -F/ '{print $NF}' | sed -e 's/\.sym//')
    if [ -e "$HOME/.$DF" ] && [ $CHECK == "TRUE" ]; then
        echo "WARNING: $DF already exists! [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        read FOO

        case "$FOO" in
            s)
                SKIP=TRUE
                ;;
            S)
                SKIP=TRUE
                CHECK=FALSE
                ;;
            o)
                OVER=TRUE
                ;;
            O)
                OVER=TRUE
                CHECK=FALSE
                ;;
            b)
                BACK=TRUE
                ;;
            B)
                BACK=TRUE
                CHECK=FALSE
                ;;
            *)
                echo "Invalid option; exiting."
                exit 1
        esac
    fi

    if [ "$SKIP" != "TRUE" ]; then
        if [ "$BACK" == "TRUE" ]; then
            echo -n "Backing up $DF... "
            mv $HOME/.$DF $HOME/.$DF.bak
        elif [ "$OVER" = "TRUE" ]; then
            echo -n "Removing $DF... "
           rm $HOME/.$DF
        fi
        
        echo "Linking $DF..."
        ln -s $LINK $HOME/.$DF
    fi
done
