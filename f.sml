datatype int_tree = L | N of int * int_tree * int_tree;

fun sumLevel(tree: int_tree, level: int): int =
  let
    fun sumHelper(L, _) = 0
      | sumHelper(N(x, left, right), currLevel) =
        if currLevel = level then
          x + sumHelper(left, currLevel + 1) + sumHelper(right, currLevel + 1)
        else
          sumHelper(left, currLevel + 1) + sumHelper(right, currLevel + 1)
  in
    sumHelper(tree, 1)
  end;

val exampleTree =
  N(1,
    N(2,
      N(3, L, L),
      N(4, L, L)
    ),
    N(5,
      N(6, L, L),
      N(3, L, L)
    )
  );

fun countLevels(tree: int_tree): int =
  let
    fun countHelper(L, level) = level
      | countHelper(N(_, left, right), level) =
        let
          val leftLevels = countHelper(left, level + 1)
          val rightLevels = countHelper(right, level + 1)
        in
          Int.max(leftLevels, rightLevels)
        end
  in
    countHelper(tree, 0)
  end;

fun isPerfectSquare(n: int): bool =
  let
    fun isSquareHelper(x: int): bool =
      if x * x = n then
        true
      else if x * x > n then
        false
      else
        isSquareHelper(x + 1)
  in
    isSquareHelper(0)
  end;

fun printLevelSums(tree: int_tree, currLevel: int, maxLevel: int): unit =
  if currLevel > maxLevel then
    ()
  else
    let
      val sum = sumLevel(tree, currLevel)
    in
      if isPerfectSquare(sum) then
        print("Szint " ^ Int.toString(currLevel) ^ ": " ^ Int.toString(sum) ^ "\n")
      else
        ();
      printLevelSums(tree, currLevel + 1, maxLevel)
    end;

val levels = countLevels(exampleTree);
printLevelSums(exampleTree, 1, levels);
