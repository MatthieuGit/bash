function gitpush {
	git add -A;
    COMMENT=""

    if [ "$#" -eq 1 ]
    then
        COMMENT="-- $1"
    fi

    if [ "$#" -gt 1 ]
    then
        echo "USAGE: gitpush [optional comment]"
        return 1 2>/dev/null
	exit 1
    fi

	git commit -m "$(date "+%Y-%m-%d -- %T") $COMMENT";
	git push -u origin master;
}

function gitpull {
	git reset --hard origin/master;
	git pull origin master;
}

function gitforce {
	if [ "$#" -ne 1 ]
	then
		echo "USAGE: gitforce [branch]" 
	fi

	git push --force origin $1:master; 
}
