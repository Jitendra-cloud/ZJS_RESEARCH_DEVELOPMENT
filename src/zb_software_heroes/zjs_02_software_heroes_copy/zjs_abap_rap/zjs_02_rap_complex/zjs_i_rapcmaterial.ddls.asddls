@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for ZJS_DMO_MATERIAL'
define view entity ZJS_I_RAPCMATERIAL
  as select from zjs_dmo_material
{
  key material       as Material,
      name           as MaterialName,
      description    as Description,
      stock          as Stock,
      stock_unit     as StockUnit,
      price_per_unit as PricePerUnit,
      currency       as Currency
}
