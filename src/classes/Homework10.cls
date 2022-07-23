/**
 * Created by RomanIvanov on 21.07.2022.
 */

public with sharing class Homework10 {
    public static List<Opportunity> updateOpportunityStage(String stageNew, String stageOld) {
        Set<String> stages = new Set<String>();

        List<Schema.PicklistEntry> opportunityStages = Opportunity.StageName.getDescribe().getPicklistValues();

        for( Schema.PicklistEntry opportunityStage : opportunityStages) {
            stages.add(opportunityStage.getValue());
        }

        if (!stages.contains(stageOld) || !stages.contains(stageNew)) {
            return new List<Opportunity>();
        }

        List<Opportunity> opportunities = [SELECT Id, Name, StageName FROM Opportunity WHERE StageName = :stageOld];

        for (Opportunity opportunity: opportunities) {
            opportunity.StageName = stageNew;
        }

        update opportunities;

        Set<Id> oppIds = (new Map<Id, Opportunity>(opportunities).keySet());

        return [SELECT Id, Name, StageName FROM Opportunity WHERE Id IN :oppIds];
    }
}