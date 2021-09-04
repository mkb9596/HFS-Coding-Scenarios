public with sharing class contactController {
    public contactController() {

    }
    @AuraEnabled
    Public static List<Contact> showContacts()
    {
        List<Contact> contacts = [select Id, Name, Email from Contact];
        
        return (contacts);
    }

    @AuraEnabled(Cacheable=true)
    public static List<Contact> searchContacts(String namePattern) {
        
        String likeParam = '%' +searchParam+'%';
        String Query = '';
       
        if(searchParam != null){
           Query  = 'select id, name, email from Contact where Name like :searchString LIMIT 50 ';
        }else{
           Query  = 'select id, name, email from Contact LIMIT 50 '; 
        }

        List<Contact> contactList = Database.query(Query);
        return contactList;
    }



    
    
}
