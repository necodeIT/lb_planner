library configs.endpoints;

/// The url of the moodle server.
///
/// This detrmines where the app will send requests to.
///
/// This value is read from the environment variable `MOODLE_ENDPOINT` and defaults to `localhost:8080`.
const kMoodleServerAdress = String.fromEnvironment("MOODLE_ENDPOINT", defaultValue: "localhost:8080");

/// The url of the LB Planner website.
///
/// This is used to use the public API of the LB Planner which does not require authentication for retrieving metadata.
///
/// This value is read from the environment variable `LB_PLANNER_ENDPOINT` and defaults to `localhost:8081`.
const kLBPlannerWebsiteAdress = String.fromEnvironment("LB_PLANNER_ENDPOINT", defaultValue: "localhost:8081");
