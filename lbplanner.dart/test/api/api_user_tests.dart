part of lbplanner_tests;

void runApiUserTests() {
  test("Login valid", () async {
    var response = await UserApi.login(kLoginName, kPassword);
    assert(response.succeeded);
    assert(response.value == kToken);
  });

  test("Login invalid", () async {
    var response = await UserApi.login("", "");
    assert(response.failed, true);
    assert(response.value == null);
    assert(response.errorMessage == "Invalid login, please try again");
  });

  test("Register User", () async {
    var response = await UserApi.registerUser(kToken, kUserId, kLanguage.name, kUserTheme);

    if (response.succeeded) {
      assert(response.value != null);
      assert(response.value!.id == kUserId);
      assert(response.value!.username == kUsername);
      assert(response.value!.accessLevel == kAccessLevel);
      assert(response.value!.avatar == kAvatar);
      assert(response.value!.language == kLanguage);
      assert(response.value!.theme == kUserTheme);
      assert(response.value!.planId == kPlanId);
      assert(response.value!.firstname == kFirstname);
      assert(response.value!.lastname == kLastname);
    } else {
      assert(response.failed);
      assert(response.value == null);
      assert(response.errorMessage == "error/User already registered");
    }
  });

  test("Get user invalid id", () async {
    var response = await UserApi.getUser(kToken, -kUserId);

    assert(response.failed);
    assert(response.value == null);
    assert(response.errorMessage == "error/User does not exist");
  });

  test("Get user valid id", () async {
    var response = await UserApi.getUser(kToken, kUserId);

    assert(response.succeeded);
    assert(response.value != null);
    assert(response.value!.id == kUserId);
    assert(response.value!.username == kUsername);
    assert(response.value!.accessLevel == kAccessLevel);
    assert(response.value!.avatar == kAvatar);
    assert(response.value!.language == kLanguage);
    assert(response.value!.theme == kUserTheme);
    assert(response.value!.planId == kPlanId);
    assert(response.value!.firstname == kFirstname);
    assert(response.value!.lastname == kLastname);
  });
}
