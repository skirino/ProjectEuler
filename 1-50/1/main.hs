main :: IO()
main =
  let answer = sum (filter (\x -> (x `mod` 3 == 0) || (x `mod` 5 == 0)) [1 .. 999])
  in
  putStrLn (show answer)
