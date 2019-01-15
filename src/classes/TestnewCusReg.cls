@isTest
public class TestnewCusReg 
{

    public static testMethod void test2()
    {
        
        Customer__c cus=new Customer__c(Name='Suru123',Customer_AADHAR_ID__c=154872409789L,Customer_Email__c='suyankaggarwal@yahoo.co.in',Customer_Gender__c='Male',Customer_Phone__c='9078657487');
		newCusReg.insertCusRec(cus);
        
    }
    
}