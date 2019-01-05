@isTest
private class Calculator_Tests {
    static Integer intA = 5;
    static Integer intB = 10;
    @testSetup
    static void loadTestData(){
        //intA = 5;
        //intB = 10;
    }
    
    @istest static void testAddition(){
        Test.startTest();
        Integer result = Calculator.addition(intA, intB);
        system.assert(result == 15, 'Expected 15 as addition of 5 + 10');
        Test.stopTest();
    } 
    @istest static void testSubtraction(){
        Test.startTest();
        Integer result = Calculator.subtraction(intA, intB);
        system.assert(result == -5, 'Expected -5 as subtraction of 5 - 10');
        Test.stopTest();
    } 
    
    @istest static void testPositiveMultiply(){
        Test.startTest();
        Integer result = Calculator.multiply(intA, intB);
        system.assert(result == 50, 'Expected 50 as multiply of 5*10');
        Test.stopTest();
    }
    
    @istest static void testNegativeMultiply(){
        intA=0; intB=0;
        Boolean isException = false;
        Test.startTest();
        try{
            Calculator.multiply(intA, intB);
        }catch(Calculator.CalculatorException ce){
            if(ce.getMessage().equalsIgnoreCase('It doesn\'t make sense to multiply by zero')){
                isException = true;
            }
        }
        system.assert(isException, 'trying to multiple by zero');
        Test.stopTest();
    }
    
    @istest static void testPositiveDivide(){
        intA=5; intB=10;
        Test.startTest();
        Decimal result = Calculator.divide(intB, intA);
        system.assert(result == 2.0, 'Expected 2.0 as divide of 10/2');
        Test.stopTest();
    }
    
    @istest static void testNegativeDivideByZero(){
        intA=5; intB=0;
        Boolean isException = false;
        Test.startTest();
        try{
            Calculator.divide(intA, intB);
        }catch(Calculator.CalculatorException ce){
            if(ce.getMessage().equalsIgnoreCase('you still can\'t divide by zero')){
                isException = true;
            }
        }
        system.assert(isException, 'trying to divide by zero');
        Test.stopTest();
    }
    
    @istest static void testNegativeDivideReturnNegativeValue(){
        intA=5; intB=-5;
        Boolean isException = false;
        Decimal returnValue;
        Test.startTest();
        try{
            returnValue = Calculator.divide(intA, intB);
            system.debug('returnValue = ' + returnValue);
        }catch(Calculator.CalculatorException ce){
            system.debug('ce.getMessage() : ' + ce.getMessage());
            if(ce.getMessage().contains('Division returned a negative value.')){
                isException = true;
            }
            system.debug('isException : ' + isException);
        }
        system.assert(isException, 'Failed: Division returned a negative value');
        Test.stopTest();
    }
}