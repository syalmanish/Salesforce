public
with sharing class OpportunityService {

    @AuraEnabled(cacheable = true)
public
  static List<opportunity> getALlOpp() {
      return [select id, name,StageName from opportunity]; 
  }
}