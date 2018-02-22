/**
 * Created by joshuastigall on 2017-11-22.
 */

trigger AALeadTrigger on Lead (before update) {
    for (Lead l : Trigger.new) {
        l.FirstName = 'Hello';
        l.LastName = 'World';
    }
}