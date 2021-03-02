#!/usr/bin/env bash

# INPUTS > TICKET, TEMPLATE

cd $T2_HOME

# SUB ROUTINES - HELPERS PATHS
PARSE_TICKET_TEMPLATE_ARGUMENTS="$T2_HOME/scripts/helpers/parse-ticket-template-arguments.sh"
EXIT_IF_NO_TICKET_PROVIDED="$T2_HOME/scripts/helpers/exit-if-no-ticket-provided.sh"
EXIT_IF_PROJECT_ALREADY_EXIST="$T2_HOME/scripts/helpers/exit-if-project-already-exists.sh"
APPLY_TEMPLATE_IF_PROVIDED="$T2_HOME/scripts/helpers/apply-template-if-provided.sh"

source $PARSE_TICKET_TEMPLATE_ARGUMENTS # PARSES TICKET,TEMPLATE into variables
source $EXIT_IF_NO_TICKET_PROVIDED 
source $EXIT_IF_PROJECT_ALREADY_EXIST #  PROJECT WITH THE TICKET NR ALREADY EXIST = EXIT


PROJECT_DIR_PATH="$T2_HOME/projects/t2-$TICKET"
TEMPLATE_DIR_PATH="$T2_HOME/templates/$TEMPLATE"



git pull && /

#  ANGULAR SPECIFIC SCRIPT

ng new hello --directory "./projects/t2-$TICKET" --style scss --routing false --strict true --skip-git true && /
npm i --save ag-grid-angular ag-grid-community ag-grid-enterprise --prefix $PROJECT_DIR_PATH && /

# ANGULAR SPECIFIC END
source ${APPLY_TEMPLATE_IF_PROVIDED}

git add . && /
git commit -m "t2-$TICKET  with $TEMPLATE template created" && /
git push && /

echo "complete"
echo "LINK TO CODESANDBOX: https://codesandbox.io/s/github/davis4acca/t2/tree/main/projects/t2-${TICKET}"
