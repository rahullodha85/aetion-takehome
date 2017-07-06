package helper;

import com.google.gson.JsonObject;

public class Util {
    public static String getLoginBody(String username, String password) {
        JsonObject json = new JsonObject();
        json.addProperty("username", username);
        json.addProperty("password", password);
        return json.toString();
    }

    public static String getServiceUrl() {
        return "http://qa-takehome.dev.aetion.com:4440";
    }
}
