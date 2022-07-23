/**
 * Created by RomanIvanov on 23.07.2022.
 */

public with sharing class CaseService {
    public static void updateSuccessMessageForCases(List<Case> cases) {
        Set<Id> ids = new Set<Id>();
        for (Case cas : cases) {
            ids.add(cas.Country__c);
        }

        Map<Id, Country__c> countries = CountrySelector.getByCaseIds(ids);

        for (Case cas : cases) {
            if (cas.Status == 'Closed') {
                cas.SuccessMessage__c = countries.get(cas.Country__c).SuccessMessage__c;
            }
        }

        updateClosedCasesForCountries(countries.values());
    }

    public static void updateClosedCasesForCountries(List<Country__c> countries) {
        for (Country__c country : countries) {
            country.ClosedCases__c += 1;
        }

        update countries;
    }
}