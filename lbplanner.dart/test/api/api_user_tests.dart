part of lbplanner_tests;

void runApiUserTests() {
  test("Get user invalid token", () async {
    var response = await UserApi.getUser("invalid token", 2);

    assert(response.failed);
    assert(response.value == null);
    assert(response.errorMessage == "Invalid token - token not found");
  });

  test("Get user valid token", () async {
    var response = await UserApi.getUser(kToken, 2);

    assert(response.succeeded);
    assert(response.value != null);
    assert(response.value!.id == 2);
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
