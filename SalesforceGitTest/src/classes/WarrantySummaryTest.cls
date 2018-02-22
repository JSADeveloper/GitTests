/**
 * Created by joshuastigall on 2017-12-15.
 */

@isTest
private class WarrantySummaryTest {

    @isTest static void createCase() {
        Case testCase = new Case();

        testCase.Product_Purchase_Date__c           = Date.today();
        testCase.Product_Total_Warranty_Days__c     = 10;
        testCase.Product_Has_Extended_Warranty__c   = true;

        insert testCase;


    }


 }

// MY FIRST TRY BELOW

//Case testCase                               = new Case();
//testCase.Status                             = 'New';
//testCase.Origin                             = 'Phone';
//          THIS LINE IS THE ONE THAT KILLED IT. WAS PUTTING THE DATE INCORRECTLY.
//        testCase.Product_Purchase_Date__c           = 2012-12-12;
//        testCase.Product_Total_Warranty_Days__c     = 3;
//
//insert testCase;