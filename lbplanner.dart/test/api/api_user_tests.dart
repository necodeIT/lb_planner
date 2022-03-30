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
    var response = await UserApi.registerUser(kToken, kUserId, "en", "light");

    if (response.succeeded) {
      assert(response.value != null);
      assert(response.value!.id == kUserId);
      assert(response.value!.username == "admin");
      assert(response.value!.accessLevel == AccessLevels.admin);
      assert(response.value!.avatar == "https://projekte.tgm.ac.at/moodledev/user/pix.php/2/f1.jpg");
      assert(response.value!.language == Languages.en);
      assert(response.value!.theme == "light");
      assert(response.value!.planId == 1);
      assert(response.value!.firstname == "Admin");
      assert(response.value!.lastname == "User");
    } else {
      assert(response.failed);
      assert(response.value == null);
      assert(response.errorMessage == "error/User already registered");
    }
  });

  test("Get user invalid id", () async {
    var response = await UserApi.getUser(kToken, -1);

    assert(response.failed);
    assert(response.value == null);
    assert(response.errorMessage == "error/User does not exist");
  });

  test("Get user valid id", () async {
    var response = await UserApi.getUser(kToken, kUserId);

    assert(response.succeeded);
    assert(response.value != null);
    assert(response.value!.id == kUserId);
    assert(response.value!.username == "admin");
    assert(response.value!.accessLevel == AccessLevels.admin);
    assert(response.value!.avatar == "https://projekte.tgm.ac.at/moodledev/user/pix.php/2/f1.jpg");
    assert(response.value!.language == Languages.en);
    assert(response.value!.theme == "light");
    assert(response.value!.planId == 1);
    assert(response.value!.firstname == "Admin");
    assert(response.value!.lastname == "User");
  });
}
