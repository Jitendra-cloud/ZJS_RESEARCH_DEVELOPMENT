@EndUserText.label: 'Custom Entity Value Help ''City'''
@ObjectModel.query.implementedBy: 'ABAP:ZCLJS_CITY_QUERY'
define custom entity ZCJS_I_RAPCityVH
{
      @EndUserText.label: 'City'
      @EndUserText.quickInfo: 'Name of the City'
  key City      : abap.char(60);
      @EndUserText.label: 'City (Short)'
      @EndUserText.quickInfo: 'Short name of the City'
      CityShort : abap.char(10);
}
