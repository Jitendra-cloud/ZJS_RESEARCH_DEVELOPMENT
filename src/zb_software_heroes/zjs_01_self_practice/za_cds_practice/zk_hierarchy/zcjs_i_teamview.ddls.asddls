@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Team'
define view entity ZCJS_I_TeamView
  as select from ZCJS_I_TEAM
  association of many to one ZCJS_I_TeamView as _Leader on _Leader.UserIdentification = $projection.TeamLeader
{
  key UserIdentification,
      PlayerFullName,
      EMailAddress,
      PlayerPosition,
      ELOScore,
      TeamName,
      TeamLeader,
      _Leader
}
