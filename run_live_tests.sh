#/usr/bin/env bash
runDamlScript () {
  echo "DAR: $1"
  echo "Script: $2"
  daml script --json-api --dar $1 --script-name $2 --participant-config ./participants.json --input-file ./ledger-parties.json 2> /dev/null > /dev/null
}

checkStatusAndError () {
  echo "ERROR: New DAR hasn't been pushed or Tests are failing on live-ledger"
  echo ""
}


daml build -o syndicated-lending.dar
echo ""

runDamlScript ./syndicated-lending.dar "Tests.Common:initalTests" || checkStatusAndError
runDamlScript ./syndicated-lending.dar "Tests.Common:allTests" || checkStatusAndError
