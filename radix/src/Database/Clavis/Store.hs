module Database.Clavis.Store where

import Network.Stipes.Keyspace

data Store = Store
  { keyspace  :: Keyspace
  , content   :: Content }

data Content = Document | Object | Value

maaeu :: Foo
aeuaoeu = let 323 in wao where f
