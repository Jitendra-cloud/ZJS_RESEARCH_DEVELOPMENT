@AbapCatalog.sqlViewAppendName: 'ZJSEDMODISEXT'
@EndUserText.label: 'Extension for ZJS_C_DmoDiscountExtension'
extend view ZJS_C_DMODISCOUNTEXTENSION with ZJS_E_DMODISCOUNTEXTENSION
{
  ZJS_I_DMODISCOUNT._Partner.PartnerName as ZZPartnerName
}
