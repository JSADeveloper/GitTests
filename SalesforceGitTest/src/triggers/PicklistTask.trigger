/**
 * Created by joshuastigall on 2017-12-27.
 *
 * Tasks:
 *      1. Task created for every item in multi-select picklist field
 *      2. Each task's Subject is the item value (i.e., name of picklist value)
 *      3. Attach the task to the Account (need Account Id)
 *      4. Don't create an account if no items are selected (if ... != null)
 */

trigger PicklistTask on Account (after insert, after update) {

    for (Account acc : Trigger.new) {
        if (acc.Test_Picklist__c != null) {

            // LIST OF SELECTED ITEMS
            List<String> selectedItems = new List<String>();
            selectedItems = acc.Test_Picklist__c.split(';');
            System.debug('Items selected: ' + selectedItems);

            // CREATE TASK FOR EACH SELECTED ITEM
            List<Task> newTask = new List<Task>();
            for (String item : selectedItems) {
                System.debug('Creating a new task for item: ' + item);
                Task myTask = new Task();
                myTask.Subject = 'Make a task for ' + item +'\'s account';
                myTask.WhatId = acc.Id;
                newTask.add(myTask);
            }
            insert newTask;
        }
    }
}