/**
 * Created by RomanIvanov on 23.07.2022.
 */

trigger CaseTrigger on Case (before update) {
    CaseTriggerHandler.handler(Trigger.new, Trigger.operationType);
}