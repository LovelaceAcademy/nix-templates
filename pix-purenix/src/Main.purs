module Main where

import Prelude ((==))

foo :: String
foo = "foo"

main :: { result :: Boolean }
main = { result: "foo" == foo }
