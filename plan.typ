#set document(title: "Formal Verification in Lean 4 and Blaster", author: "Irfan Ali")
#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
)

#set text(font: "Inter", size: 9pt, weight: 300) 
#set par(leading: 0.8em, justify: true) 

#align(center)[
  #block(
    fill: luma(245),
    inset: (top: 1.5em, bottom: 1.5em, x: 2em),
    width: 100%,
    stroke: (bottom: 2pt + purple)
  )[
    #text(size: 18pt, weight: 800, tracking: -0.02em, fill: black)[Formal Verification in Lean 4 and Blaster] \
    #v(0.2em)
    #text(size: 10pt, weight: 800, fill: black, upper([Irfan Ali]))
  ]
]

#show heading.where(level: 1): it => [
  #set text(fill: purple, size: 12pt, weight: "bold")
  #v(1.2em, weak: true)
  #it
  #v(0.75em, weak: true)
]

#show raw: set text(font: "Myna", size: 9pt)
#show raw.where(block: false): it => box(
  fill: luma(240),
  inset: (x: 2.5pt, y: 0pt),
  outset: (y: 2.5pt),
  radius: 2pt,
  text(fill: luma(0), it)
)

#show list: set list(marker: text(fill: silver)[•], indent: 1em)

= Session 1: Introduction to Lean Programming
- *date:* April 8
- *goal:* learner should be able to write basic programs in *Lean 4* (assuming proficiency in Haskell)
- *topics:*
  - *simple types:* `Nat`, `Bool`, `Option`, `inductive`
  - *simple functions:* `def`, lambda syntax
  - *pattern matching:* `match`
  - *recursive functions:* structural induction, termination
  - *records:* `structure`, access, update
  - *commands:* `#eval`, `#check`, `#reduce`
  - *typeclasses:* basic usage, deriving instances
  - *modules and namespaces:* `namespace`, `open`, `import`
  - *functors and monads:* including `do` notation
  - *transformers* (very briefly)
- *exercise:* model simple ledger with deposits, withdrawals, transfers

= Session 2: Logic and Type Theory for Programmers
- *date:* April 15
- *goal:* learner should grasp intuition behind *Propositions as Types*
- *topics:*
  - *propositions and truth tables:* `Prop`, `True`, `False`
  - *logical connectives:* negation, conjunction, disjunction, implication
  - *predicates*
  - *quantifiers:* universal, existential
  - *equality*
  - *classical v intuitionistic logic:* law of excluded middle, double negation
  - *Curry–Howard Correspondence:* types are propositions, programs are proofs
- *exercise:* express basic logical properties of simple ledger implemented in Session 1

= Session 3: Theorem Proving in Lean
- *date:* April 22
- *outcome:* learner should be able to state and prove basic propositions in *Lean 4*
- *topics:*
  - *propositions:* `Prop` universe
  - *proof goals and contexts*
  - *tactics:* `intro`, `apply`, `cases`, `rw`, `simp`, `rfl`, `exact`, `have`
  - *rewriting and simplification*
  - *proof structuring:* `lemma`, `theorem`
- *exercise:* prove logical and arithmetical properties (using pure Lean 4) of simple ledger expressed in Session 2

#pagebreak()

= Session 4: Introduction to SMT in Blaster
- *date:* April 29
- *outcome:* learner should be able to grasp *SMT* and use *Blaster* to prove basic propositions
- *topics:*
  - *introduction to SAT and SMT*
  - *constraint solving*
  - *theorem prover vs SMT solver*
  - *where SMT works well:* arithmetic, inequalities, boolean logic
  - *where SMT fails:* induction, recursion, higher-order reasoning
  - *quantifier-free v quantified formulas*
  - *Blaster integration with Lean 4*
  - *Z3 interaction through Blaster*
  - *shaping goals for SMT* (simplification before automation)
- *exercise:* prove logical and arithmetical properties (using Blaster) of simple ledger expressed in Session 2

= Session 5: Modelling Smart Contracts
- *date:* May 13
- *goal:* learners should be able to model simple smart contracts for purpose of formal verification
- *steps:*
  - *state:* represent contract state using `structure`
  - *transitions:* model EUTxO-style state transitions
  - *invariants:* state invariants using `Prop` and verify preservation of invariants
  - *proofs:* design incremental structured proofs
- *exercise:* model simple but non-trivial smart contract (eg, vesting, escrow, multi-sig, lottery, NFT, dead man's switch)

= Session 6-7: Practical Audit Workflow
- *date:* May 27 and June 3
- *goal:* learner should be able to perform audit of smart contract using *Lean 4* and *Blaster*
- *steps:*
  - *modelling:* model smart contract in Lean 4 by representing state and transitions
  - *analysing:* define invariants incrementally (eg, conservation, boundedness, authorisation, monotonicity)
  - *proving:* combine manual proofs in Lean 4 with SMT automation in Blaster
  - *debugging:* reading goals, isolating failures
- *exercise:* complete audit of slightly complex smart contract (eg, DAO-style funding) in Lean 4 and Blaster

= Session 8: Project Presentation
- *date:* June 10
- *outcome:* learner must implement, model, verify, and audit any simple smart contract using Lean 4 and Blaster
- *requirements:* model state, represent transitions, define several invariants, prove few properties on a non-trivial contract
- *suggestions:* whitelist airdrop, recurring payments, multi-sig wallet, Dutch auction, time-bound escrow, commit-reveal lottery
