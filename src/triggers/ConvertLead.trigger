trigger ConvertLead on Lead (before insert) {
    
    ConvertCustomer customer = new ConvertCustomer();
   customer.UpdateAndConvertContact(trigger.new);
    ConvertTicket ticket = new ConvertTicket();
    ticket.UpdateAndConvertTicket(trigger.new);
    
    for(Lead lead:trigger.new)
    {
        lead.Status = 'Closed - Converted';
    }
    
 }