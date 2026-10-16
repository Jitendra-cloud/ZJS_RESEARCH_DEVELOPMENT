@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Conversion of Units'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
define view entity ZCJS_C_MaterialConversion as select from ZCJS_I_MATERIAL
{
    key MaterialNumber,
    MaterialName,
    MaterialDescription,
    @Semantics.quantity.unitOfMeasure: 'StockUnit' 
    Stock,
    StockUnit,
    @Semantics.quantity.unitOfMeasure: 'StockUnit'
    unit_conversion( quantity => Stock, 
                     source_unit => StockUnit , 
                     target_unit => cast( 'ST' as abap.unit( 3 ) ),
                     error_handling => 'SET_TO_NULL' 
                    ) as UnitInPieces
}
