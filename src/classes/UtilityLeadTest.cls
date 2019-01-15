@isTest
public class UtilityLeadTest {
     public static List<Customer__c> createLeadsEmail(Integer numOfLeads) {
        List<Lead> leads = new List<Lead>();
        List<Customer__c> custom = new List<Customer__c>();
        for(Integer i=0;i<numOfLeads;i++) {
       
            Lead a = new Lead(FirstName='TestLeadFirstName' + i, LastName='TestLeadLastName'+i , Company='TestLeadCompany'+i,
                              Status='Open - Not Contacted' , Gender__c ='male',Phone='897897897' , Email ='TestLeadEmail'+i+'@'+'gmail.com' );
            Customer__c cus = new Customer__c(Name=a.FirstName+a.LastName, Customer_Email__c = a.Email , Customer_Gender__c=a.Gender__c , Customer_Phone__c = a.Phone);
            leads.add(a);
            custom.add(cus);
    
         }
       
       
          insert leads;
       // return leads;
       return custom; 
     }
     public static List<Customer__c> createLeadsSameEmail(Integer numOfLeads)
     {
           List<Lead> leads1 = new List<Lead>();
        List<Customer__c> custom1 = new List<Customer__c>();
         for(Integer i=0;i<numOfLeads;i++) {
             Lead a = new Lead(FirstName='TestLeadFirstName' + i, LastName='TestLeadLastName'+i , Company='TestLeadCompany'+i, 
                              Status='Open - Not Contacted' , Gender__c ='male',Phone='897897897' , Email ='TestLeadEmail'+'@'+'gmail.com' );
         
              Customer__c cus = new Customer__c(Name=a.FirstName+a.LastName, Customer_Email__c = a.Email , Customer_Gender__c=a.Gender__c , Customer_Phone__c = a.Phone);
             leads1.add(a);
             custom1.add(cus);
             
         }
           insert leads1;
         return custom1; 
     }
}