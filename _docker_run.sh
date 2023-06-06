#!/usr/bin/env dont-run-me-directly bash

set -e

if [[ $UID -eq 0 && ! -z "$GU_IDS" ]]
then
  # Self-contained bootstrap.
  # This is so that the correct gid/uid are set.
  U_ID=$(echo $GU_IDS | cut -d: -f1)
  G_ID=$(echo $GU_IDS | cut -d: -f2)
  
  id myuser &>/dev/null && userdel myuser
  rm -rf /myuser
  groupadd myuser -g "$G_ID"
  useradd myuser -u "$U_ID" -g "$G_ID" --home /myuser --create-home
  su myuser -c "bash $BASH_SOURCE"
  exit
fi

latexmk -xelatex -shell-escape ./main.tex
# latexmk -pdf -shell-escape ./main.tex


