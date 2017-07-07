Feature: Login

  @login
  Scenario Outline:
    When user login with credentials "<username>" and "<password>"
    Then user should receive a valid login response with authentication token
    Examples:
      | username | password  |
      | rlodha   | rlodha123 |

  @login
  Scenario Outline:
    When user login with credentials "<username>" and "<password>"
    Then user should receive http response: <status code>
    Examples:
      | username | password  | status code |
      | rlodha   | rlodha123 | 200         |
      | admin    | admin     | 401         |