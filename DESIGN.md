# iungo

## client
- open ::  

## model
domain
- key
- trackers (tela-api)

# domain

## api

## model
- domain
  - name (arca namespace)
- member
  - active/passive

# tela-api
- <ns.key.hash>.host
  -> last

# arca-api
- auth :: NS.Key -> Auth.Challenge
- open :: Auth.Token -> NS.Key -> NS.SealedIndex
- get :: NS.SealedIndex -> KV.Key -> Maybe (KV.SealedValue, Maybe KV.SealedIndex)
- put :: NS.SealedIndex -> KV.Key -> KV.SealedValue -> NS.SealedIndex
- remove

# stipes

---

orexio

arca - distributed k/v store communication protocol

radix - tracker

stipes - event log?
iungo - 



