({
	searchCustomer : function(component, event, helper) {
		
        component.set("v.Customer_col",
                      [{label: 'Customer Name', fieldName: 'Name', type: 'text'},
                       {label: 'Email', fieldName: 'Customer_Email__c', type: 'text'},
                       {label: 'Phone', fieldName: 'Customer_Phone__c', type: 'text'},
                       {label: 'Address', fieldName: 'Customer_Address__c', type: 'text'}]);
        helper.getCusList(component, event, helper);
        
        //helper.matchingCusFoundOrNot(component, event, helper);
	},
    newCustomer:function(component,event,helper)
    {
        document.getElementById("registeration").style.display="block";
        document.getElementById("reg-false").style.display="none";
    }
    
    /**newCustomer : function(component, event, helper){
        var evt = $A.get("e.c:navigateToRegNewCusComponent");
        console.log("Navigate to 'RegisterNewCustomer' "+evt);
        evt.setParams({
            "navigate" : "true"});
        evt.fire();
        console.log('Navigated');
    }**/
    
    
})