@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CASE + UPPER + LOWER + CONCATWITHSPACE'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCJS_C_ITEMS
  as select from ZCJS_I_ITEMS
{
  key DocumentNumber,
  key ItemNumber,
      MaterialNumber,
      ZCJS_I_ITEMS._Material.StockUnit,
      @Semantics.quantity.unitOfMeasure: 'StockUnit'
      ItemQuantity,
      @Semantics.amount.currencyCode: 'ItemCurrency'
      ItemPrice,
      ItemCurrency,
      case ItemPrice when 37707 then 'X' else '' end as Errors
      //      lower( ItemCurrency )                                                         as CurrencyInLowerCase,
      //      upper( ItemCurrency )                                                         as CurrencyInUpperCase,
      //      concat_with_space( MaterialNumber, cast(ItemQuantity as abap.char(20) ) , 5 ) as ConcatWithSpace,
      //      coalesce( ItemCurrency , 'USD' ) as Return2ndIfFirstBlank

}
