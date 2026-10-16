@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Team View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCJS_I_TEAM as select from ZDJS_TEAM
{
  key user_id         as UserIdentification,
      player_name     as PlayerFullName,
      player_email    as EMailAddress,
      player_position as PlayerPosition,
      score           as ELOScore,
      team            as TeamName,
      team_leader     as TeamLeader
}
