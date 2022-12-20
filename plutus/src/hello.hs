{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE NoImplicitPrelude   #-}
{-# LANGUAGE TemplateHaskell     #-}
module Main (main) where

import Prelude (IO)
import PlutusTx.Prelude (($), BuiltinData, Maybe (Nothing))
import Cardano.Api.Shelley (PlutusScript (PlutusScriptSerialised), PlutusScriptV2)
import Cardano.Api.SerialiseTextEnvelope (textEnvelopeToJSON)
import qualified Codec.Serialise as CS
import qualified Data.ByteString.Lazy as DBL
import qualified Data.ByteString.Short as DBS
import PlutusTx (compile)
import Plutus.V2.Ledger.Api (Validator, mkValidatorScript)

validator :: BuiltinData -> BuiltinData -> BuiltinData -> ()
validator datum redeemer context = ()

validator' :: Validator
validator' = mkValidatorScript $$(compile [||validator||])

serialise :: Validator -> PlutusScript PlutusScriptV2
serialise val = PlutusScriptSerialised $ DBS.toShort $ DBL.toStrict $ CS.serialise $ val

main :: IO ()
main = DBL.putStr $ textEnvelopeToJSON Nothing $ serialise validator'
