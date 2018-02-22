/**
 * Created by joshuastigall on 2017-12-23.
 */

trigger DisqualifyLeads on Lead (before insert) {

    String disqualifyName = 'test';

    for (Lead disqualify : Trigger.new) {

        if (disqualify.FirstName.equalsIgnoreCase(disqualifyName) || disqualify.LastName.equalsIgnoreCase(disqualifyName)) {
            disqualify.Status = 'Disqualified';

//        } else if (disqualify.FirstName.containsIgnoreCase('david') && disqualify.LastName.containsIgnoreCase('Liu')) {
//            disqualify.Status = 'Disqualified';
        }

    }

}

/*
Goals:

1. Change the status of a lead to Disqualified if it has 'test' in the name.
2. Ignore leads without 'test' in the name.
3. 'Test' could be capitalized (or not) in any way.
4. Valid names can contain 'test,' like 'contest.'
5. Fields can be null
6. 100% Code coverage in tests.

LIU'S SOLUTION. I LIKE THE USE OF THE LIST

trigger NoTestLeads on Lead (before insert, before update) {

    String testValue = 'test';

    List<Lead> leadToDisqualify = new List<Lead>();

    for (Lead myLead : Trigger.new) {

        System.debug('Checking to see if ' + myLead.FirstName + ' ' + myLead.LastName + ' contains ' + testValue);

        if(myLead.FirstName != null && myLead.FirstName.equalsIgnoreCase(testValue))
            || myLead.LastName.equalsIgnoreCase(testValue))) {

            System.debug('myLead.FirstName + ' ' + myLead.LastName + ' will be disqualified!');
            leadToDisqualify.add(myLead);
        }
     }

     for (Lead disqualifyLead : leadToDisqualify) {
        disqualifyLead.Status = 'Disqualified';
       }
     }

 */