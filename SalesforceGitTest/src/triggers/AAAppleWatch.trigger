/**
 * Created by joshuastigall on 2017-11-22.
 *
 * BASICALLY WHENEVER AN OPPORTUNITY IS CREATED, A TASK IS CREATED
 * THIS TASK IS ASSOCIATED WITH A PARTICULAR OPPORTUNITY
 * BY FINAL LINE t.WhatId = opp.Id;
 */

trigger AAAppleWatch on Opportunity (after insert) {
    for(Opportunity opp : Trigger.new) {
        Task t = new Task();
        t.Subject     = 'Apple Watch Promo';
        t.Description = 'Send them one ASAP!';
        t.Priority    = 'High';
        t.WhatId      = opp.Id; //RELATES IT TO THE OPPORTUNITY
        insert t;
    }

}