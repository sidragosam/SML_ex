fun isPrime(n: int): bool =
  let
    fun isDivisibleBy(n: int, d: int): bool =
      n mod d = 0
  in
    if n <= 1 then false
    else
      let
        val limit = Real.floor(Math.sqrt(Real.fromInt n))
      in
        not (List.exists (fn d => isDivisibleBy(n, d)) (List.tabulate (limit - 1, fn i => i + 2)))
      end
  end;

fun sublistsWithPrimeSum(lst: int list): int list list =
  let
    fun sumDigits(n: int): int =
      if n < 10 then n
      else (n mod 10) + sumDigits(n div 10)

    fun generateSublists([], acc: int list list): int list list =
      acc
    | generateSublists(x::xs, acc) =
      let
        val sublistsWithX = List.map (fn l => x::l) acc
        val newAcc = acc @ sublistsWithX
      in
        if isPrime(sumDigits x) then
          generateSublists(xs, newAcc)
        else
          generateSublists(xs, acc)
      end
  in
    generateSublists(lst, [[]])
  end;

sublistsWithPrimeSum([3, 2, 5, 1, 0]);
