/**
 * Created by joshuastigall on 2017-12-27.
 */

trigger PicklistCountTest on Account (before insert, before update) {

    for (Account newPick : Trigger.new) {
        if (String.isNotBlank(newPick.Test_Picklist__c)) {
            List<String> PickCount = newPick.Test_Picklist__c.split(';');
            newPick.Picklist_Count__c = PickCount.size();
        } else {
            newPick.Picklist_Count__c = 0;
        }

    }

}


/*
BELOW IS DAVID LIU'S SOLUTION. I COPIED (AND MODIFIED) THE CODE ABOVE FROM GOOGLE

trigger MultiSelectCounter on Account (before insert, before update) {

    for (Account acc : Trigger.new) {
        if (acc.MSP__c != null) {

            //UPDATE COUNTER IF MSP FIELD AS ITEMS
            Integer count = acc.MSP__c.countMatches(';') +1;
            acc.Counter__c = count;
            System.debug('Number of items found for ' + acc.Name + ': ' + count);

        } else {

            //RESET THE COUNTER

            acc.Counter__c = 0;
            System.debug('No items found for ' + acc.Name);
        }
    }
}
*/