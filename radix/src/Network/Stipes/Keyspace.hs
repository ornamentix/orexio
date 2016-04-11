module Network.Stipes.Keyspace where

import Data.ByteString (ByteString)

data Keyspace = Keyspace
  { identifier    :: Identifier
  , keySize       :: Length
  , valueSize     :: Length
  , replication   :: Maybe Replication
  , distribution  :: Maybe Distribution }

newtype Identifier = Identifier ByteString

data Length = Dynamic | Static Int

data Replication = Total | Partial Replicator
data Distribution = Uniform | Variable Partitioner

newtype Partitioner = Partitioner ()
newtype Replicator = Replicator (Int -> Int)
