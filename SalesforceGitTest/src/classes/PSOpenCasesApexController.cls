/**
 * Created by joshuastigall on 2017-11-20.
 */

public with sharing class PSOpenCasesApexController {
    @AuraEnabled
    public static List<Case> getCasesDB() {
        /* The return statement below was original in
        the PluralSight Sara Morgan-Nettles course on Lightning components,
        section 04. In 0405 she changes it to what follows this comment
        for security reasons.
        return [SELECT Id, Type, Status, Reason, Origin, IsClosed, OwnerId
         */
        String [] caseFields = new String [] {'Id', 'OwnerId',
        'Type', 'Status',
        'Priority', 'IsClosed',
        'Reason', 'Origin' };

        Map<String,Schema.SObjectField> caseMap =
                Schema.SObjectType.Case.fields.getMap();
        for (String field : caseFields ) {
            if (!caseMap.get(field).getDescribe().isAccessible()) {
                System.debug('This field was not accessible: ' + caseMap.get(field));
                return null;
            }
        }
        return [SELECT Id FROM Case
        WHERE IsClosed = false
        AND OwnerId =: UserInfo.getUserId()];
    }

}