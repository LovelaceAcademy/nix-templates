module Main (contract, main) where

import Contract.Prelude

import Contract.Address (ownPaymentPubKeyHash)
import Contract.Log (logInfo')
import Contract.Monad (Contract, launchAff_, runContract)
import Contract.Config (testnetEternlConfig)

contract :: Contract Unit
contract = do
  validator <- liftEither validator
  logInfo' validator
  pk <- ownPaymentPubKeyHash
  logInfo' $ show pk

main :: Effect Unit
main = launchAff_
  $ void
  $ runContract testnetEternlConfig
  $ contract
