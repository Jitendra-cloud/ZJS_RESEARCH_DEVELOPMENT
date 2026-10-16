CLASS LHC_DMOGEN2H DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR DMOGen2H
        RESULT result,
      CALCULATEUUIDKEY FOR DETERMINE ON SAVE
        IMPORTING
          KEYS FOR  DMOGen2H~CalculateUuidKey .
ENDCLASS.

CLASS LHC_DMOGEN2H IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD CALCULATEUUIDKEY.
  READ ENTITIES OF ZR_DMOGen2H01TP IN LOCAL MODE
    ENTITY DMOGen2H
      ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(entities).
  DELETE entities WHERE UuidKey IS NOT INITIAL.
  Check entities is not initial.
  "Dummy logic to determine object_id
  SELECT MAX( UUID_KEY ) FROM ZDJS_GEN2_HEADER INTO @DATA(max_object_id).
  "Add support for draft if used in modify
  "SELECT SINGLE FROM FROM ZDMOGEN2H00D FIELDS MAX( UuidKey ) INTO @DATA(max_orderid_draft). "draft table
  "if max_orderid_draft > max_object_id
  " max_object_id = max_orderid_draft.
  "ENDIF.
  MODIFY ENTITIES OF ZR_DMOGen2H01TP IN LOCAL MODE
    ENTITY DMOGen2H
      UPDATE FIELDS ( UuidKey )
        WITH VALUE #( FOR entity IN entities INDEX INTO i (
        %tky          = entity-%tky
        UuidKey     = max_object_id + i
  ) ).
  ENDMETHOD.
ENDCLASS.
