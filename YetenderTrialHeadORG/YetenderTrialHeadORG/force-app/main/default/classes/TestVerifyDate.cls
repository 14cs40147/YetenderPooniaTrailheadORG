@isTest
private class TestVerifyDate {

    @isTest
    static void CheckDates(){
        
        //Assesrt for passing second date as smaller then first date
        System.assertEquals(Date.newInstance(2018, 07, 31), VerifyDate.CheckDates(Date.newInstance(2018, 07, 09), Date.newInstance(2018, 07, 08)), 'Un expected return date');
        
        //Assesrt for both same dates
        System.assertEquals(Date.newInstance(2018, 07, 31), VerifyDate.CheckDates(Date.newInstance(2018, 07, 09), Date.newInstance(2018, 07, 31)), 'Un expected return date');
    }
}