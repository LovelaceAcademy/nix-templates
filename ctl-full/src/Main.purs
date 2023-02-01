module Main (main) where

import Contract.Prelude

import Contract.Address (ownPaymentPubKeyHash)
import Contract.Log (logInfo')
import Contract.Monad (Contract, launchAff_, runContract)
import Contract.Config (testnetNamiConfig)

contract :: Contract () Unit
contract = logInfo' <<< show =<< ownPaymentPubKeyHash

main :: Effect Unit
main = launchAff_
  $ void
  $ runContract testnetNamiConfig
  $ contract
