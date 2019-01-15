@isTest
public class getTicketDetailsTest 
{
    @testSetup
    public static void dataUtils()
    {
        
		Customer__c cus=new Customer__c(Name='Suru',Customer_AADHAR_ID__c=154872409709L,Customer_Email__c='suryankaggarwal@yahoo.co.in',Customer_Gender__c='Male',Customer_Phone__c='9878657487' );
		insert cus;

        Ticket__c tkt=new Ticket__c(Customer__c=cus.Id, Payment_Status__c='Pending',Booking_Status__c='Confirmed',
                                     Number_Of_Child__c=2,Number_Of_Adult__c=2
                                     ,Number_Of_Senior__c=2);
        insert tkt;        
        
    }
    public static  testMethod void getTestTicket1()
    {
        Customer__c cus=[Select Id,Name From Customer__C];
        Ticket__c tkt=[Select Id from Ticket__c];
      //  Database.SaveResult result= Database.update(Success);
        getTicketDetails.fetchTicket(tkt.Id);
      //  System.assertEquals(expected, actual)
        
    }
    public static  testMethod void getTestTicket2()
    {
        Ticket__c tkt=[Select Id,Payment_Status__C from Ticket__c];
        tkt.Payment_Status__C='Successful';
        getTicketDetails.updateTicket(tkt);
        
    }
    
}