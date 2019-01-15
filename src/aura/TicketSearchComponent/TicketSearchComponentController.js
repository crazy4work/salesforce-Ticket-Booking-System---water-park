({
	searchTicket : function(component, event, helper) {
		
      //  component.set("v.TicketList",
        //              [{label: 'Payment Status', fieldName: 'Payment_Status__c', type: 'Picklist'},
          //             {label: 'Booking Status', fieldName: 'Booking_Status__c', type: 'Picklist'},
            //           {label: 'Number Of Child', fieldName: 'Number_Of_Child__c', type: 'Number'},
              //           {label: 'Number Of Adult', fieldName: 'Number_Of_Adult__c', type: 'Number'},
                //         {label: 'Number Of Senior', fieldName: 'Number_Of_Senior__c', type: 'Number'},
                  //     {label: 'Total Amount', fieldName: 'Total_Amount__c', type: 'Currency'},
                    //  {label: 'Total Tickets', fieldName: 'Total_Tickets__c', type: 'Currency'}]);
        helper.getTickets(component, event, helper);
        
        //helper.matchingCusFoundOrNot(component, event, helper);
	},
      paymentDone: function(component, event, helper) {
      //component.set("v.isOpen", true);
      component.set("v.TicketList[0].Payment_Status__c","Successful");
      helper.updateTicket(component, event, helper);

   },
 
   closeModel: function(component, event, helper) {
      component.set("v.isOpen", false);

   }
})