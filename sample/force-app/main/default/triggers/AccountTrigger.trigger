trigger AccountTrigger on Account (before insert, after insert, before delete) {
    
    List<Opportunity> addNewOpportunity = new List<Opportunity>();
  
    // check if opportunuty does not exist create one
    if(Trigger.isInsert) {
          //update the  name to test
        if(Trigger.isBefore) {
             for(Account acct : Trigger.new) {
        acct.name = 'test';
            }

        }
        
        // after update
        if(Trigger.isAfter) {
            
            // map of account that has opportunity
            Map<Id, Account> acctwithOpp = new Map<Id, Account> ([select id, (select id from opportunities) from account where Id in :Trigger.New ]);
            
            for(Account acct: Trigger.New) {
                // check if accont has oportunity
                if(acctWithOpp.get(acct.Id).opportunities.size() == 0) {
                        addNewOpportunity.add( new Opportunity(name ='via trigger', closeDate = System.today().addMonths(1), StageName ='Prospecting', accountID = acct.Id));
                    // create new opportunity 
                }
            }
            
            // insert new oportunity
            insert addNewOpportunity;
            
        }
        
        // delete check
        if(Trigger.isDelete) {
            if(Trigger.isBefore) {
                // check if the  acccont that is delete has opportunity
                for(Account acct : [select ID from account where id IN (select accountID from opportunity) and  ID in :Trigger.old]) {
                    Trigger.oldMap.get(acct.ID).addError(' cannot delete as it has opportunity');
                    
                }
            }
   
        }
   
    }
    
}