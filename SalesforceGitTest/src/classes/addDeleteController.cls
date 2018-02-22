/**
 * Created by joshuastigall on 2017-11-27.
 */

public with sharing class addDeleteController {
    @AuraEnabled
    public static void saveContacts(List<Contact> ListContact){
        Insert ListContact;
    }
}