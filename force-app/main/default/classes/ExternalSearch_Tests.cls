@isTest
private class ExternalSearch_Tests {
    @isTest static void test_method_one() {
        HttpMockFactory mock = new HttpMockFactory(200, 'OK', 'I found it!', new Map<String,String>());
        Test.setMock(HttpCalloutMock.class, mock);
        String result;
        Test.startTest();
        result = ExternalSearch.googleIt('epic search');
        Test.stopTest();
        system.assertEquals('I found it!', result); 
    }
    
    @isTest static void test_method_two(){
        HttpMockFactory mock = new HttpMockFactory(401, 'OK', 'Resource not found!', new Map<String,String>());
        Test.setMock(HttpCalloutMock.class, mock);
        Boolean exceptionErr = false;
        Test.startTest();
        try{
        	ExternalSearch.googleIt('epic search');
        }catch(ExternalSearch.ExternalSearchException eex){
            if(eex.getMessage().contains('Did not recieve a 200 status code: ')){
                exceptionErr = true;
            }
        }
        Test.stopTest();
        system.assert(exceptionErr, 'Did not recieve a 200 status code'); 
    }
}