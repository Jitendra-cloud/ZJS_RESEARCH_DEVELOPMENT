@AccessControl.authorizationCheck: #NOT_REQUIRED
define hierarchy ZJS_I_ETYPEHIERARCHY
  as parent child hierarchy(
    source ZJS_I_DMOTEAMVIEW
    child to parent association _Leader
    start where
      TeamLeader is initial
    siblings order by
      UserIdentification
  )
{
  key UserIdentification,
      TeamLeader,
      TeamName
}
