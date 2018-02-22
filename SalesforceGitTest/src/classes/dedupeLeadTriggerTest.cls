/**
 * Created by joshuastigall on 2017-12-14.
 */

@isTest
private class dedupeLeadTriggerTest {

    @isTest static void createAccount() {
        Account acc = new Account();

        acc.Name = 'Josh\'s Account';

        insert acc;

    }


 }