({
	
    
    fetchOffer: function(component){
           var customerEmailId = component.get("v.ticket.Customer_Email_Add__c");
        console.log('Customer ID:'+customerEmailId);
        var action1 = component.get("c.fetchOffer");
      
        
        action1.setParams({cusEmailId : customerEmailId});
        
        action1.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
         
                console.log('Offer for Cudtomer'+response.getReturnValue().Discount__c);
                component.set("v.offer",response.getReturnValue());
                 // component.set("v.Final_Price",1250);
                   //component.set("v.Discount_Price",10);
                component.set("v.isOpen", true);
                component.set("v.Final_Price",(component.get("v.original_Price")*(100-component.get("v.offer.Discount__c"))/100));
                component.set("v.ticket.Total_Amount__c",component.get("v.Final_Price"));
                component.set("v.ticket.Offers__c",component.get("v.offer.Id"));
                component.set("v.Discount_Price",(component.get("v.original_Price")-component.get("v.Final_Price")));
               // return repeatition;
                
            }
            else if(state === "ERROR"){
                var errors= response.getError();
                if(errors){
                    if (errors[0]&& errors[0].message){
                        console.log(" Error message: "+errors[0].message);
                    }
                    else{
                        console.log("Unknown error");
                    }
                }
              //  return 0;
            }
        });
        $A.enqueueAction(action1);
    },
    
    InsertTicket: function(component, event, helper){
        component.set("v.ticket.Payment_Status__c","Pending");
        component.set("v.ticket.Booking_Status__c","Confirmed");
        
        var tkt=component.get("v.ticket");
        
        var action = component.get("c.InsertTckt");
        
        action.setParams({tckt : tkt,
                          cusId : tkt.Customer__c});
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                console.log('Ticket Inserted');
                component.set("v.tcktInserted",'Congrats Your '+tkt.Total_Tickets__c+"ticket has been Booked");
            }
            else if(state === "ERROR"){
                var errors= response.getError();
                if(errors){
                    if (errors[0]&& errors[0].message){
                        console.log(" Error message: "+errors[0].message);
                    }
                    else{
                        console.log("Unknown error");
                    }
                    component.set("v.tcktInserted","Ticket Booking Failed");
                }
            }
        });
        $A.enqueueAction(action);
    }
     
})