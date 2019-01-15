@isTest
public class TestConvertCustomer {
    
 public  Static testMethod void testConvertContact(){
    
    
   Lead lead = new Lead(FirstName = 'Sanju', LastName = 'Jangid',Email  = 'test5@gmail.com',Company   = 'Sanju',
                        Gender__c   = 'Female',Number_of_Child__c = 1,Number_of_Adult__c = 1,Number_of_Senior__c = 1,
                            Phone  = '3331231204',Aadhar_Card_Number__c=123450087890L,Date__c=Date.valueOf('2018-10-10'),Status = 'Open - Not Contacted' );
    
   
   //   Test.startTest();
      insert lead;
     System.debug('hello'+lead);
   //    Test.stopTest();
       Customer__c customer = [Select Customer_Email__C
                                From Customer__c where Customer_AADHAR_ID__c =: 123450087890L];
      
       String email = customer.Customer_Email__c;
       System.debug('hellow'+email);
       
     System.assertEquals('test5@gmail.com', email);
      Ticket__c tckt =[Select Customer_Email_Add__c from Ticket__c ];
     System.assertEquals('test5@gmail.com', tckt.Customer_Email_Add__c);
     
     Lead lead1 = new Lead(FirstName = 'simran', LastName = 'Jangid',Email ='test5@gmail.com', Company = 'Sanju',
                        Gender__c   = 'Female',Number_of_Child__c = 2,Number_of_Adult__c = 2,Number_of_Senior__c = 2,
                            Phone  = '3331331204',Aadhar_Card_Number__c=123450088890L,Date__c=Date.valueOf('2018-10-10'),Status = 'Open - Not Contacted' );
     insert lead1;
     Customer__c customer1 = [Select Customer_Email__C From Customer__c ];
      String email1 = customer.Customer_Email__c;
       System.debug('hellow'+email);
       
     System.assertEquals('test5@gmail.com', email1);
     
    }                                      
}