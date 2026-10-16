@EndUserText.label: 'Entity for popup'
define abstract entity ZJS_I_POPUPENTITY
{
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZJS_C_CountryVH', element: 'Country' } }]
  @EndUserText.label: 'Search Country'
  SearchCountry : land1;
  @EndUserText.label: 'New date'
  NewDate       : abap.dats;
  @EndUserText.label: 'Message type'
  MessageType   : abap.int4;
  @EndUserText.label: 'Update data'
  FlagUpdate    : abap.char(1);
  @EndUserText.label: 'Show Messages'
  FlagMessage   : abap_boolean;
}
