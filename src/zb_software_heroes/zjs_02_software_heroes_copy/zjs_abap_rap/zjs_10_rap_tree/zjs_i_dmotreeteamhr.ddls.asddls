define hierarchy ZJS_I_DMOTREETEAMHR
  as parent child hierarchy(
    source ZJS_R_DMOTREETEAM
    child to parent association _TeamLeader
    start where
      TeamLeader is initial
    siblings order by
      PlayerName ascending
  )
{
  key UserId,
      TeamLeader
}
