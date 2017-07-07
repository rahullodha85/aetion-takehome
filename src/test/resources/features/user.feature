Feature: Create/Get/Update user

  @user @create-user
  Scenario Outline: Create User
    Given Authentication token is received
    When a user is created with "<email>", "<first_name>", "<last_name>" and <age>
    Then user response should be received containing "<email>", "<first_name>", "<last_name>" and <age>
    Examples:
      | email                | first_name | last_name     | age |
      | peta@example.org     | Peta       | Francis       | 34  |
      | george@example.com   | Goerge     | Pearson       | 45  |
      | faye@example.com     | Faye       | Thames        | 42  |
      | sandeep@ertedd.test  | Sandeep    | Midha         | 23  |
      | rory@domain.test     | Rory       | Winter        | 41  |
      | jenny@another.test   | Jenny      | Wu            | 53  |
      | m@thisisa.test       | Mark       | Ehrenreich    | 38  |
      | cora@domain.test     | Cora       | Engel         | 28  |
      | dan@oprqu.test       | Dan        | Ankemah       | 31  |
      | jorge@op3ueopup.test | Jorge      | Georgiannakis | 29  |
      | pooja@example.org    | Pooja      | Reddy         | 27  |
      | enzo@ooooe.test      | Enzo       | Fumagelli     | 52  |
      | natashia@eopjpo.test | Natasha    | Pham          | 35  |
      | sandeep@ertedd.test  | Sandeep    | Midha         | 23  |
      | m@thisisa.test       | Miranda    | Croft         | 27  |
      | jorge@op3ueopup.test | Jorge      | Georgiannakis | 29  |
      | roshni@pojopjw.test  | Roshni     | Khalid        | 37  |
      | julio@opjpoj.test    | Julio      | Galinder      | 35  |
      | elida@opjopj.test    | Elida      | Moura         | 61  |
      | chris@ohoph.test     | Chris      | Ingilby       | 31  |
      | emily@sopjs.test     | Emily      | Crobak        | 28  |
      | maryam@eopjp.test    | Maryam     | Kapur         | 41  |

  @user @create-user
  Scenario Outline: Create User with invalid/expired token
    Given Authentication is invalid/expired
    When a user is created with "<email>", "<first_name>", "<last_name>" and <age>
    Then user should get 401 unauthorized response
    Examples:
      | email           | first_name | last_name | age |
      | email@email.com | Steve      | Austin    | 43  |

  @user @get-user
  Scenario Outline: Get User
    Given Authentication token is received
    When a user is searched with id <id>
    Then user response should be received containing "<email>", "<first_name>", "<last_name>" and <age>
    Examples:
      | id    | email                | first_name | last_name     | age |
      | 46841 | peta@example.org     | Peta       | Francis       | 34  |
      | 46842 | george@example.com   | Goerge     | Pearson       | 45  |
      | 46843 | faye@example.com     | Faye       | Thames        | 42  |
      | 46844 | sandeep@ertedd.test  | Sandeep    | Midha         | 23  |
      | 46845 | rory@domain.test     | Rory       | Winter        | 41  |
      | 46846 | jenny@another.test   | Jenny      | Wu            | 53  |
      | 46847 | m@thisisa.test       | Mark       | Ehrenreich    | 38  |
      | 46848 | cora@domain.test     | Cora       | Engel         | 28  |
      | 46849 | dan@oprqu.test       | Dan        | Ankemah       | 31  |
      | 46850 | jorge@op3ueopup.test | Jorge      | Georgiannakis | 29  |
      | 46851 | pooja@example.org    | Pooja      | Reddy         | 27  |
      | 46852 | enzo@ooooe.test      | Enzo       | Fumagelli     | 52  |
      | 46853 | natashia@eopjpo.test | Natasha    | Pham          | 35  |
      | 46854 | sandeep@ertedd.test  | Sandeep    | Midha         | 23  |
      | 46855 | m@thisisa.test       | Miranda    | Croft         | 27  |
      | 46856 | jorge@op3ueopup.test | Jorge      | Georgiannakis | 29  |
      | 46857 | roshni@pojopjw.test  | Roshni     | Khalid        | 37  |
      | 46858 | julio@opjpoj.test    | Julio      | Galinder      | 35  |
      | 46859 | elida@opjopj.test    | Elida      | Moura         | 61  |
      | 46860 | chris@ohoph.test     | Chris      | Ingilby       | 31  |
      | 46861 | emily@sopjs.test     | Emily      | Crobak        | 28  |
      | 46862 | maryam@eopjp.test    | Maryam     | Kapur         | 41  |

  @user @get-user
  Scenario: Get User with invalid/expired token
    Given Authentication is invalid/expired
    When a user is searched with id 12345
    Then user should get 401 unauthorized response

  @user @update-user
  Scenario Outline: Update User
    Given Authentication token is received
    When a user with id <id> is updated for field "<attribute>" and value "<value>"
    Then user response should be received containing "<attribute>" and value "<value>"
    Examples:
      | id    | attribute  | value   |
      | 46842 | first_name | Jorge   |
      | 46848 | age        | 38      |
      | 46849 | last_name  | Ankomah |

  @user @search-user
  Scenario Outline: Search User
    Given Authentication token is received
    When users are searched for age between <start-age> and <end-age>
    Then users with age between <start-age> and <end-age> should be received
    Examples:
      | start-age | end-age |
      | 20        | 40      |
      | 10        | 15      |
      # checking for invalid age range
      | 50        | 40      |