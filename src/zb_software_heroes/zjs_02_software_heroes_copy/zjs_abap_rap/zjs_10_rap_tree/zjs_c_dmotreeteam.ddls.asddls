@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
@OData.hierarchy.recursiveHierarchy:[{ entity.name: 'ZJS_I_DMOTreeTeamHR' }]
define root view entity ZJS_C_DMOTREETEAM
  provider contract transactional_query
  as projection on ZJS_R_DMOTREETEAM
  association of many to one ZJS_C_DMOTREETEAM as _TeamLeader on $projection.TeamLeader = _TeamLeader.UserId
{
  key UserId,
      PlayerName,
      PlayerEmail,
      PlayerPosition,
      Score,
      Team,
      TeamLeader,
      LocalCreatedBy,
      LocalLastChangedBy,
      LocalLastChanged,
      LastChanged,
      _TeamLeader

}
