{-# OPTIONS --guardedness #-}
module Main where

open import Prelude using (_$_)
open import IO using (Main; run; putStrLn)

main : Main
main = run $ putStrLn "Hello, World!"
