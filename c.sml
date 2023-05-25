fun intToList(n: int): int list =
    if n < 10 then [n]
    else n mod 10 :: intToList (n div 10);

fun reverseList(lst: int list): int list =
    let
        fun reverseHelper([], acc) = acc
          | reverseHelper(x::xs, acc) = reverseHelper(xs, x::acc)
    in
        reverseHelper(lst, [])
    end;

fun isPalindrome(lst: int list): bool =
    lst = reverseList lst;

fun findLargestPalindrome(): int =
    let
        fun largestPalindromeHelper(x: int, y: int, largest: int): int =
            if x < 10 then
                largest
            else
                let
                    val product = x * y
                in
                    if product > largest andalso isPalindrome (intToList product) then
                        largestPalindromeHelper(x, y - 1, product)
                    else if y > 10 then
                        largestPalindromeHelper(x, y - 1, largest)
                    else
                        largestPalindromeHelper(x - 1, x - 1, largest)
                end
    in
        largestPalindromeHelper(999, 999, 0)
    end;



val largestPalindrome = findLargestPalindrome();
print("A két háromjegyű számok szorzataként előálló legnagyobb palindrom: " ^ Int.toString largestPalindrome ^ "\n");
