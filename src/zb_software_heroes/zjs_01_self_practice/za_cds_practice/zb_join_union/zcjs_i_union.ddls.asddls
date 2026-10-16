@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'UNION'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view entity ZCJS_I_UNION
  as select from ZCJS_C_ITEMS
{
  key DocumentNumber,
  key ItemNumber,
      @Semantics.amount.currencyCode: 'ItemCurrency'
      ItemPrice,
      ItemCurrency,
      'NORMAL' as ItemType
}

where
  Errors = ''

union select from ZCJS_C_ITEMS
{
  key DocumentNumber,
  key ItemNumber,
      cast( 0 as abap.curr( 15, 2 )  ) as ItemPrice,
      ItemCurrency,
      'ERRORS'                         as ItemType
}

where
  Errors = 'X'
