public with sharing class AccountService {
    
    @AuraEnabled(cacheable = true)
    public static List<Account> getAllAccounts(){
        return [select id, name, phone from account];

    }
}
