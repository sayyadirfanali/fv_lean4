import Blaster

/-!
# Blaster demo

`#blaster` sends a goal to an SMT solver (z3) and reports whether it's valid,
optionally generating a counterexample. Make sure `z3` is on your PATH
(the nix dev shell provides z3 4.15.2).

Run this file interactively in your editor, or via:
  lake env lean FormalVerification/BlasterDemo.lean
-/

namespace Demo

-- Simple arithmetic over Nat
#blaster [∀ (x : Nat), x + 0 = x]
#blaster [∀ (x y : Nat), x + y = y + x]

-- Arithmetic over Int
#blaster [∀ (x : Int), x - x = 0]

-- Implication
#blaster [∀ (n m x : Nat), n = m → m = n + x → 0 = x]

-- A false goal — uncomment to see Blaster produce a counterexample
-- (this will fail the build, which is the point):
-- #blaster [∀ (x : Nat), x + 1 = x]

-- Using `blaster` as a tactic to close a proof
example : ∀ (x y : Nat), x + y = y + x := by
  blaster

example (a b : Int) (h : a = b) : a - b = 0 := by
  blaster

end Demo
