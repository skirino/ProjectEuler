main :: IO ()
main =
  let answer = calc 1 1 0
  in
  putStrLn $ show answer

calc :: Int -> Int -> Int -> Int
calc a b s
  | a >= 4000000 = s
  | otherwise    = if a `mod` 2 == 0 then calc b (a+b) (s+a)
                                     else calc b (a+b) s
