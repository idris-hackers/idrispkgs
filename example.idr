import Config.JSON

main : IO ()
main = case parse parseJSONFile "[1, 2, 3  , {}]" of
         Left l => putStrLn l
         Right r => print r
