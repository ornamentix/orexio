module Key where

import Crypto.PubKey.RSA (generate)
import Data.X509 (Certificate(Certificate), HashALG(HashSHA512), PrivKey(PrivKeyRSA), PubKey(PubKeyRSA),
                  PubKeyALG(PubKeyALG_RSA), SignatureALG(SignatureALG))

mainKey :: IO ()
mainKey = do
  (pub, priv) <- generate 256 0x10001
  print pub
  print priv
  return $ PrivKeyRSA priv
  return $ Certificate 0 0 (SignatureALG HashSHA512 PubKeyALG_RSA) undefined undefined undefined (PubKeyRSA pub) undefined
  return ()
