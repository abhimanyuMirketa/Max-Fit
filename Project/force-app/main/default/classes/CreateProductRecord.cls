public class CreateProductRecord {
    public static HttpResponse CreateRecord() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://fakestoreapi.com/products');
        req.setMethod('GET');

        Http http = new Http();
        HTTPResponse res = http.send(req);

        if(res.getStatusCode() == 200){
            String response = res.getBody();

            List<Object> productList = (List<Object>) JSON.deserializeUntyped(response);

            List<Product2> proList = new List<Product2>();
            List<PricebookEntry> entryList = new List<PricebookEntry>();
            List<PricebookEntry> entryList2 = new List<PricebookEntry>();
            Pricebook2 standardPB = new Pricebook2();
            if(Test.isRunningTest()){
                Id pbid=Test.getStandardPricebookId();
                standardPB.Id=pbid;
            }
            else{
                 standardPB = [select id from Pricebook2 where isStandard = True];
            }
            Pricebook2 pricebook = new Pricebook2(Name = 'AbhimanyuRana-pricebook', Description = 'My price book',IsActive = True);
            insert pricebook;
            

            for(object product : productList){
                Map<String,Object> productMap = (Map<String,Object>) product;

                String title = (String) JSON.serialize(productMap.get('title'));
                title = title.substring(1, title.length()-1);

                String discript = (String) JSON.serialize(productMap.get('Description'));
                discript = discript.substring(1, discript.length()-1);

                Product2 prod = new Product2(
                    ProductCode = (String) JSON.serialize(productMap.get('id')),
                    Name = title,
                    Description = discript
                );
                proList.add(prod);


            }
            insert proList;

            for(integer i=0;i<productList.size();i++){
                object product  = productList.get(i);
                Id productId = proList.get(i).Id;

                Map<String,Object> productMap = (Map<String,Object>) product;

                Decimal strToDec = decimal.valueof(JSON.serialize(productMap.get('price'))
                );
                PricebookEntry entry = new PricebookEntry(
                Pricebook2Id = standardPB.Id,
                Product2Id = productId,
                UnitPrice = strToDec,
                IsActive = true
                );
                entryList2.add(entry);
            }
            insert entryList2;

            for (integer i = 0; i < productList.size(); i++){
                Object product = productList.get(i);
                Id productId = proList.get(i).Id;

                Map<String, Object> productMap = (Map<String, Object>) product;

                Decimal strToDec = decimal.valueOf(JSON.serialize(productMap.get('price')));

                PricebookEntry entry = new PricebookEntry(
                    Pricebook2Id = pricebook.Id,
                    Product2Id = productId,
                    UnitPrice = strToDec,
                    IsActive = true
                );
                entryList.add(entry);
            }
            insert entryList;
        }
        return res;

    }
    
}