/**
 * Created by RomanIvanov on 23.07.2022.
 */

public with sharing class CaseTriggerHandler {
    public static void handler(List<Case> cases, System.TriggerOperation triggerOperation) {
        switch on triggerOperation {
            when BEFORE_UPDATE {
                CaseService.updateSuccessMessageForCases(cases);
            }
        }
    }
}