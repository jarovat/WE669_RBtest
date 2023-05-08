* Settings *
Library     REST      http://hrc.idtesting.work/api/
Documentation    ทดสอบการทํางานของ API

* Variables *
${json}     {"product_name":"Robot's Create Ja","product_price":555}
${jsonUpdate}     {"product_name":"Robot 3 Test","product_price":555}

* Test Cases *
TC01 POST with valid params to create Product, บันทึกข้อมูลสินค้า(ในการทดสอบจะดาวน์โหลดผล test เป็น json ไฟล์ไว้)
    POST     /create.php     ${json}
    Integer    response status     200
    [Teardown]    Output    response body     ${OUTPUTDIR}/responseCreate.json

TC02 POST with valid params to update Product, แก้ไขข้อมูลสินค้า(ในการทดสอบจะดาวน์โหลดผล test เป็น json ไฟล์ไว้)
    POST     /update.php?id=snmEDdVQ0cpILkgjuhFR     ${jsonUpdate}
    Integer     response status     200
    [Teardown]     Output     response body     ${OUTPUTDIR}/responseUpdate.json

TC03 GET existing log ,สินค้าแยกตามรหัส
    GET         /getById.php?id=snmEDdVQ0cpILkgjuhFR
    String     $.product_id       snmEDdVQ0cpILkgjuhFR
    String     $.product_name     Robot 3 Test
    [Teardown]     Output     response body     ${OUTPUTDIR}/responseById.json

TC04 GET existing log ,สินค้าทั้งหมด
    GET     /getData.php
    Integer     response status     200
    String     $[0].product_name     Robot's Create Ja
    [Teardown]  Output     response body     ${OUTPUTDIR}/responseAllData.json

TC05 GET existing log ,ลบสินค้า
    GET     /delete.php?id=snmEDdVQ0cpILkgjuhFR
    Integer     response status     200
    [Teardown]     Output     response body   


TC06 GET existing log ,ลบสินค้าแบบไม่ผ่าน
    GET     /delete.php?id=KQ4PxdRvBf6bjeXDUl
    Integer     response status     204
    [Teardown]     Output     response body   ${OUTPUTDIR}/responseDeleteFail.json