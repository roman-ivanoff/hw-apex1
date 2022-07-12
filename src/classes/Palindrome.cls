/**
 * Created by RomanIvanov on 12.07.2022.
 */

public with sharing class Palindrome {

    public Boolean isPalindrome(String toCheck) {
        return toCheck.equals(toCheck.reverse());
    }

    public Boolean isPalindromeInt(Integer toCheck) {
        Integer reversed = 0;
        Integer temp = toCheck;

        while (temp > 0) {
            Integer remainder = Math.mod(temp, 10);
            reversed += remainder;
            temp = temp / 10;
            if (temp != 0) {
                reversed = reversed * 10;
            }
        }

        return reversed == toCheck;
    }
}