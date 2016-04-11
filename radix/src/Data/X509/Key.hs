module Data.X509.Key where

import Crypto.PubKey.RSA (generate)
import Data.ASN1.BinaryEncoding
import Data.ASN1.Encoding
import Data.PEM (pemContent, pemParseLBS, pemWriteBS)
import Data.X509 (Certificate(Certificate), HashALG(HashSHA512), PrivKey(PrivKeyRSA), PubKey(PubKeyRSA),
                  PubKeyALG(PubKeyALG_RSA), SignatureALG(SignatureALG), decodeSignedCertificate)
import Data.X509.Memory (pemToKey, rsaToPEM)

import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as LBS

readCert :: IO ()
readCert = do
  xs <- BS.readFile  "/home/alois/orexio/certificate.pem"
  print $ decodeSignedCertificate $ xs
  {--
  xs <- LBS.readFile  "/home/alois/orexio/certificate.pem"
  case pemParseLBS xs of
    Right ys -> print $ decodeASN1' BER $ pemContent $ head $ ys
    Left err -> print err
    --}

  -- print $ certPem

mainKey :: IO ()
mainKey = do
  (pub, priv) <- generate 1024 0x10001
  BS.writeFile "key.pem" $ pemWriteBS $ rsaToPEM priv
  return $ Certificate 0 0 (SignatureALG HashSHA512 PubKeyALG_RSA) undefined undefined undefined (PubKeyRSA pub) undefined
  return ()
