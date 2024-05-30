(*Questions for Chapter 2*)

(*Questions Number 1*)
(*Write a function which multiplies a given number by 10. What is its type?*)
let multiply_by_ten x =
  x * 10;;
(*The type is int, if you provide a float it fails. If you want float multiplication you should do *. *)


(*Questions Number 2*)
(*Write a function which returns true if both of its arguments are non-zero, and false otherwise. What is the type of your function?*)
let bool_if_nonzero a b =
  if a <> 0 && b <> 0 then true else false;;
(*The type is bool*)


(*Questions Number 3*)
(*Write a recursive function which, given a number n, calculates the sum 1 + 2 + 3 + ... + n. What is its type?*)
let rec sum_up_to_n n =
  if n = 1 then 1 else n + sum_up_to_n(n - 1);;
(*The type is int*)


(*Questions Number 4*)
(*Write a function power x n which raises x to the power of n. Give its type*)
let rec power x n =
  if n = 0 then 1 else
        if n = 1 then x else
          x * power x (n - 1);;


(*Questions Number 5*)
(*Write a function isconsonant which, given a lower-case character in the range 'a' ... 'z', determines if it is a consonant*)
let isvowel c =
  c = 'a' || c = 'e' || c = 'i' || c = 'o' || c = 'u';;

let isconsonant letter = not (isvowel letter);;


(*Questions Number 6*)
(*What is the result of the expression 'let x = 1 in let x = 2 in x + x'?*)
(*4, because the 2 is assigned to both x's, and the x=1 is irrelevant.*)


(*Questions Number 7*)
(*Can you suggest a way of preventing the non-termination of the factorial function in the case of a zero or negative argument?*)
(*You would need to return 0 for a negative argument*)
(*Factorial of 0 is 1*)


let rec factorial x =
  if x < 0 then 0 else
        if x = 0 then 1 else
                x * factorial (x - 1);;
