/**
 * Created by joshuastigall on 2017-12-23.
*/

@isTest
private class SecretWordsTest {

    @isTest static void test_method_one() {
        Case newCase        = new Case();

        //ENTER CASE DESCRIPTION WITH EXCLUDED WORDS

        newCase.Subject     = 'New Case';
        newCase.Description = 'Credit Card. SSN.';

        //INSERT THE CASE

        insert newCase;
    }


 }