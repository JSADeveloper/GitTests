/**
 * Created by joshuastigall on 2017-12-14.
 */
@isTest
private class AALeadTriggerTest {

    @isTest static void updateLead() {
        Lead myLead = new Lead();
        myLead.FirstName = 'Tyler';
        myLead.LastName = 'Stigall';
        myLead.Company = 'Just Solutions';
        insert myLead;

        myLead.Company = 'JSA';
        update myLead;
    }

 }