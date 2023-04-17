@isTest
public class ProductTest {
    @isTest
    static void TestCallout() {
        Test.setMock(HttpCalloutMock.class, new productMock());

        HttpResponse res = CreateProductRecord.createRecord();

        String contentType = res.getHeader('Content-Type');
        system.assert(contentType == 'application/json');

        system.assertEquals(200, res.getStatusCode(),'successful authentication');

        Product2 product = [Select Id, Name from Product2 Where Name = 'Super Bike'];
        system.assertEquals(product.Name, 'Super Bike');

        Pricebook2 pricebook = [Select Id,Name from Pricebook2 WHERE  Name = 'Abhimanyu Rana-pricebook'];
        system.assertEquals(pricebook.Name, 'Abhimanyu Rana-pricebook');

        Pricebook2 standardPB = [Select Id from Pricebook2 where IsStandard = true];

        List<PricebookEntry> entryList = [Select Id from PricebookEntry where Pricebook2Id =: pricebook.Id AND Product2Id =:product.Id];

        system.assertEquals(1,entryList.size());

        List<PricebookEntry> entryList2 =[Select Id from PricebookEntry where Pricebook2Id =: pricebook.Id AND Product2Id =: product.Id];
        system.assertEquals(1,entryList2.size());

    }
}