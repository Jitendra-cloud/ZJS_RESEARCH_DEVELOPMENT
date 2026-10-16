@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base view of Material table'
@VDM.viewType: #COMPOSITE
define view entity ZCJS_I_MATERIAL
  as select from zdjs_material
  association [0..1] to I_Currency      as _Currency on $projection.Currency = _Currency.Currency
  association [0..1] to I_UnitOfMeasure as _Unit     on $projection.StockUnit = _Unit.UnitOfMeasure
{
  key material       as MaterialNumber,
      name           as MaterialName,
      description    as MaterialDescription,
      @Semantics.quantity.unitOfMeasure: 'StockUnit'
      stock          as Stock,
      stock_unit     as StockUnit,
      @Semantics.amount.currencyCode: 'Currency'
      price_per_unit as PricePerUnit,
      currency       as Currency,
      _Currency,
      _Unit
}
