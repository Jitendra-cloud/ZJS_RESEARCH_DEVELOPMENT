define abstract entity ZJS_S_SASale
{
  PartnerNumber : ZJS_DEMO_SA_PARTNER;
  SalesDate : ZJS_DEMO_SA_DATE;
  @Semantics.amount.currencyCode: 'SalesCurrency'
  SalesVolume : ZJS_DEMO_SA_AMOUNT;
  SalesCurrency : ZJS_DEMO_SA_CURRENCY;
  @Semantics.amount.currencyCode: 'DifferenceCurrency'
  DifferenceAmount : ZJS_DEMO_SA_AMOUNT;
  DifferenceCurrency : ZJS_DEMO_SA_CURRENCY;
  @Semantics.quantity.unitOfMeasure: 'DifferenceUnit'
  DifferenceQuantity : ZJS_DEMO_SA_QUANTITY;
  DifferenceUnit : ZJS_DEMO_SA_UNIT;
  SaleComment : ZJS_DEMO_SA_COMMENT;
}
