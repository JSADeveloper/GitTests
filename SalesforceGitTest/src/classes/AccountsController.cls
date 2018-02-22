/**
 * Created by joshuastigall on 2017-11-26.
 */

public with sharing class AccountsController {
    @AuraEnabled
    public static List<Account> getAccounts() {
        return [SELECT Id, name, industry, Type, NumberOfEmployees,TickerSymbol,Phone
        FROM Account ORDER BY createdDate ASC];
    }

}