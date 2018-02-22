/**
 * Created by joshuastigall on 2017-12-21.
 */

trigger SecretWords on Case (after insert, before update ) {

    // VARIABLE FOR SUBJECT OF CHILD CASE. GUARDS AGAINST CREATING MULTIPLE CHILD CASES
    String childCaseSubject = 'Warning: Parent Case may include excluded words';

    // ADD EXCLUDED WORDS TO A SET

    SET<String> excludedWords = new SET<String>(); // OUTSIDE OF TRIGGER LOOP TO PRESERVE ACROSS ITERATIONS
    excludedWords.add('SSN');
    excludedWords.add('Credit Card');
    excludedWords.add('Social Security');

    excludedWords.add('Passport');

    // ADD CASES WITH EXCLUDED WORDS TO A LIST
    List<Case> casesWithExcludedWords = new List<Case>();  // OUTSIDE OF TRIGGER LOOP TO PRESERVE ACROSS ITERATIONS


    for (Case myCase : Trigger.new) {

        //PROTECTS AGAINST INFINITE LOOP IN childCase.Description BELOW. WON'T CREATE MULTIPLE CASES WITH THE SAME SUBJECT.
        if (myCase.Subject != childCaseSubject) {


            // LOOP TO SEARCH FOR EXCLUDED WORDS.
            for (String searchWords : excludedWords) {  // TEMPORARILY ASSIGN EACH excludedWords TO searchWords.
                if (myCase.Description != null &&       // GUARDS AGAINST NULL POINTER
                    myCase.Description.containsIgnoreCase(searchWords)) { // SEARCHES THE DESCRIPTION ON CASE FOR WORDS IN SET. EVALUATES TO TRUE.
                    casesWithExcludedWords.add(myCase); // ADDS A CASE WITH searchWords TO THE casesWithExcludedWords LIST.
                    System.debug('Case ' + myCase.Id +
                                 ' includes excluded keyword ' +
                                 searchWords + '.'); //THIS WILL ONLY RETURN THE FIRST WORD IN THE SET, EVEN IF IT'S NOT FIRST IN THE DESCRIPTION
                    break;  // BREAKS LOOP IF A WORD IS FOUND. DON'T NEED TO KNOW IF ALL 4 EXIST TO CREATE A CASE.
                }
            }
        }
    }


    // CREATE CHILD CASE, SET PRIORITY, ETC.

    for (Case caseWithExcludedWords : casesWithExcludedWords) { // ASSIGN VARIABLE caseWithExcludedWords FROM casesWithExcludedWords LIST
        Case childCase          = new Case();
        childCase.Subject       = childCaseSubject;
        childCase.ParentId      = caseWithExcludedWords.Id;
        childCase.IsEscalated   = true;
        childCase.Description   = 'At least one of the following excluded words were found ' + excludedWords + '.';
        childCase.Priority      = 'High';


        insert childCase;

    }




}