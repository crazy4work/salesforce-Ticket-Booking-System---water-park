({
	createCustomer : function(component, event, helper) {
        var action = component.get("c.insertCusRec");
        var newCustomer = component.get("v.simpleNewCustomer");
        console.log('entered record:::'+JSON.stringify(newCustomer));
        action.setParams({"cusToInsert" : newCustomer});
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state){
                var insertedCus = response.getReturnValue();
                if(insertedCus!=null){
                    //set cusid and email in the event
                    this.fireCstomerNameEmail(component, event,helper,insertedCus)
                    //set message field in the component as successfull
                    document.getElementById("register-form").style.display="none";
                  
                   component.set("v.insertionstate",insertedCus.Name+" inserted");
                }
                else{
                    component.set("v.insertionstate"," insertion failed");
                }
            }
        });
        
        $A.enqueueAction(action);
		
	},
    
    fireCstomerNameEmail : function(component, event,helper,insertedCus){
        var appEvent = $A.get("e.c:CstomerNameEmail");
        appEvent.setParams({"CusId" : insertedCus.Id,
                           "CustEmail" : insertedCus.Customer_Email__c});
        appEvent.fire();
        console.log('event fired');
                           
    }
})