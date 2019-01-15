public class BookTicketHandling {
    @AuraEnabled
    public static Offer__c fetchOffer(Integer Repeatition){
        String Repeat;
        if(Repeatition>4){
            Repeat='More than 4';
        }
        else{
            Repeat=String.valueOf(Repeatition);
        }
        
        try{
            Offer__c offer= [SELECT Id, Discount__C FROM Offer__c WHERE RepeatingNo__c =:Repeat];
        	return offer;
        }
        catch(Exception e){
            System.debug('fetchOffer Query Exception:::'+e);
            return null;
        }
        
    }
    
    @AuraEnabled
    public static Offer__c fetchOffer(String cusEmailId){
        Customer__c[] repeatition = [SELECT No_of_Visits__c FROM Customer__c WHERE Customer_Email__c=:cusEmailId];
        String numOfVisit;
        if(repeatition[0].No_of_Visits__c>4){
            numOfVisit='More than 4';
        }
        else{
            numOfVisit=String.valueOf(repeatition[0].No_of_Visits__c);
        }
        
        Offer__c[] offers = [Select Id, Discount__c from Offer__c where RepeatingNo__c = :numOfVisit];
        if(offers.size()!=0)
        	return offers[0];
        else
            return null;
    }
    
    @AuraEnabled
    public static void InsertTckt(Ticket__c tckt, Id cusId){
        Customer__c cus=[SELECT Id,No_of_Visits__c,Customer_Email__c  FROM Customer__c WHERE Id=:cusId];
        tckt.Customer_Email_Add__c =cus.Customer_Email__c;
        Database.SaveResult result=Database.insert(tckt);
        if(result.isSuccess()){
            //update ticket
            
            cus.No_of_Visits__c+=1;
            try{
                update cus;
            }
            catch(Exception e){
                System.debug('In Apex Controller InsertTckt'+e);
            }
        }
        else{
            System.debug('Ticket insertion failed In Apex Controller InsertTckt');
        }
    }

}