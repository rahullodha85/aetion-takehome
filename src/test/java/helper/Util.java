package helper;

import com.google.gson.JsonObject;

import java.util.HashMap;

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

    public static String getUserRequestBody(String email, String firstName, String lastName, int age) {
        return getUserRequestBody(-1, email, firstName, lastName, age);
    }

    public static String getUserRequestBody(int id, String email, String firstName, String lastName, int age) {
        JsonObject json = new JsonObject();
        if(id > 0) {
            json.addProperty("id", id);
        }
        json.addProperty("email", email);
        json.addProperty("first_name", firstName);
        json.addProperty("last_name", lastName);
        json.addProperty("age", age);

        return json.toString();
    }

    public static String getUserRequestBody(HashMap<String, Object> map) {
        JsonObject json = new JsonObject();
        for (String key:map.keySet()) {
            if(map.get(key) instanceof Integer)
                json.addProperty(key, (Number)map.get(key));
            else
                json.addProperty(key,map.get(key).toString());
        }

        return json.toString();
    }

    public static String getSearchBody(int startAge,int endAge) {
        JsonObject json = new JsonObject();
        json.addProperty("start_age", startAge);
        json.addProperty("end_age", endAge);

        return json.toString();
    }
}
