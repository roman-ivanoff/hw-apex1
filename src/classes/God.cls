/**
 * Created by RomanIvanov on 08.07.2022.
 */

public with sharing class God {
    public Man createMan(String name) {
        return new Man(name);
    }

    public Woman createWoman(String name) {
        return new Woman(name);
    }
}