/**
 * Created by RomanIvanov on 12.07.2022.
 */

public with sharing class Fighter {

    public String name;
    public Integer health;
    public Integer damagePerAttack;

    public Fighter(String name, Integer health, Integer damagePerAttack) {
        this.name = name;

        if (health > 0) {
            this.health = health;
        } else {
            this.health = 1;
        }

        if (damagePerAttack > 0) {
            this.damagePerAttack = damagePerAttack;
        } else {
            this.damagePerAttack = 1;
        }
    }

    public static String fight(Fighter firstFighter, Fighter secondFighter) {
        Boolean isFinish = false;
        String winner = '';

        while (isFinish != true) {
            secondFighter.health -= firstFighter.damagePerAttack;
            if (secondFighter.health <= 0) {
                winner = firstFighter.name;
                isFinish = true;
                break;
            }

            firstFighter.health -= secondFighter.damagePerAttack;
            if (firstFighter.health <= 0) {
                winner = secondFighter.name;
                isFinish = true;
                break;
            }
        }

        return winner;
    }
}