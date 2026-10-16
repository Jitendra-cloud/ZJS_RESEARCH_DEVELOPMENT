@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Partner'
//@Metadata.ignorePropagatedAnnotations: true
define view entity ZCJS_I_RapMaterial
  as select from zdjs_material
{
  key material       as MaterialNumber,
      name           as MaterialName,
      description    as MaterialDescription,
      stock          as Stock,
      stock_unit     as StockUnit,
      price_per_unit as PricePerUnit,
      currency       as Currency
}
