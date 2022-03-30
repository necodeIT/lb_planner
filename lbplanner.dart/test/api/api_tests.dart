part of lbplanner_tests;

void runApiTests() {
  test("Invalid token", () async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_user_get_user",
      token: "invalid_token",
      params: {"userid": kUserId},
    );

    assert(response.failed);
    assert(response.errorMessage == "Invalid token - token not found");
  });

  test("Invalid function name", () async {
    var response = await Api.makeRequest(
      functionName: "invalid_function_name",
      token: kToken,
    );

    assert(response.failed);
  });

  test("Valid token", () async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_user_get_user",
      token: kToken,
      params: {"userid": kUserId},
    );

    assert(response.succeeded);
    assert(response["userid"] == kUserId);
  });
}
