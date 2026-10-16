@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Team'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZJS_I_DMOTEAMVIEW
  as select from ZJS_B_DMOTEAMVIEW
  association of many to one ZJS_I_DMOTEAMVIEW as _Leader on _Leader.UserIdentification = $projection.TeamLeader
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
