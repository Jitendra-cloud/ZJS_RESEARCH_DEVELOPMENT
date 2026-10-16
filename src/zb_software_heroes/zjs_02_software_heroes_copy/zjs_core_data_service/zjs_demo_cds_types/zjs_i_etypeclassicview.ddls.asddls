@AbapCatalog.sqlViewName: 'ZBSIETYCLASSVIEW'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Classic CDS View'
@Metadata.ignorePropagatedAnnotations: true
define view ZJS_I_ETYPECLASSICVIEW
  as select from zjs_dmo_partner
{
  key partner          as Partner,
      name             as Name,
      street           as Street,
      city             as City,
      country          as Country,
      payment_currency as PaymentCurrency
}
