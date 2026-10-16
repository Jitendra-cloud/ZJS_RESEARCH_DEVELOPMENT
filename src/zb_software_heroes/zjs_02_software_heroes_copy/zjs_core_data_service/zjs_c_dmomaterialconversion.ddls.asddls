@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Conversion for units'
define view entity ZJS_C_DMOMATERIALCONVERSION
  as select from ZJS_I_DMOMATERIAL
{
  key MaterialNumber,
      MaterialName,
      @Semantics.quantity.unitOfMeasure: 'StockUnit'
      Stock,
      StockUnit,
      @Semantics.quantity.unitOfMeasure: 'TargetUnit'
      unit_conversion(
        quantity => Stock,
        source_unit => StockUnit,
        target_unit => cast( 'ST' as abap.unit( 3 ) ),
        error_handling => 'SET_TO_NULL'
      )                              as UnitInPieces,
      cast( 'ST' as abap.unit( 3 ) ) as TargetUnit
}
