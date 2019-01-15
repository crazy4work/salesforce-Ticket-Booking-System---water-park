public class ConvertTicket {
    public void UpdateAndConvertTicket(List<Lead> leads){
    List<Ticket__c> leadToTicket = new List<Ticket__c>();
    List<string> Email =new List<string>();
       
    for(Lead lead:leads)
    {
     Email.add(lead.Email);
     }
       // List<Ticket__c> ticket = [Select Name,Customer_ID__c ,Customer_Phone__c,No_of_Visits__c,Customer_Email__C,Customer_Gender__c,Customer_AADHAR_ID__c From Customer__c where Customer_Email__c In:Email ];
      List<Customer__c> customer = [Select Customer_ID__c, Customer_Email__C  From Customer__c where Customer_Email__c In:Email ]; 
      for(Lead lead:leads)
      {
          for(Customer__c cus : customer){
              if((cus.Customer_Email__c)==(lead.Email)){
       leadToTicket.add(new Ticket__c(Number_Of_Child__c = lead.Number_of_Child__c , Number_Of_Adult__c = lead.Number_of_Adult__c , NUmber_Of_Senior__c = lead.Number_of_Senior__c, 
                                       Date__c = lead.Date__c, Customer_Email_Add__c = lead.Email , Customer__c = cus.Id ,Booking_Status__c='Confirmed' , Payment_Status__c='Pending' ));
                 
              }
         
          }
      }
        
        insert leadToTicket;
        
    }

}