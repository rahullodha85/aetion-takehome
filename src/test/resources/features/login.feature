Feature: Login
  @debug
  Scenario Outline:
    When user login with valid credentials "<username>" and "<password>"
    Then user should receive a valid login response with authentication token
    Examples:
      | username | password  |
      | rlodha   | rlodha123 |