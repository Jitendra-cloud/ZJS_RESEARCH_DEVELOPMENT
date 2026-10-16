@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for ZDJS_MATERIAL'
define view entity ZCJS_I_RAPCMaterial
  as select from zdjs_material
{
  key material       as Material,
      name           as MaterialName,
      description    as Description,
      stock          as Stock,
      stock_unit     as StockUnit,
      price_per_unit as PricePerUnit,
      currency       as Currency
}
