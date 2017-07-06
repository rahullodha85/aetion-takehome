Feature: Create/Update user

  @user @createUser
  Scenario Outline:
    Given Authentication token is received
    When a user is created with "<email>", "<first_name>", "<last_name>" and <age>
    Then create user response should be received containing "<email>", "<first_name>", "<last_name>" and <age>
    Examples:
      | email                | first_name | last_name     | age |
#      | email@email.com     | Steve       | Austin       | 43  |
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