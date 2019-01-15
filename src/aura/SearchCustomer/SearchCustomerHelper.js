({
	getCusList : function(component, event,helper) {
        //call apex class to get list of customers 
        //with the matching email
        
        var action = component.get("c.getMatchingCus");
        //enabling server side caching
        action.setStorable();
        action.setParams({ Email : component.get("v.Email") });
        
        // Create a callback that is executed after
        //the server-side action returns
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var MatchingCusList = response.getReturnValue();
                
                console.log('Matching Customer Found :: '+JSON.stringify(MatchingCusList));
                component.set("v.Customer",MatchingCusList);
                if(component.get("v.Customer").length > 0){
                    component.set("v.showCustomersDetail",true);
                    component.set("v.getNewCustomerDetail",false);
                    this.fireCstomerNameEmail(component, event,helper);
                }
                else{
                    component.set("v.getNewCustomerDetail",true);
                    component.set("v.showCustomersDetail",false);
                }
                    
            }
            else if(state === "ERROR"){
               var errors= response.getError();
                if(errors){
                    if (errors[0]&& errors[0].message){
                        console.log("Error message: "+errors[0].message);
                    }
                    else{
                        console.log("Unknown error");
                    }
                }
            }
            
        });
        $A.enqueueAction(action);

        
		
	},
    
    fireCstomerNameEmail : function(component, event,helper){
        var appEvent = $A.get("e.c:CstomerNameEmail");
        appEvent.setParams({"CusId" : component.get("v.Customer[0].Id"),
                           "CustEmail" : component.get("v.Customer[0].Customer_Email__c")});
        appEvent.fire();
        console.log('event fired');
                           
    }
   
})