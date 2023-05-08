#/usr/bin/env bash
runDamlScript () {
  echo "DAR: $1"
  echo "Script: $2"
  daml script --json-api --dar $1 --script-name $2 --participant-config ./participants.json --input-file ./ledger-parties.json
  if [ $? -eq 1 ]; then
    echo -e "\e[31mERROR:\e[0m New DAR hasn't been pushed or Script $2 is failing on the live-ledger"
    echo ""
  else
    echo -e "\e[32mSUCCESS\e[0m"
  fi
}

daml build -o $1
echo ""

declare -a testsToRun=("Tests.Common:initialTest")

for i in "${testsToRun[@]}";
do
runDamlScript ./$1 $i
done

