(*Pattern Matching*)
(*Questions for Chapter 3*)

(*Questions Number 1*)
(*Rewrite the `not` function from the previous chapter in pattern matching style*)
(*Original:*)
let not x =
  if x then false else true;;

let not_match x =
  match x with
    true -> false
  | _ -> true


(*Questions Number 2*)
(*Use pattern matching to write a recursive function which, given a positive integer n, returns the sum of all the integers from 1 to n*)
let rec sum_up_to_n x =
  match x with
    1 -> 1
  | _ -> x + sum_up_to_n(x-1)


(*Questions Number 3*)
(*Use pattern matching to write a function which, given two numbers x and n, computes x to the power of n*)
let rec x_to_power_n x n =
  match x with
    0 -> 1
  | 1 -> x
  | _ -> x * x_to_power_n x (n-1)


(*Questions Number 4*)
(*For each of the previous three questions, comment on whether you think it is easier*)
(*to read the function with or without pattern matching.*)
(*How might you expect this to change if the functions were muhc larger?.*)

(*ANSWER: *)
(*My brain still tries to convert the match statements to if else, but I do appreciate the cleanliness of the syntax. I definitely see the value in matching once you exceed 2-3 if statements*)


(*Questions Number 5*)
(*What does `match 1 + 1 with 2 -> match 2 + 2 -> with 3 -> 4 | 4 -> 5` do?*)
(*This one was weird, ultimately evaluates to 5.*)
(*match 1 + 1 with
  2 ->
        (match 2 + 2 with
          3 -> 4
        | 4 -> 5)
*)


(*Questions Number 6*)
(*There is a special pattern `x..y` to denote continuous ranges of characters, for example 'a'..'z' will match all lowercase letters. Write functions islower and isupper, each of type char -> bool to decide on the case of a given letter.*)

(*So is this asking for me to write a boolean function that tells me whether or not a*)
(*given letter string is lowercase or uppercase*)

let islower x =
  match x with
    'a'..'z' -> true
  | _ -> false

let isupper x =
  match x with
    'A'..'Z' -> true
  | _ -> false


