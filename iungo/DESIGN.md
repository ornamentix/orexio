# iungo

## client
- open ::  

## model
domain
- key
- trackers (tela-api)


# tela-api
- <ns.key.hash>.host
  -> last

# arca-api
---
- auth :: NS.Key -> Auth.Challenge
- open :: Auth.Token -> NS.Key -> NS.SealedIndex
- get :: NS.SealedIndex -> KV.Key -> Maybe (KV.SealedValue, Maybe KV.SealedIndex)
- put :: NS.SealedIndex -> KV.Key -> KV.SealedValue -> NS.SealedIndex
- remove

---
namespace 'alois'

0: root
  ns: alois
  ns.chain.hash.0: ns + ns.key
  ns.hash.0: store.index.hash == null

1: put
  entry
    k: luna
    v: 192:901
    hash: i (1) + k + v + ns.key 
  ns.chain.hash.1: 0.hash + entry.hash
  ns.hash.1: store.index.hash

2: put
  entry
    k:


orexio

arca - distributed k/v store communication protocol
iungo - 



