@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exit in CDS'
define view entity ZJS_C_DMOPRICEPERUNIT
  as select from ZJS_I_DMOPOSITION
{
  key DocumentNumber,
  key PositionNumber,
      ZJS_I_DMOPOSITION._Material.MaterialName,
      @Semantics.quantity.unitOfMeasure: 'PositionUnit'
      PositionQuantity,
      PositionUnit,
      @Semantics.amount.currencyCode: 'PositionCurrency'
      PositionPrice,
      PositionCurrency,
      @Semantics.amount.currencyCode: 'PositionCurrency'
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_JS_DEMO_CDS_EXIT'
      cast( 0 as abap.curr(15,2) ) as PricePerUnit
}
