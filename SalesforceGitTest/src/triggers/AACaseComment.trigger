/**
 * Created by joshuastigall on 2017-11-23.
 */

trigger AACaseComment on Case (after insert) {
    for(Case myCase : Trigger.new) {
        CaseComment cc = new CaseComment();
        cc.CommentBody = 'Hey Josh, Case received by agent.';
        cc.ParentId = myCase.Id;
        insert cc;
    }

}