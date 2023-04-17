@isTest
global class ProductMock implements HttpCalloutMock {
    global HttpResponse respond (HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{"id":1,"title":"Abhi","description":"It me","price":49.99}]');
        response.setStatusCode(200);
        return response;

    }
}