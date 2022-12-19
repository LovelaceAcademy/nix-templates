{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE TemplateHaskell     #-}
{-# LANGUAGE NoImplicitPrelude   #-}
module Main (main) where

import Prelude (($), return)
import PlutusTx (compile)

validator = ()

main = return $$(compile [|| validator ||])
