{ vimMode ? false }:
let
  thunkSource = (import ./dep/nix-thunk {}).thunkSource;
in
  import (thunkSource ./dep/nix-daml-sdk + "/shell.nix") { inherit vimMode; }
