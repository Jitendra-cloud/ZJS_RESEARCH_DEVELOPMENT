@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Authority base view'
define view entity ZJS_B_DMOAUTHBASE
  as select from zjs_dmo_material
{
  key material       as Material,
      name           as MaterialName,
      description    as Description,
      stock          as Stock,
      stock_unit     as Unit,
      price_per_unit as PricePerUnit,
      currency       as Currency
}
