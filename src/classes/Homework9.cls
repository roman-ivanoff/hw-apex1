/**
 * Created by RomanIvanov on 14.07.2022.
 */

public with sharing class Homework9 {
    public static Set<Integer> getUniqueValues(List<Integer> myList) {
        return new Set<Integer>(myList);
    }

    public static Contact getContactByName(String name) {
        List<Contact> contacts = [SELECT Id, Name, AccountId, Email, Phone FROM Contact WHERE Name = :name];
        return  contacts[0];
    }

    public static Opportunity getOpportunityWithTheBiggestAmount() {
        List<Opportunity> opportunities = [SELECT Id, Name, Amount FROM Opportunity ORDER BY Amount DESC LIMIT 1];
        return opportunities[0];
    }

    public static List<Integer> getListFromNumber(Integer num) {
        Integer temp = num;
        List<Integer> result = new List<Integer>();
        List<Integer> reversedResult = new List<Integer>();

        while (temp > 0) {
            Integer remainder = Math.mod(temp, 10);
            result.add(remainder);
            temp = temp / 10;
        }

        for(Integer i = result.size() - 1; i >= 0; i--){
            reversedResult.add(result[i]);
        }

        return reversedResult;
    }
}