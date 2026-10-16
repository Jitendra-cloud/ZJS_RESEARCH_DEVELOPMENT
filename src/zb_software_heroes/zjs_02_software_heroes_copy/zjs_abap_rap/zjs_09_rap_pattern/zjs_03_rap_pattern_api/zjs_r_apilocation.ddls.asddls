@EndUserText.label: 'Location API'
define root custom entity ZJS_R_APILOCATION
{
  key LocationId          : abap.char(15);
      LocationName        : abap.char(80);
      LocationCoordinates : abap.char(35);
      LocalPeople         : abap.int4;
}
