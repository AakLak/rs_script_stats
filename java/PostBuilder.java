package java;

/**
 * Created by: Niklas
 * Date: 06.03.2018
 * Alias: Dinh
 * Time: 12:36
 */

public class PostBuilder {

    private StringBuilder builder = new StringBuilder("{\"commit\":{ \"script_id\":\"\",\"user_id\":\"\",\"runtime\":,\"stats_attributes\":[]}}");

    PostBuilder(String script_id, String user_id, String runtime, Attribute... attributes) {
        for (Attribute attribute : attributes) {
            builder.insert(71, "," + attribute.toString());
        }
        builder.replace(71, 72, "");
        builder.insert(50, runtime);
        builder.insert(38, user_id);
        builder.insert(25, script_id);
    }

    @Override
    public String toString() {
        return builder.toString();
    }
}
