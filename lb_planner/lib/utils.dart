import 'package:lbplanner_api/lbplanner_api.dart';
import 'package:nekolib_ui/core.dart';

/// Applies the user's selected theme.
void applyUserTheme(User user) {
  setTheme(NcThemes.all[user.theme] ?? lightTheme);
}
