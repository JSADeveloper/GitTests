/**
 * Created by joshuastigall on 2017-12-14.
 */

@isTest
private class AAAppleWatchTriggerTest {

    @isTest static void createOpportunity() {
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Class';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();

        insert opp;

    }
    
 }