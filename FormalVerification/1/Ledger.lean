abbrev Ident := Nat
abbrev Amount := Nat

structure Account where
  id : Ident
  name : String
  bal : Amount
  deriving Repr

abbrev Ledger := List Account

def alice : Account := { id := 1, name := "Alice", bal := 100 }
#eval alice

def createAccount (l : List Account) (id : Ident) (name : String) (bal : Amount) : List Account :=
  if l.any (fun a => a.id == id)
  then l
  else ({ id := id, name := name, bal := bal }) :: l

def ledger := createAccount [alice] 2 "Bob" 200

def creditAccount : List Account -> Ident -> Amount -> List Account := sorry

def debitAccount (l : List Account) (id : Ident) (amt : Amount) : Option (List Account) :=
  match l with    
  | [] => none
  | h :: t =>
      if (h.id == id) then
        if (h.bal >= amt) then
          some ({ h with bal := h.bal - amt } :: t)
        else none
      else Functor.map (fun t' => h :: t') (debitAccount t id amt)

def transferFunds (l : List Account) (fromId : Ident) (toId : Ident) (amt : Amount) : Option (List Account) := sorry

#eval ledger 

#eval debitAccount ledger 2 123
