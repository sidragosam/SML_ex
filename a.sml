fun countEvenDivisors(n: int): int =
  let
    fun countHelper(divisor: int, count: int): int =
      if divisor > n then
        count
      else if n mod divisor = 0 andalso divisor mod 2 = 0 then
        countHelper(divisor + 1, count + 1)
      else
        countHelper(divisor + 1, count)
  in
    countHelper(1, 0)
  end;

countEvenDivisors(600);
