* Settings *
Library    REST    http://hrc.idtesting.work/api
Documentation    ทดสอบการทํางานของ API

* Variables *
${json}     {"product_name":"กระเป๋า","product_price":2000,"user_id":"645159090011"}
${jsonUpdate}     {"product_name":"กระเป๋าหนัง","product_price":1000,"user_id":"645159090011"}

* Test Cases *
TC01 POST with valid params to create Product, บันทึกข้อมูลสินค้า(ในการทดสอบจะดาวน์โหลดผล test เป็น json ไฟล์ไว้)
    POST     /create.php     ${json}
    Integer    response status     200
    [Teardown]    Output    response body     ${OUTPUTDIR}/responseCreate.json

TC02 POST with valid params to update Product, แก้ไขข้อมูลสินค้า(ในการทดสอบจะดาวน์โหลดผล test เป็น json ไฟล์ไว้)
    POST     /update.php?id=YDjAFaoNce9Kp4zr2GkW     ${jsonUpdate}
    Integer     response status     200
    [Teardown]     Output     response body     ${OUTPUTDIR}/responseUpdate.json

TC03 GET existing log ,สินค้าแยกตามรหัส
    GET         /getById.php?id=YDjAFaoNce9Kp4zr2GkW
    String     $.product_id       YDjAFaoNce9Kp4zr2GkW
    String     $.product_name     กระเป๋าหนัง
    [Teardown]     Output     response body     ${OUTPUTDIR}/responseById.json

TC04 GET existing log ,สินค้าทั้งหมด
    GET     /getData.php?user_id=645159090011
    Integer     response status     200
    String     $[0].user_id    645159090011
    [Teardown]  Output     response body     ${OUTPUTDIR}/responseAllData.json

TC05 GET existing log ,ลบสินค้า
    GET     /delete.php?id=0FZ6CHQg3kaqYRc9E24y
    Integer     response status     200
    [Teardown]     Output     response body   ${OUTPUTDIR}/DeleteData.json
