@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Session information'
define view entity ZJS_C_DMOINVOICESESSION
  as select from ZJS_I_DMOINVOICE
{
  key DocumentNumber,
      DocumentDate,
      $session.system_language as SystemLanguage
}
where
  DocumentDate < $session.system_date
