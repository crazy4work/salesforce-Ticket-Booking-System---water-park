@isTest
public class TestTicketTrigger 
{
    @testSetup
    private static void dataUtility(){
        Customer__c cus = new Customer__C();
        cus.Customer_AADHAR_ID__c=123232323232L;
        cus.Customer_Email__c='surusurya@gmail.com';
        cus.Customer_Gender__c='Male';
        cus.Customer_Phone__c='1234567890';
        cus.No_of_Visits__c=3;
        insert cus;
        
        Offer__c off = new Offer__c(Discount__c=50,RepeatingNo__c='3');
        insert off;
        
        Ticket__c tkt = new Ticket__C();
        tkt.Customer__c=cus.Id;
        System.debug('In TestTicketTrigger:::Customer Id'+cus.Id);
        tkt.Booking_Status__c='Not Confirmed';
        tkt.Number_Of_Adult__c=2;
        tkt.Number_Of_Child__c=2;
        tkt.Number_Of_Senior__c=2;
        tkt.Customer_Email_Add__c='surusurya@gmail.com';
        insert tkt;
        
        
    }
    private static testMethod void testTicket()
    {   
        
        Ticket__c tckt=[Select Id,Customer__c,Discount__c, Offers__c from Ticket__c];
        Offer__c off=[SELECT Id FROM Offer__c WHERE RepeatingNo__c='3'];
        System.debug('1Test  class TICKET Customer'+tckt.Customer__c);
        System.debug('1Test  class TICKET Offer'+tckt.Offers__c);
        System.assertEquals(off.Id, tckt.Offers__c);
		System.assertEquals(50, tckt.Discount__c);		
        
    }

}