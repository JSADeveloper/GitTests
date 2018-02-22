//PREVIOUS VERSION.
// @AuraEnabled
//public static List<Race__c> getRacesDB() {
//    return [SELECT Id, Name, DateTime__c, Location__c,
//            Attended__c, Type__c, Results__c FROM Race__c];
//}

//NEW VERSION IS UPDATED FOR PAGINATOR

public with sharing class ListRacesController {

    @AuraEnabled
    public static PageResult getRacesDB(Decimal pageSize, Decimal pageNumber) {
        Integer pSize = (Integer)pageSize;
        Integer offset = ((Integer)pageNumber - 1) * pSize;
        Integer totalRows = 0;

        PageResult res = new PageResult();
        res.pageSize = pSize;
        res.page = (Integer) pageNumber;

        res.races = [ SELECT Id,
                            Name,
                            DateTime__c,
                            Location__c,
                            Attended__c,
                            Type__c,
                            Results__c
                        FROM Race__c
                        ORDER BY DateTime__c desc
                        LIMIT :pSize OFFSET :offset ];

        res.total = [SELECT Count()
                        FROM Race__c];

        return res;
    }

    public class PageResult {
        @AuraEnabled
        public Integer pageSize { get;set; }

        @AuraEnabled
        public Integer page { get;set; }

        @AuraEnabled
        public Integer total { get;set; }

        @AuraEnabled
        public List<Race__c> races { get;set; } 
    }

}