package java;

/**
 * Created by: Niklas
 * Date: 06.03.2018
 * Alias: Dinh
 * Time: 12:07
 */

public class Attribute {

    private String task;
    private int amount;

    Attribute(String task, int amount) {
        this.amount = amount;
        this.task = task;
    }

    @Override
    public String toString() {
        return "{\"task\":\"" + task + "\",\"amount\":" + amount + "}";
    }
}
