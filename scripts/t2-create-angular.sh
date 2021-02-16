#!/usr/bin/env bash 

# INPUTS > TICKET, TEMPLATE

# Parse arguments

cd $T2_HOME

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

# NO TICKET = EXIT
 if [ "$TICKET" ]
 then
   echo "CREATING $TICKET"
 else 
   echo "NO TICKET PROVIDED"
   exit 1
 fi

# TICKET NR ALREADY EXIST = EXIT
TICKET_PROJECT_PATH="$T2_HOME/projects/t2-$TICKET"

if test -d "$TICKET_PROJECT_PATH"; then
    echo "TICKET ALREADY EXIST"
    exit 1
fi

TEMPLATE_FILE="$T2_HOME/templates/$TEMPLATE/"


PATH_TO_PROJECT="$T2_HOME""projects/t2-$TICKET"
echo $PATH_TO_PROJECT

git pull && /
ng new hello --directory "./projects/t2-$TICKET" --style scss --routing false --strict true --skip-git true && /
npm i --save ag-grid-angular ag-grid-community ag-grid-enterprise --prefix $PATH_TO_PROJECT && /

 if [ "$TEMPLATE" ]
 then
    if test -d "$TEMPLATE_FILE"; then
        echo "applying $TEMPLATE template"
        'cp' -rf $T2_HOME/templates/$TEMPLATE/*  $T2_HOME/projects/t2-$TICKET/
    fi
 else 
   echo "NO TEMPLATE PROVIDED - creating regular angular project"
 fi



git add . &&/
git commit -m "t2-$TICKET  with $TEMPLATE template created" &&/
git push && /

echo "complete"