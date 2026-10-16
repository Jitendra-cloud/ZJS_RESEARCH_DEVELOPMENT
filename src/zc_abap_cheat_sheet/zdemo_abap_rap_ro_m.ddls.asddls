@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZDEMO_ABAP_RAP_RO_M
  as select from zdemo_abap_rapt1
  composition [0..*] of ZDEMO_ABAP_RAP_CH_M as _child
{
  key key_field,
      field1,
      @ObjectModel.text.element: [ 'field3' ]
      field2,
      field3,
      field4,
      case when field4 between 0 and 32 then 2 --  | 2 : yellow colour 
      when field4 between 33 and 66 then 3 -- | 3 : green colour
      when field4 between 67 and 100 then 1 -- | 1 : red colour
      else  0
      end   as  colort,
      @Semantics.imageUrl: true
      cast( 
      'http://xxriddickxx.deviantart.com/art/One-Piece-2-Lineart-265374253' as                                 
        abap.char( 256 ) )   as P_Image_URL,
      
      
      _child
}
 