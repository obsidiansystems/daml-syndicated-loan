#!/usr/bin/env bash
build () {
  daml build -o syndicated-lending.dar
}

sandbox () {
  echo "Running sandbox"
  daml sandbox --dar syndicated-lending.dar
}

script () {
  echo "Running script"
  daml script --ledger-host "localhost" --ledger-port 6865 --dar syndicated-lending.dar --script-name Tests.IDE:goldenTestIDE
}
$1
