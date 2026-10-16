@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Count for Partner and Material'
define view entity ZJS_C_DMOPARTNERMATERIALCOUNT
  as select from ZJS_I_DMOPOSITION
{
  key ZJS_I_DMOPOSITION._Invoice.PartnerNumber,
  key MaterialNumber,
      count( * ) as NumberOfDocuments
}
group by
  ZJS_I_DMOPOSITION._Invoice.PartnerNumber,
  MaterialNumber
