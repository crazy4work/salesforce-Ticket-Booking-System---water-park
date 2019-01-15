trigger TicketTrigger on Ticket__c (before insert) 
{
    List<Id> cusIdList = new List<ID>();
    List<Ticket__c> updatedTckt = new List<Ticket__c>();
    for(Ticket__c ticket :trigger.new)
    {
        cusIDList.add(ticket.Customer__c);
        
    }
    List<Customer__C> cuslst = [SELECT Id,No_of_visits__c FROM Customer__c where Id IN: cusIdList];
    List<Offer__c> offList =  [SELECT Id, RepeatingNo__c, Name, Discount__c FROM Offer__C ];
    for(Customer__c cus: cuslst)
    {
        for(Ticket__c tckt :trigger.new){
            if(tckt.Customer__c == cus.Id){
                for(Offer__c offer : offList){
                    String repeat;
                    if(cus.No_of_visits__c<4){
                        repeat=String.valueOf(cus.No_of_visits__c);
                    }
                    else{
                        repeat='More than 4';
                    }
                    if(offer.RepeatingNo__c == repeat){
                        tckt.Offers__c=offer.Id;
                        tckt.Discount__c=offer.Discount__c;
                        tckt.Total_Amount__c=((Integer.valueOf(label.Adult_Ticket_Price)*tckt.Number_Of_Adult__c) + 
                            (Integer.valueOf(label.Child_Ticket_Price)*tckt.Number_Of_Child__c) +
                            (Integer.valueOf(label.Senior_Ticket_Price)*tckt.Number_Of_Senior__c))*(100-offer.Discount__c)/100;
                        
                        break;
                           
                    }
                }
            }
            //updatedTckt.add(tckt);
        }
      
        
    }
    /**if(updatedTckt.size()>0){
        insert updatedTckt;
    }**/
}