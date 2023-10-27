/// This library contains configurations related to the install medium used to install the app.
library configs.install_medium;

import 'package:lb_planner/shared/shared.dart';

const _kInstallMediumName =
    String.fromEnvironment("INSTALL_MEDIUM", defaultValue: "selfCompiled");

/// The [InstallMedium] used to install the app.
///
/// This value is read from the compile-time variable `INSTALL_MEDIUM` and defaults to [InstallMedium.selfCompiled].
///
/// In order to set the variable use `--dart-define` when building the app:
///
/// ```bash
/// flutter build [os] --dart-define=INSTALL_MEDIUM=`VALUE`
/// ```
final kInstallMedium = InstallMedium.values.byName(_kInstallMediumName);
