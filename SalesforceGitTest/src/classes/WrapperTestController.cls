/**
 * Created by joshuastigall on 2017-11-24.
 * Original code found here: http://www.sfdcmonkey.com/2017/07/06/use-wrapper-class-lightning-component/
 */

public with sharing class WrapperTestController {
/**  create wrapper class object and set the wrapper class @AuraEnabled
     properties and return it to the Lightning component.
*/
    @AuraEnabled
    public static wrapperClass initMethod() {

        wrapperClass returnWrapperClass = new wrapperClass ();
        returnWrapperClass.lstContact =
            [SELECT firstName, lastName, Department, LeadSource
            FROM contact
            LIMIT 25];
        returnWrapperClass.contactCount = returnWrapperClass.lstContact.size();
        returnWrapperClass.headerMsg = 'Sample Header Message';
        return returnWrapperClass;
    }

// Wrapper or innerclass with @AuraEnabled {get, set} properties
    public class wrapperClass {
        @AuraEnabled public List<contact> lstContact{get; set;}
        @AuraEnabled public Integer contactCount{get; set;}
        @AuraEnabled public String headerMsg {get; set;}
    }
}