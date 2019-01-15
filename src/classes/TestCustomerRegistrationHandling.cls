@isTest
public class TestCustomerRegistrationHandling 
{
    public static testMethod  void  test1()
    {
     Customer__c cus=new Customer__c(Name='Suru123',Customer_AADHAR_ID__c=154872409789L,Customer_Email__c='suyankaggarwal@yahoo.co.in',Customer_Gender__c='Male',Customer_Phone__c='9078657487');
		
    insert cus;
   // Customer__c cus1=[SELECT Id, Name, Customer_Email__c, Customer_Phone__c, Customer_Address__c FROM Customer__c WHERE Customer_Email__c=:'suyankaggarwal@yahoo.co.in'];
	CustomerRegistrationHandling.getMatchingCus(cus.Customer_Email__c); 	
    }
}

/*public class CustomerRegistrationHandling 
{
    @AuraEnabled
    public static List<Customer__c> getMatchingCus(String Email)
    {
        List<Customer__c> matchedCusList = [SELECT Id, Name, Customer_Email__c, Customer_Phone__c, Customer_Address__c FROM Customer__c WHERE Customer_Email__c=:Email];
        System.debug('matchedCusList:::'+matchedCusList);
        return matchedCusList;
    }

}*/