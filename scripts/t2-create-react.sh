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


# NO TICKET = EXIT
if [ "$TICKET" ]; then
  echo "CREATING $TICKET"
else
  echo "NO TICKET PROVIDED"
  exit 1
fi

# # TICKET NR ALREADY EXIST = EXIT
TICKET_PROJECT_PATH="$T2_HOME/projects/t2-$TICKET"

if test -d "$TICKET_PROJECT_PATH"; then
  echo "TICKET ALREADY EXIST"
  exit 1
fi


PROJECT_DIR_PATH="$T2_HOME/projects/t2-$TICKET"
TEMPLATE_DIR_PATH="$T2_HOME/templates/$TEMPLATE"

echo $PROJECT_DIR_PATH

echo "Creating... TICKET = t2-$TICKET"

git pull && /
create-react-app $PROJECT_DIR_PATH && /
npm i --save ag-grid-react ag-grid-community ag-grid-enterprise --prefix $PROJECT_DIR_PATH && /


# test if TEMPLATE FOLDER EXIST
if test -d "$TEMPLATE_DIR_PATH"; then
    echo "applying $TEMPLATE template"
     'cp' -rf $TEMPLATE_DIR_PATH/* $PROJECT_DIR_PATH
fi

git add . &&/
git commit -m "t2-$TICKET  with $TEMPLATE template created" &&/
git push 

echo "complete"