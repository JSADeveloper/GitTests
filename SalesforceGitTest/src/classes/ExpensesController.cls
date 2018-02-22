/**
 * Created by joshuastigall on 2017-12-02.
 */


/* DON'T FORGET TO ADD THE CONTROLLER TO THE COMPONENT WITH
<aura:component controller="ExpensesController" >

 */

public with sharing class ExpensesController {

    //  STERN LECTURE ABOUT WHAT'S MISSING HERE COMING SOON

        @AuraEnabled
        public static List<Expense__c> getExpenses() {
            // Perform isAccessible() checking first, then
            return [SELECT Id, Name, Amount__c, Client__c, Date__c,
                    Reimbursed__c, CreatedDate
            FROM Expense__c];
        }

        @AuraEnabled
        // THE PARAMETER NAME 'expense' IN THE METHOD BELOW MUST BE USED IN THE expensesHelper.js setParams() method.
        public static Expense__c saveExpense(Expense__c expense) {
            // Perform isUpdatable() checking first, then
            upsert expense;
            return expense;
        }
    }