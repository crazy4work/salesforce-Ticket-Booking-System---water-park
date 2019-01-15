({
	
	getTickets : function(component, event,helper) {
        //call apex class to get list of customers 
        //with the matching email
        
        var action = component.get("c.fetchTicket");
        //enabling server side caching
        action.setStorable();
        action.setParams({ ticketId : component.get("v.TicketId") });
        
        // Create a callback that is executed after
        //the server-side action returns
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var MatchingTicList = response.getReturnValue();
                
                console.log('Matching Ticket Found :: '+JSON.stringify(MatchingTicList));
                component.set("v.TicketList",MatchingTicList);
                if(component.get("v.TicketList").length > 0){
                         component.set("v.isOpen", true);
                   // component.set("v.getNewCustomerDetail",false);
                   
                }
                else{
                    //component.set("v.getNewCustomerDetail",true);
                    component.set("v.showCTicketDetail",false);
                }
                    
            }
            else if(state === "ERROR"){
               var errors= response.getError();
                if(errors){
                    if (errors[0]&& errors[0].message){
                        console.log("getTickets Error message: "+errors[0].message);
                    }
                    else{
                        console.log("getTickets Unknown error");
                    }
                }
            }
            //component.set("v.isOpen", false);
            
        });
        $A.enqueueAction(action);

        
		
	},
    
    updateTicket: function(component, event, helper){
        var tkt = component.get("v.TicketList")[0];
        console.log("helper updateTicket tkt::"+JSON.stringify(tkt));
        var action=component.get("c.updateTicket");
        action.setParams({tckt : tkt});
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                console.log("In helper ticket successfully updated");
            }
            else if(state === "ERROR"){
                var errors= response.getError();
                if(errors){
                    if (errors[0]&& errors[0].message){
                        console.log("updateTicket Error message: "+errors[0].message);
                    }
                    else{
                        console.log("updateTicket Unknown error");
                    }
                }
            }
            component.set("v.isOpen", false);
        });
        $A.enqueueAction(action);
    }
})