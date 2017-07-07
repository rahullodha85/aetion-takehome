package runner.steps;

import com.jayway.restassured.RestAssured;
import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.hamcrest.Matchers;
import org.junit.Assert;

import java.util.ArrayList;
import java.util.HashMap;

import static helper.Util.*;
import static runner.common.Base.getAuthToken;

public class User {

    private Response response;

    @When("^a user is created with \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" and (\\d+)$")
    public void createUser(String email, String firstName, String lastName, int age) throws Throwable {
        response = RestAssured.given()
                .log().all()
                .header("content-type", "application/json")
                .header("X-Auth-Token", getAuthToken())
                .body(getUserRequestBody(email, firstName, lastName, age))
                .when()
                .post(getServiceUrl() + "/user");
    }

    @When("^a user is searched with id (\\d+)$")
    public void getUserById(int id) throws Throwable {
        response = RestAssured.given()
                .log().all()
                .header("X-Auth-Token", getAuthToken())
                .when()
                .get(getServiceUrl() + "/user/" + id);
    }

    @Then("^user response should be received containing \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" and (\\d+)$")
    public void validateCreateUser(String email, String firstName, String lastName, int age) throws Throwable {
        response.then()
                .log().ifValidationFails()
                .assertThat()
                .statusCode(200)
                .body("email", Matchers.equalTo(email))
                .body("first_name", Matchers.equalTo(firstName))
                .body("last_name", Matchers.equalTo(lastName))
                .body("age", Matchers.equalTo(age));
    }

    @Then("^user should get (\\d+) unauthorized response$")
    public void verifyInvalidAuthToken(int status) throws Throwable {
        response.then()
                .log().ifValidationFails()
                .assertThat()
                .statusCode(status);
    }

    @When("^a user with id (\\d+) is updated for field \"([^\"]*)\" and value \"([^\"]*)\"$")
    public void updateUser(int id, String attribute, String value) throws Throwable {
        getUserById(id);
        response = RestAssured.given()
                .log().all()
                .header("content-type", "application/json")
                .header("X-Auth-Token", getAuthToken())
                .body(getUserRequestBody(changeValues(attribute, value)))
                .put(getServiceUrl() + "/user/" + id);
    }

    @Then("^user response should be received containing \"([^\"]*)\" and value \"([^\"]*)\"$")
    public void validateUpdateUser(String attribute, String value) throws Throwable {
        if (attribute == "age" || attribute == "id") {
            response.then()
                    .log().ifValidationFails()
                    .assertThat()
                    .statusCode(200)
                    .body(attribute.toString(), Matchers.equalTo(Integer.parseInt(value)));
        } else {
            response.then()
                    .log().ifValidationFails()
                    .assertThat()
                    .statusCode(200)
                    .body(attribute.toString(), Matchers.equalTo(value));
        }
    }

    @When("^users are searched for age between (\\d+) and (\\d+)$")
    public void searchUsers(int startAge, int endAge) throws Throwable {
        response = RestAssured.given()
                .log().all()
                .log().all()
                .header("content-type", "application/json")
                .header("X-Auth-Token", getAuthToken())
                .body(getSearchBody(startAge, endAge))
                .post(getServiceUrl() + "/user/search");
    }

    @Then("^users with age between (\\d+) and (\\d+) should be received$")
    public void validateSearch(int startAge, int endAge) throws Throwable {
        response.then()
                .log().ifValidationFails()
                .assertThat()
                .statusCode(200);
        ArrayList<Integer> age = response.then().extract().path("age");
        age.forEach(a -> {
            Assert.assertTrue(a >= startAge);
            Assert.assertTrue(a <= endAge);
        });
    }

    /**
     * changes attribute to be updated with new value
     * @param attribute
     * @param value
     * @return
     */
    private HashMap changeValues(String attribute, String value) {
        HashMap<String, Object> map = response.then().extract().body().jsonPath().getJsonObject("");
        if (map.get(attribute) instanceof Integer) {
            map.put(attribute, Integer.parseInt(value));
        } else {
            map.put(attribute, value);
        }

        return map;
    }
}
