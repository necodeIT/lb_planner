part of lbplanner_tests;

void runNotificationsApiTests() {
  test("Get notifications", () async {
    var response = await NotificationsApi.getAllNotifications(kToken, kUserId);

    assert(response.succeeded);
    assert(response.isList);
    assert(response.value != null);
    assert(response.value!.isNotEmpty);
  });
}
