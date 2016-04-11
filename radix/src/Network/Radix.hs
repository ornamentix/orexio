{-# LANGUAGE OverloadedStrings #-}
module Network.Radix where

import Data.Text (Text)
import Network.HTTP.Types.Status (status200)
import Network.Wai (Application, responseLBS)
import Network.Wai.Handler.Warp (defaultSettings)
import Network.Wai.Handler.WarpTLS (runTLS, tlsSettings)
import Network.Wai.Handler.WebSockets (websocketsOr)
import Network.WebSockets (ServerApp)
import Network.WebSockets.Connection (acceptRequest, defaultConnectionOptions, sendTextData)

webApp :: Application
webApp req respond = respond $ responseLBS status200 [] "Hello World"

webSocketApp :: ServerApp
webSocketApp pending_conn = do
  conn <- acceptRequest pending_conn
  sendTextData conn ("Hello, client!" :: Text)

mainApp :: Application
mainApp = websocketsOr defaultConnectionOptions webSocketApp webApp

mainServer :: IO ()
mainServer = runTLS (tlsSettings cert key) defaultSettings mainApp where
  cert = "/home/alois/orexio/certificate.pem"
  key = "/home/alois/orexio/key.pem"


