package runner.steps;

import com.jayway.restassured.RestAssured;
import com.jayway.restassured.response.Response;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

import static helper.Util.getLoginBody;
import static helper.Util.getServiceUrl;

public class Login {

    private Response response;

    @When("^user login with valid credentials \"([^\"]*)\" and \"([^\"]*)\"$")
    public void login(String username, String password) throws Throwable {
        response = RestAssured
                .given()
                    .log().all()
                    .header("content-type", "application/json")
                    .body(getLoginBody(username, password))
                .when()
                    .post(getServiceUrl() + "/login");
    }

    @Then("^user should receive a valid login response with authentication token$")
    public void validateLogin() throws Throwable {
        response.then()
                .log().ifValidationFails()
                .assertThat()
                .statusCode(200);
        String authToken = response.then().extract().body().path("token");
    }
}
