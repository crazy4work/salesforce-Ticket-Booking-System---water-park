trigger UpdateTicket on Ticket__c (before insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            //Integer totalPrice=calculateTotalPrice(Trigger.new);
        }
    }

}