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

# echo "Creating... TICKET = t2-$TICKET"

git pull && /
ng new ./projects/t2-$TICKET --style scss --routing false &&/
npm i --save ag-grid-react ag-grid-community ag-grid-enterprise && /

TEMPLATE_FILE="./templates/$TEMPLATE/app"

if test -d "$TEMPLATE_FILE"; then
    echo "applying $TEMPLATE template"
    'cp' -rf ././templates/$TEMPLATE/*  ./projects/t2-$TICKET/
fi

git add . &&/
git commit -m "t2-$TICKET  with $TEMPLATE template created" &&/
git push 

echo "DONE"`