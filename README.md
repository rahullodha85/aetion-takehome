# Aetion Takehome Assignment
Test framework built using cucumber, Java and Rest-Assured

### Execute Tests
Execute tests using `executeTests.sh` script

#### Examples of executing tests
1. Run all tests
`./excuteTests.sh` or using maven command `mvn clean test`
2. Run tests for a specific scenario/tag
`./executeTests.sh <tag-name>`

### Test Scenarios and Tags
1. Login Tests: `@login`
2. All User Tests: `@user`
3. Create-User Tests: `@create-user`
4. Get-User Tests: `@get-user`
5. Update-User Tests: `@update-user`
6. Search-User Tests: `@search-user`

### Test Repors
Test report are available under target/html and target/json directories

### Bugs found during testing
1. Update user request `/user/{id} PUT` does not update age attribute
Steps to reproduce: run update-user tests using `./executeTests.sh @update-user` 

2. Authentication token does not expire until and unless a new token is created

3. Possible bug - update user request with a body containing only changed attributes returns 500 internal server error
Ex. using followin body instad of a full user body for update-user request
`{
    "id": 46838,
    "email": "steve@austinwee.com"
}`
Should be either able to identify and update specified attributes only or a 400 bad request error.
