public class newCusReg {
    @AuraEnabled
    public static Customer__c insertCusRec(Customer__c cusToInsert){
        
        Database.SaveResult result= Database.insert(cusToInsert);
        if(result.isSuccess()){
            system.debug('inserted successully'+cusToInsert);
            return cusToInsert;
        }
        else{
            System.debug(''+result.getErrors()[0].getStatusCode()+' '+result.getErrors()[0].getMessage());
        }
        return null;
    }    

}