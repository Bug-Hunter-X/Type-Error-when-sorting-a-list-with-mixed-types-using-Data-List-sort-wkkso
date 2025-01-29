```haskell
import Data.List (sort)

main :: IO ()
main = do
  let numbers = [1, 5, 2, 8, 3]
  let sortedNumbers = sort numbers
  print sortedNumbers -- Output: [1,2,3,5,8]

  let words = ["banana", "apple", "cherry"]
  let sortedWords = sort words
  print sortedWords -- Output: ["apple","banana","cherry"]

  let mixedList = [1, "apple", 2, "banana"]
  -- Solution: Separate sorting for numbers and words
  let numbersInMixed = filter isNumber mixedList
  let wordsInMixed = filter (not . isNumber) mixedList
  let sortedNumbersInMixed = sort $ map (
      x -> read x :: Int) (map show numbersInMixed) 
  let sortedWordsInMixed = sort wordsInMixed
  print sortedNumbersInMixed
  print sortedWordsInMixed

isNumber :: (Show a, Read a) => a -> Bool 
isNumber x = case reads (show x) :: [(Int, String)] of
    [(i, 