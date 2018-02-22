/**
 * Created by joshuastigall on 2017-11-23.
 */

trigger DedupeLead on Account (after insert) {
    for (Account dd : Trigger.new) {
        Case c = new Case();
        c.Subject = 'Dedupe this account.';
        c.OwnerId = '0051I000000PMFi';
        c.AccountId = dd.Id;
        c.Priority = 'ThermoNuclear!';
        insert c;
    }

}