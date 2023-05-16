fun secondSmallest(lst: int list): int option =
  let
    fun findSmallest([x]) = x
      | findSmallest(x::xs) =
          let
            val smallest = findSmallest xs
          in
            if x < smallest then x else smallest
          end
    fun findSecondSmallest([], smallest) = NONE
      | findSecondSmallest(x::xs, smallest) =
          if x = smallest then findSecondSmallest(xs, smallest)
          else
            let
              val secondSmallest = findSecondSmallest(xs, smallest)
            in
              case secondSmallest of
                NONE => SOME x
              | SOME secondSmallest =>
                  if x < secondSmallest then SOME x
                  else SOME secondSmallest
            end
  in
    case lst of
      [] => NONE
    | _ =>
        let
          val smallest = findSmallest lst
        in
          findSecondSmallest(lst, smallest)
        end
  end;

secondSmallest([~5, ~3, 1, 53, 83, 22, 11, 6, 0, ~632, ~53]);
