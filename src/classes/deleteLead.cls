public class deleteLead 
{
    
    @InvocableMethod
    public static void LeadDelete(List<Id> LeadIds)
    {
        List<Lead> Leads =[select id from lead
                          where Status = 'Closed - converted'];
        delete Leads;
   }


}