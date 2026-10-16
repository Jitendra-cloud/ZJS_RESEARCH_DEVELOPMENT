@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unmanaged Consumption'
@ObjectModel.query.implementedBy: 'ABAP:ZCLJS_UNMANAGED_QUERY'
@UI: { headerInfo: {typeName: 'Unmanaged',
                    typeNamePlural: 'Unmanaged',
                    title: { value: 'Description' } } }
define root view entity ZCJS_C_Unmanaged
  provider contract transactional_query
  as projection on ZCJS_I_Unmanaged
{
      @UI.facet      : [{ id         : 'FacetData',
                          label      : 'Data',
                          type       : #FIELDGROUP_REFERENCE,
                          targetQualifier: 'DATA' } ]

      @UI.lineItem: [{ position: 10, label: 'Key', cssDefault.width: '25rem' }]
      @UI.fieldGroup: [{ position: 10, label: 'Table Key' }]
  key TableKey,
      @UI.selectionField: [{  position: 10 }]
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZCJS_I_UN_DATA_VH', element: 'Text' } }]
      @UI.lineItem: [{ position: 20, label: 'Description' }]
      @UI.fieldGroup: [{ position: 20, label: 'Description', qualifier: 'DATA' }]
      Description,
      @UI.selectionField: [{  position: 20 }]
      @UI.lineItem: [{ position: 30, label: 'Created at', cssDefault.width: '15rem' }]
      @UI.fieldGroup: [{ position: 20, label: 'CreationDate', qualifier: 'DATA' }]
      CreationDate
}
