package java;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;

/**
 * Created by: Niklas
 * Date: 06.03.2018
 * Alias: Dinh
 * Time: 12:07
 */

public class PostUtility implements Runnable {


    private final String ENDPOINT = "http://pure-woodland-47666.herokuapp.com/api/v1/commits";

    private PostBuilder post;

    public PostUtility(String script_id, String user_id, String runtime, Attribute... attributes) throws NumberFormatException {
        if (!runtime.matches("([0-9]*\\.[0-9]+|[0-9]+)")) {
            throw new NumberFormatException(runtime + " is not a valid floating point number");
        }
        post = new PostBuilder(script_id, user_id, runtime, attributes);
    }


    @Override
    public void run() {
        FormDataBuilder builder = new FormDataBuilder(ENDPOINT).getBuilder().append("user_email", "mail").append("user_token", "token").get();
        URLConnection connection;
        try {
            connection = new URL(builder.toString()).openConnection();
            connection.setDoOutput(true);

            DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream());
            outputStream.writeBytes(post.toString());
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
