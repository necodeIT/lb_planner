library lbplanner_widgets;

export 'package:flutter_gen/gen_l10n/l10n.dart';

import 'package:context_menus/context_menus.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:lb_planner/assets.dart';
import 'package:lb_planner/routes.dart';
import 'package:lbplanner_api/lbplanner_api.dart';
import 'package:nekolib_ui/core.dart';
import 'package:nekolib_ui/utils.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:nima/nima_actor.dart';
import 'package:rive/rive.dart' as rive;
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

part 'widgets/button.dart';
part 'widgets/textbutton.dart';
part 'widgets/checkbox.dart';
part 'widgets/dropdown.dart';
part 'widgets/localized_widget.dart';
part 'widgets/tag.dart';
part 'widgets/logo.dart';
part 'widgets/app_icon.dart';
part 'widgets/text_field.dart';
part 'widgets/icon.dart';
part 'widgets/loading_indicator.dart';
part 'widgets/dialog.dart';
part 'widgets/container.dart';
part 'widgets/popup.dart';
part 'widgets/module.dart';
part 'widgets/universal_actor.dart';
part 'widgets/shimmer.dart';
part 'widgets/style.dart';
part 'widgets/gesture_detector.dart';
part 'widgets/tba.dart';
part 'widgets/card.dart';

/// Radius for all rounded rectangles.
const double kRadius = 5;

/// Fast animation duration.
const kFastAnimationDuration = Duration(milliseconds: 100);

/// Faster animation duration.
const kFasterAnimationDuration = Duration(milliseconds: 50);

/// Slow animation duration.
const kSlowAnimationDuration = Duration(milliseconds: 500);

/// Fast animation duration.
const kNormalAnimationDuration = Duration(milliseconds: 300);

/// Animation curve for all animations.
const Curve kAnimationCurve = Curves.ease;

/// Animation curve used for dialogs.
const Curve kDialogAnimationCurve = Curves.easeOut;
