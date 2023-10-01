/// Contains configs for all endpoints used by the app.
library configs.endpoints;

/// The url of the moodle server.
///
/// This detrmines where the app will send requests to.
///
/// This value is read from the compile-time variable `MOODLE_ENDPOINT` and defaults to `localhost:8080`.
///
/// In order to set the variable use `--dart-define` when building the app:
///
/// ```bash
/// flutter build [os] --dart-define=MOODLE_ENDPOINT=`VALUE`
/// ```
const kMoodleServerAdress =
    String.fromEnvironment("MOODLE_ENDPOINT", defaultValue: "localhost:8080");

/// The url of the LB Planner website.
///
/// This is used to use the public API of the LB Planner which does not require authentication for retrieving metadata.
///
/// This value is read from the compile-time variable `LB_PLANNER_ENDPOINT` and defaults to `localhost:8081`.
///
/// In order to set the variable use `--dart-define` when building the app:
///
/// ```bash
/// flutter build [os] --dart-define=LB_PLANNER_ENDPOINT=`VALUE`
/// ```
const kLBPlannerWebsiteAdress = String.fromEnvironment("LB_PLANNER_ENDPOINT",
    defaultValue: "localhost:8081");
