@EndUserText.label: 'Unmanaged Consumption'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.query.implementedBy: 'ABAP:ZCL_JS_DEMO_UNMANAGED_QUERY'
@UI: {
  headerInfo: {
    typeName: 'Unmanaged',
    typeNamePlural: 'Unmanaged',
    title: { value: 'Description' }
  }
}
define root view entity ZJS_C_DMOUNMANAGED
  provider contract transactional_query
  as projection on ZJS_R_DMOUNMANAGED
{
      @UI.facet      : [
        {
          id         : 'FacetData',
          label      : 'Data',
          type       : #FIELDGROUP_REFERENCE,
          targetQualifier: 'DATA'
        }
      ]

      @UI.lineItem: [{ position: 10, label: 'Key', cssDefault.width: '25em' }]
      @UI.fieldGroup: [{ position: 10, label: 'Key' }]
  key TableKey,
      @UI.selectionField: [{  position: 10 }]
      @UI.lineItem: [{ position: 20, label: 'Text', cssDefault.width: '15em' }]
      @UI.fieldGroup: [{ position: 20, label: 'Text', qualifier: 'DATA' }]
      Description,
      @UI.selectionField: [{  position: 20 }]
      @UI.lineItem: [{ position: 30, label: 'Created at', cssDefault.width: '15em' }]
      @UI.fieldGroup: [{ position: 20, label: 'Text', qualifier: 'DATA' }]
      CreationDate
}
