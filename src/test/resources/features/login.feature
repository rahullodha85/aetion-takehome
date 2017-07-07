Feature: Login

  @login
  Scenario Outline: Login smoke checking authentication token in response
    When user login with credentials "<username>" and "<password>"
    Then user should receive a valid login response with authentication token
    Examples:
      | username | password  |
      | rlodha   | rlodha123 |

  @login
  Scenario Outline: Login with valid and invalid credentials
    When user login with credentials "<username>" and "<password>"
    Then user should receive http response: <status code>
    Examples:
      | username | password  | status code |
      | rlodha   | rlodha123 | 200         |
      | admin    | admin     | 401         |