@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Extension'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@AbapCatalog.extensibility.extensible: true
@VDM.viewType: #CONSUMPTION
define view entity ZCJS_C_DiscountExtension2 as select from ZCJS_I_DISCOUNT
{
    key PartnerNumber,
    key MaterialNumber,
    DiscountValue,
    /* Associations */
    _Material,
    _Partner
}
