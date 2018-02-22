/**
 * Created by joshuastigall on 2017-12-04.

 DON'T FORGET TO ADD THE CONTROLLER TO THE COMPONENT WITH
 <aura:component controller="CampingListController" >

 */

public with sharing class CampingListController {
    @AuraEnabled
    public static List<Camping_Item__c> getItems() {
        return [SELECT Name,
                Packed__c,
                Price__c, Quantity__c
        FROM Camping_Item__c];
    }

    public static Camping_Item__c saveItem(Camping_Item__c campingItem) {
        upsert campingItem;
        return campingItem;

    }


}