public class ConvertCustomer {
    
    public List<Customer__c> UpdateAndConvertContact(List<Lead> leads)
    {
    List<string> Email =new List<string>();
    List<Customer__c> leadToCus = new List<Customer__c>();
    List<Customer__c> leadToCus2 = new List<Customer__c>();
    
    for(Lead lead:leads)
    {
     leadToCus.add(new Customer__c(Name =lead.FirstName+lead.LastName , Customer_Email__c= lead.Email ,
                                   Customer_Gender__c=lead.Gender__c, Customer_AADHAR_ID__c=lead.Aadhar_Card_Number__c,Customer_Phone__c=lead.Phone ,No_of_Visits__c=0));
      Email.add(lead.Email);
     }
        List<Customer__c> customer = [Select Name,Customer_ID__c ,Customer_Phone__c,No_of_Visits__c,Customer_Email__C,Customer_Gender__c,Customer_AADHAR_ID__c From Customer__c where Customer_Email__c In:Email ];
        if(customer.size()>0)
        {
         for(Customer__c cus:customer )
         {
        
          cus.No_of_Visits__c = cus.No_of_Visits__c +1;
        //  leadToCus2.add(cus);
         }
   		upsert leadToCus Customer__c.Fields.Customer_Email__C; 

            
     	upsert customer Customer__c.Fields.Customer_Email__C;   
        
        }
   else{
       	upsert leadToCus Customer__c.Fields.Customer_Email__C;   
      }
        
   //List<Customer__c> allCustomer = [Select Customer_ID__c , Customer_Email__C from Customer__c ];
     List<Customer__c> returnCustomer = [Select Name,Customer_ID__c ,Customer_Phone__c,No_of_Visits__c,Customer_Email__C,Customer_Gender__c,Customer_AADHAR_ID__c From Customer__c where Customer_Email__c In:Email ];
     return returnCustomer;  
    }
    
}