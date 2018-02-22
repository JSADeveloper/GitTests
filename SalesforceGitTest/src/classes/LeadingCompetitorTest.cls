/**
 * Created by joshuastigall on 2017-12-23.
 */

@isTest
private class LeadingCompetitorTest {

    @isTest static void createOpp() {

        //CREATE NEW OPPORTUNITY
        Opportunity newOpp = new Opportunity();

        //ENTER REQUIRED FIELDS
        newOpp.Name                     = 'Test Class Test';
        newOpp.StageName                = 'Needs Analysis';
        newOpp.CloseDate                = Date.today();

        //ENTER VALUES IN COMPETITOR AND COMPETITOR PRICES
        newOpp.Competitor_1__c          = 'Amazon';
        newOpp.Competitor_1_Price__c    = 50000;
        newOpp.Competitor_2__c          = 'Salesforce';
        newOpp.Competitor_2_Price__c    = 25000;

        //INSERT THE OPP
        insert newOpp;
    }

 }