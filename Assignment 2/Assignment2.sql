-- Write a procedure to display the data in XML format.

--Table: mtl_system_items_b

SELECT * FROM MTL_SYSTEM_ITEMS_B;

SELECT 
INVENTORY_ITEM_ID, ORGANIZATION_ID, DESCRIPTION, SEGMENT1,
PURCHASING_ITEM_FLAG,SUMMARY_FLAG, INVENTORY_ITEM_FLAG, PRIMARY_UNIT_OF_MEASURE 
FROM MTL_SYSTEM_ITEMS_B WHERE INVENTORY_ITEM_ID BETWEEN 40 AND 50;


CREATE OR REPLACE PROCEDURE XXCTS_RAJDEEP_ITEM
IS
CURSOR ITEM_CUR
IS
SELECT 
INVENTORY_ITEM_ID, ORGANIZATION_ID, DESCRIPTION, SEGMENT1,
PURCHASING_ITEM_FLAG,SUMMARY_FLAG, INVENTORY_ITEM_FLAG, PRIMARY_UNIT_OF_MEASURE 
FROM MTL_SYSTEM_ITEMS_B WHERE INVENTORY_ITEM_ID BETWEEN 40 AND 50;
ITEM_REC ITEM_CUR%ROWTYPE;



BEGIN
OPEN ITEM_CUR;
DBMS_OUTPUT.PUT_LINE('<?xml version="1.0"?>');
DBMS_OUTPUT.PUT_LINE('<ItemsRoot>');
LOOP

FETCH ITEM_CUR
INTO ITEM_REC;

EXIT WHEN ITEM_CUR%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('<ITEMS>');
DBMS_OUTPUT.PUT_line('<INVENTORY_ITEM_ID>' || ITEM_REC.INVENTORY_ITEM_ID || '</INVENTORY_ITEM_ID>');
DBMS_OUTPUT.PUT_LINE('<ORGANIZATION_ID>' || ITEM_REC.ORGANIZATION_ID || '</ORGANIZATION_ID>');
DBMS_OUTPUT.PUT_LINE('<DESCRIPTION>'|| ITEM_REC.DESCRIPTION || '</DESCRIPTION>');
DBMS_OUTPUT.PUT_LINE('<SEGMENT1>'|| ITEM_REC.SEGMENT1 || '</SEGMENT1>');
DBMS_OUTPUT.PUT_LINE('<PURCHASING_ITEM_FLAG>'|| ITEM_REC.PURCHASING_ITEM_FLAG || '</PURCHASING_ITEM_FLAG>');
DBMS_OUTPUT.PUT_LINE('<SUMMARY_FLAG>'|| ITEM_REC.SUMMARY_FLAG || '</SUMMARY_FLAG>');
DBMS_OUTPUT.PUT_LINE('<INVENTORY_ITEM_FLAG>'|| ITEM_REC.INVENTORY_ITEM_FLAG || '</INVENTORY_ITEM_FLAG>');
DBMS_OUTPUT.PUT_LINE('<PRIMARY_UNIT_OF_MEASURE>'|| ITEM_REC.PRIMARY_UNIT_OF_MEASURE || '</PRIMARY_UNIT_OF_MEASURE>');
DBMS_OUTPUT.PUT_LINE('</ITEMS>');
END LOOP;
DBMS_OUTPUT.PUT_LINE('</ItemsRoot>');
CLOSE ITEM_CUR; 
END;



SELECT *
FROM USER_ERRORS
WHERE NAME =upper('XXCTS_RAJDEEP_ITEM');
exec XXCTS_RAJDEEP_ITEM;

-------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE XXCTS_RAJDEEP_ITEM(ERRBUF OUT VARCHAR2, RETCODE OUT
VARCHAR2)
IS
CURSOR ITEM_CUR
IS
SELECT 
INVENTORY_ITEM_ID, ORGANIZATION_ID, DESCRIPTION, SEGMENT1,
PURCHASING_ITEM_FLAG,SUMMARY_FLAG, INVENTORY_ITEM_FLAG, PRIMARY_UNIT_OF_MEASURE 
FROM MTL_SYSTEM_ITEMS_B WHERE INVENTORY_ITEM_ID BETWEEN 40 AND 50;

ITEM_REC ITEM_CUR%ROWTYPE;

V_ERROR_CODE NUMBER;
V_ERR_MESSAGE VARCHAR2(200);

BEGIN
OPEN ITEM_CUR;
FND_FILE.PUT_LINE(FND_FILE.OUTPUT,'<?xml version="1.0"?>');
FND_FILE.PUT_LINE(fnd_file.output,'<ItemsRoot>');
LOOP

FETCH ITEM_CUR
INTO ITEM_REC;

EXIT WHEN ITEM_CUR%NOTFOUND;
FND_FILE.PUT_LINE(FND_FILE.OUTPUT,'<ITEMS>');
FND_FILE.PUT_LINE(FND_FILE.OUTPUT,'<INVENTORY_ITEM_ID>' || ITEM_REC.INVENTORY_ITEM_ID || '</INVENTORY_ITEM_ID>');
FND_FILE.PUT_LINE(FND_FILE.OUTPUT,'<ORGANIZATION_ID>' || ITEM_REC.ORGANIZATION_ID || '</ORGANIZATION_ID>');
FND_FILE.PUT_LINE(FND_FILE.OUTPUT,'<DESCRIPTION>'|| ITEM_REC.DESCRIPTION || '</DESCRIPTION>');
FND_FILE.PUT_LINE(FND_FILE.OUTPUT,'<SEGMENT1>'|| ITEM_REC.SEGMENT1 || '</SEGMENT1>');
FND_FILE.PUT_LINE(FND_FILE.OUTPUT,'<PURCHASING_ITEM_FLAG>'|| ITEM_REC.PURCHASING_ITEM_FLAG || '</PURCHASING_ITEM_FLAG>');
FND_FILE.PUT_LINE(FND_FILE.OUTPUT,'<SUMMARY_FLAG>'|| ITEM_REC.SUMMARY_FLAG || '</SUMMARY_FLAG>');
FND_FILE.PUT_LINE(FND_FILE.OUTPUT,'<INVENTORY_ITEM_FLAG>'|| ITEM_REC.INVENTORY_ITEM_FLAG || '</INVENTORY_ITEM_FLAG>');
FND_FILE.PUT_LINE(FND_FILE.OUTPUT,'<PRIMARY_UNIT_OF_MEASURE>'|| ITEM_REC.PRIMARY_UNIT_OF_MEASURE || '</PRIMARY_UNIT_OF_MEASURE>');
FND_FILE.PUT_LINE(FND_FILE.OUTPUT,'</ITEMS>');
END LOOP;
FND_FILE.PUT_LINE(FND_FILE.OUTPUT,'</ItemsRoot>');
CLOSE ITEM_CUR; 
EXCEPTION

WHEN OTHERS THEN
V_ERROR_CODE := SQLCODE;

V_ERR_MESSAGE := SUBSTR(SQLERRM,1,200);
FND_FILE.PUT_LINE(FND_FILE.LOG, 'Error Code :' || V_ERROR_CODE);
FND_FILE.PUT_LINE(FND_FILE.LOG,'Error Message :' || V_ERR_MESSAGE);
end;





