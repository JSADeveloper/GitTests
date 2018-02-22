/**
 * Created by joshuastigall on 2018-02-06.
 *
 * Original Query:
 * public with sharing class inputFieldTestController {
    @AuraEnabled
    public static Contact getContact() {
        return [SELECT Id, FirstName, LastName FROM Contact LIMIT 1];
    }
}

The issue is that the code above is returning the first contact in the database. (I think. At any rate, it is returning the incorrect contact). I want to return the contact in the database that corresponds with the record page from which the quick action is being triggered.
 */

//public with sharing class inputFieldTestController {
//    @AuraEnabled
//    public static Contact getContact(Id contactId) {
//        try {
//            Contact contact = [SELECT Id, FirstName, LastName FROM Contact WHERE Id = :contactId];
//            Contact conID = contact.Id;
//            return conID;
//        } catch (Exception ex) {
//            return '{"error": " ' + ex.getMessage() + ' "}';
//        }
//
//
//
//    }
//}

public with sharing class inputFieldTestController {
    @AuraEnabled
    public static Contact getContact(Id contactId) {
        return [SELECT Id, FirstName, LastName
        FROM Contact WHERE Id = :contactId];
    }
}