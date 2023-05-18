fun isCubeEndingWithOne(n: int): bool =
  let
    val cube = n * n * n
    val lastDigit = cube mod 10
  in
    lastDigit = 1
  end;

fun createLazyList(starts: int, ends: int): int list =
  let
    fun createLazyListHelper(curr: int): int list =
      if curr > ends then
        []
      else if isCubeEndingWithOne(curr) then
        curr :: createLazyListHelper(curr + 1)
      else
        createLazyListHelper(curr + 1)
  in
    createLazyListHelper(starts)
  end;

val myList = createLazyList(1, 100)

fun printLazyList(l: int list): unit =
  let
    fun printHelper([]) = ()
      | printHelper(x :: xs) = (
          print(Int.toString(x) ^ " ");
          printHelper(xs)
        )
  in
    printHelper(l);
    print "\n"
  end;

printLazyList(myList)
