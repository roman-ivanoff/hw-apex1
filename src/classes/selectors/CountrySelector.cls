/**
 * Created by RomanIvanov on 23.07.2022.
 */

public with sharing class CountrySelector {
    public static Map<Id, Country__c> getByCaseIds(Set<Id> caseIds) {
        return new Map<Id, Country__c>([SELECT Id, SuccessMessage__c, ClosedCases__c FROM Country__c WHERE Id IN :caseIds]);
    }
}