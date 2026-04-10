-- Values and Types
#eval 3 + 4
#check "abc"
#reduce 3 + 4

#check 3 + 4
#check true

#check (1 : Int)

#eval (3 - 4 : Nat)

#eval (some 2)

#eval (3 / 4 : Float)

#eval if 2 == 3 then "abc" else "xyz"

-- Functions
def double (x : Nat) : Nat := x + x
#eval double 2

def square : Nat -> Nat := fun x => x * x
#eval square 7

def negate (b : Bool) : Bool :=
  match b with
  | true  => false
  | false => true

#eval (negate true)

-- Recursion and Termination
def factorial (x : Nat) : Nat := if x == 0 then 1 else x * factorial (x - 1)

-- Structures
structure Point where
  x : Float 
  y : Float

def p : Point := { x := 1, y := 2 }

def q : Point := { x := 1, y := 2 }

instance : BEq Point where
  beq p q := p.x == q.x && p.y == q.y

#eval p == q

#eval p.x

def xproj (p : Point) : Point := { p with y := 0 }
#eval xproj p

structure Person where
  id : Nat
  name : String

inductive Direction where
  | north
  | south
  | west
  | east

#eval (Direction.north : Direction)

inductive Shape where
  | circle : Float -> Shape
  | rectangle : Float -> Float -> Shape

def area (s : Shape) : Float :=
  match s with
  | Shape.circle r => 3.14 * (r ^ 2)
  | Shape.rectangle l b => l * b

#eval area (Shape.circle 4)

#eval area (Shape.rectangle 3 4)

-- Polymorphism
def identity (a : Type) (x : a) := x
#eval identity Nat 7

inductive Lizt a where
  | null : Lizt a
  | cons : a -> Lizt a -> Lizt a

#check Lizt.cons

def length (a : Type) (xs : Lizt a) : Nat :=
  match xs with
  | Lizt.null => 0
  | Lizt.cons _ ys => 1 + length a ys

#eval (length Nat (Lizt.cons 2 (Lizt.cons 3 Lizt.null)))

def sum (xs : List Nat) : Nat :=
  match xs with
  | [] => 0
  | y :: ys => y + sum ys

#eval sum [1, 2, 3]

#eval List.head? (α := Nat) [2, 3]
#eval @List.head? Nat [2, 3]

#check List.head?

namespace X
def y := 2
#eval y
end X

-- functors
#eval (some 7).map (· + 1)
#eval [1, 2, 3].map (· ^ 2)

-- monads
def hello := IO.println "hello, world"
#check hello

def ask := do
  IO.println "May I ask your name?"
  let stdin <- IO.getStdin
  let name <- stdin.getLine
  IO.println ("hello, " ++ name)

#eval IO.println "abc" *> IO.println "xyz"

#check Monad
