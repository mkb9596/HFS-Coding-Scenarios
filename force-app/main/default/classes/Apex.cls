public with sharing class Apex {
    public Apex() {

        Account a = new Account();
        a.Name = 'hfs';
        a.Website = 'www.bgmi.com';
        changeWebsite(a);
        System.debug('Website - '+a.Website);

    }
    

    public Apex(Account b) {

        
    
        b = new Account();
        b.Website = 'www.salesforce.com';
    } 
}
