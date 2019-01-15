public class getTicketDetails {
  @AuraEnabled
    public static List<Ticket__c> fetchTicket(String ticketId){
        
        List<Ticket__c> ticketList= [SELECT Name, Payment_Status__c,Booking_Status__c,
                                     Number_Of_Child__c,Number_Of_Adult__c
                           ,Number_Of_Senior__c,Total_Amount__c,Total_Tickets__c
                                     FROM Ticket__c WHERE Name=:ticketId];
        return ticketList;
    }
    
    @AuraEnabled
    public static void updateTicket(Ticket__c tckt){
     
         Database.SaveResult result= Database.update(tckt);
        if(result.isSuccess()){
            system.debug('In getTicketDetails Ticket Successfully Updated');
        }
        else{
            system.debug('In getTicketDetails Ticket successfully not updated');
        }
    }
}