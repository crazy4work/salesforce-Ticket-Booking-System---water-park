({
    createRecord : function(component, event, helper) {
        var validCustomer = component.find('CustomerField').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;}, 
                                                                true);
        // If we pass error checking, do some real work
        if(validCustomer){
            // Create the new expense
            //var newCustomer = component.get("v.simpleNewCustomer");
            //console.log("Create customer: " + JSON.stringify(newCustomer));
            helper.createCustomer(component, event, helper);
            }
    }
})