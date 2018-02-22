/**
 * Created by joshuastigall on 2017-12-19.
 */

trigger AssignLeadGrade on Lead (before insert, before update) {
    for (Lead myLead : Trigger.new) {

        // CHECKS TO MAKE SURE THERE IS A VALUE IN Score__c.
        // IF THERE IS A VALUE, THE OTHER IF STATEMENTS RUN
        // IF IT IS NULL, NOTHING RUNS

        if (myLead.Score__c != null) {

            if (myLead.Score__c == 100) {
                myLead.Grade__c = 'A+';

            } else if (myLead.Score__c >= 90) {
                myLead.Grade__c = 'A';

            } else if (myLead.Score__c >= 80) {
                myLead.Grade__c = 'B';

            } else {
                myLead.Grade__c = 'F';
                myLead.Status = 'Closed - Trash';
            }
        }
    }

}