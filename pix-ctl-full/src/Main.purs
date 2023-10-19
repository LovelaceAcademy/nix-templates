module Main (contract, main) where

import Contract.Prelude
  ( ($)
  , Effect
  , Unit
  , void
  , bind
  , liftEither
  , discard
  , show
  )
import Contract.Wallet (ownPaymentPubKeyHashes)
import Contract.Log (logInfo')
import Contract.Monad (Contract, launchAff_, runContract)
import Contract.Config (testnetEternlConfig)
import Scripts (validator)

contract :: Contract Unit
contract = do
  validator' <- liftEither validator
  logInfo' $ show validator'
  pk <- ownPaymentPubKeyHashes
  logInfo' $ show pk

main :: Effect Unit
main = launchAff_
  $ void
  $ runContract testnetEternlConfig
  $ contract
