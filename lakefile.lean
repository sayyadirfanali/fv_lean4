import Lake
open Lake DSL

package "FormalVerification" where
  version := v!"0.1.0"

require Blaster from git
  "https://github.com/input-output-hk/Lean-blaster.git" @ "main"

@[default_target]
lean_lib «FormalVerification» where
  -- add library configuration options here
