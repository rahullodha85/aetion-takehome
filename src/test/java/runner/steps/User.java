package runner.steps;

import com.jayway.restassured.RestAssured;
import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.hamcrest.Matchers;

import static helper.Util.getServiceUrl;
import static helper.Util.getUserRequestBody;
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
                .post(getServiceUrl() + "/user" );
    }

    @Then("^create user response should be received containing \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\" and (\\d+)$")
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
}
