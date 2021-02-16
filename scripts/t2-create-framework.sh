#!/usr/bin/env bash 


# INPUTS
# TICKET
# TEMPLATE

# Parse arguments
for ARGUMENT in "$@"
do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   

    case "$KEY" in
            TICKET)              TICKET=${VALUE} ;;
            TEMPLATE)    TEMPLATE=${VALUE} ;;     
            *)   
    esac    
done

cd $T2_HOME

# @TODO IF NOT TICKET = ERROR
# @TODO IF TICKET NR ALREADY EXIST rempromt for new ticket


PATH_TO_PROJECT="$T2_HOME/projects/t2-$TICKET"
TEMPLATE_FILE="$T2_HOME/templates/$TEMPLATE/"

echo "Creating... TICKET = t2-$TICKET"

git pull && /
create-react-app $PATH_TO_PROJECT && /
npm i --save ag-grid-react ag-grid-community ag-grid-enterprise --prefix $PATH_TO_PROJECT && /


if test -d "$TEMPLATE_FILE"; then
    echo "applying $TEMPLATE template"
    'cp' -rf $T2_HOME/templates/$TEMPLATE/*  $T2_HOME/projects/t2-$TICKET/
fi

git add . &&/
git commit -m "t2-$TICKET  with $TEMPLATE template created" &&/
git push 

echo "DONE"`