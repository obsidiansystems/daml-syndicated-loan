#/usr/bin/env bash
runDamlScript () {
  echo "DAR: $1"
  echo "Script: $2"
  daml script --json-api --dar $1 --script-name $2 --participant-config ./participants.json --input-file ./ledger-parties.json
  if [ $? -eq 1 ]; then
    echo -e "\e[31mERROR:\e[0m New DAR hasn't been pushed or Script $2 is failing on the live-ledger"
  else
    echo -e "\e[32mSUCCESS\e[0m"
  fi
}

buildDamlDar () {
  echo "DAR: $1"
  daml build -o $1
  if [ $? -eq 1 ]; then
    echo -e "\e[31mERROR:\e[0m DAR failed to compile"
  else
    echo -e "\e[32mSUCCESS\e[0m"
  fi
}

runTests () {
    for i in "${testsToRun[@]}";
    do
        runDamlScript ./$1 $i
    done
}

declare -a testsToRun=("Tests.Common:perfTest")
buildDamlDar $1
runTests $1
