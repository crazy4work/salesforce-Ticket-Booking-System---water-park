({
   openModel: function(component, event, helper) {
      
       //calculating total
       var total=parseInt(component.get("v.ticket.Number_Of_Child__c"))+
           parseInt(component.get("v.ticket.Number_Of_Adult__c"))+
           parseInt(component.get("v.ticket.Number_Of_Senior__c"));
       	console.log('In Controller openModel:::'+total);
       	component.set("v.total",total);
       	component.set("v.ticket.Total_Tickets__c",total);
        component.set("v.original_Price",(
                     (parseInt($A.get("$Label.c.Child_Ticket_Price"))*component.get("v.ticket.Number_Of_Child__c"))+
                     (parseInt($A.get("$Label.c.Adult_Ticket_Price"))*component.get("v.ticket.Number_Of_Adult__c"))+
                     (parseInt($A.get("$Label.c.Senior_Ticket_Price"))*component.get("v.ticket.Number_Of_Senior__c")))
                     );
       //retrieve email and cus id parameter from event
       //helper.handleCstomerNameEmail(component, event, helper);
       //fetch offer according to customer's number of visit
       helper.fetchOffer(component);
       
       //set component attribute original_Price, Final_Price, Discount_Price
       //accesssng custom label
     
       console.log("Ticket Original Price::"+component.get("v.original_Price"));
      

   },
 
   closeModel: function(component, event, helper) {
      component.set("v.isOpen", false);

   },
    
    BookTicket: function(component, event, helper) {
      component.set("v.isOpen", false);
      helper.InsertTicket(component, event, helper);

   },
    
    handleCstomerNameEmail: function(component, event, helper){
        console.log('event.getParam("CusId")'+event.getParam("CusId"));
        component.set("v.ticket.Customer__c", event.getParam("CusId"));
        console.log('event.getParam("CustEmail")'+event.getParam("CustEmail"));
        component.set("v.ticket.Customer_Email_Add__c", event.getParam("CustEmail"));
    }
    
    
   
})