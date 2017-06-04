BK_FOLDER=$HOME/.bk

function bk() {

    if (( ! $# )); then
        echo "Bookmark Manager v2.0"
        echo "---------------------"
        echo ""
        echo "bk               - Display this help menu"
        echo "bk -l            - List all bookmarks"
        echo "bk <bookmark>    - Go to bookmark"
        echo "bk -c <bookmark> - Create new bookmark of CWD"
        echo "bk -d <bookmark> - Delete bookmark"
        return 1
    fi

    if [[ ! (-d $BK_FOLDER) ]]; then
        echo Creating $BK_FOLDER
        mkdir -p $BK_FOLDER
    fi

    # Create a bookmark
    if [[ $1 == -c ]]; then

        if (( $# < 2 )); then
            NAME=$(basename `pwd`)
        else
            NAME=$2
        fi
        touch $BK_FOLDER/$NAME
        echo `pwd` >> $BK_FOLDER/$NAME
        echo "Created bookmark '$NAME' at `pwd`"
        return 1
    fi

    # List all bookmarks
    if [[ $1 == -l ]]; then
        for i in `ls $BK_FOLDER`
        do
            echo " [$i]\t`cat $BK_FOLDER/$i`"
        done
        return 1
    fi

    # Delete bookmark
    if [[ $1 == -d ]]; then

        if (( $# < 2 )); then
            echo You must provide a bookmark name!
            echo "bk -d <bookmark> - Delete bookmark"
            return 0
        fi

        if [[ -a $BK_FOLDER/$2 ]]; then
            rm $BK_FOLDER/$2
            echo "Removed bookmark '$2'"
            return 1
        fi
        echo "No bookmark found named '$2'"
        return 0
    fi

    # Go to bookmark
    if [[ -a $BK_FOLDER/$1 ]]; then
        cd `cat ~/.bk/$1`
    else
        echo "No bookmark found named '$1'"
    fi
}

# Completion for BK - file system bookmarker
function bk_avail {
    opts=`ls $BK_FOLDER`
    eval "reply=($opts)"
}
compctl -K bk_avail bk

