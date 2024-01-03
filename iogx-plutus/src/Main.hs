{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Main (main) where

import Cardano.Api (textEnvelopeToJSON)
import Cardano.Api.Shelley (PlutusScript (PlutusScriptSerialised), PlutusScriptV2)
import Data.ByteString.Lazy (putStr)
import PlutusLedgerApi.V2 (ScriptContext, serialiseCompiledCode)
import PlutusTx (compile, unsafeFromBuiltinData, unstableMakeIsData)
import PlutusTx.Prelude
  ( Bool (False, True),
    BuiltinData,
    Integer,
    Maybe (Nothing),
    check,
    ($),
    (==),
  )
import Prelude (IO)

newtype MyDatum = MyDatum Integer

unstableMakeIsData ''MyDatum

newtype MyRedeemer = MyRedeemer Integer

unstableMakeIsData ''MyRedeemer

validator_ :: MyDatum -> MyRedeemer -> ScriptContext -> Bool
validator_ _ (MyRedeemer n) _ | n == 42 = True
validator_ _ _ _ = False

validator :: BuiltinData -> BuiltinData -> BuiltinData -> ()
validator d r sc =
  check $
    validator_
      (unsafeFromBuiltinData d)
      (unsafeFromBuiltinData r)
      (unsafeFromBuiltinData sc)

script :: PlutusScript PlutusScriptV2
script = PlutusScriptSerialised $ serialiseCompiledCode $$(compile [||validator||])

main :: IO ()
main = putStr $ textEnvelopeToJSON Nothing script
