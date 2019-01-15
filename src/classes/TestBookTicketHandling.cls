@isTest
public class TestBookTicketHandling 
{
  	@testSetup
    public static void dataUtil(){
        Customer__c cus=new Customer__c(Name='Suru123',No_of_Visits__c=3, Customer_AADHAR_ID__c=154872409789L,Customer_Email__c='suyankaggarwal@yahoo.co.in',Customer_Gender__c='Male',Customer_Phone__c='9078657487' );
    	insert cus;
        Offer__c off=new Offer__c(RepeatingNo__c='3',Discount__c=30);
        insert off;
        Offer__c off1=new Offer__c(RepeatingNo__c='More than 4',Discount__c=50);
        insert off1;
        
        //insert tckt;
        //System.debug('Test tckt'+tckt);
    }
    public static testMethod void getTestTicket()
    {
        
         Offer__c offer= [SELECT Id, Discount__C FROM Offer__c WHERE RepeatingNo__c ='3'];
        	
        
        
        Offer__c offer1= [SELECT Id, Discount__C FROM Offer__c WHERE RepeatingNo__c ='More than 4'];
    	BookTicketHandling.fetchOffer(3);
   		BookTicketHandling.fetchOffer(5);
    }
    public static  testMethod void TestfetchOffer()
    {
       
        
       
		
        
        Customer__c cus1=[SELECT id,Customer_Email__c From Customer__c];
        BookTicketHandling.fetchOffer(cus1.Customer_Email__c);
      //  Database.SaveResult result= Database.update(Success);
       // getTicketDetails.fetchTicket(tkt.Id);
      //  System.assertEquals(expected, actual)
        
    }
    
    public static  testMethod void TestInsertTckt(){
        Customer__c cus=[SELECT Id From Customer__C WHERE No_of_Visits__c=3];
        Offer__c off1= [SELECT Id, Discount__C FROM Offer__c WHERE RepeatingNo__c ='3'];
        Ticket__c tckt= new Ticket__c(Customer__c=cus.Id, 
                                      Date__c=Date.valueOf('2018-10-30'), 
                                      Payment_Status__c='Pending', 
                                      Booking_Status__c='Confirmed', 
                                      Offers__c=off1.Id, 
                                      Number_Of_Adult__c=1, Number_Of_Child__c=2, Discount__c=30, 
                                      Customer_Email_Add__c='suyankaggarwal@yahoo.co.in');
        //Ticket__C tkt = [SELECT Id, Customer__c FROM Ticket__c];
        
        BookTicketHandling.InsertTckt(tckt , cus.Id);
    }

}