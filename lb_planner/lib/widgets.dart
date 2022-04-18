library lbplanner_widgets;

export 'package:flutter_gen/gen_l10n/l10n.dart';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/assets.dart';
import 'package:nekolib_ui/core.dart';
import 'package:nekolib_ui/utils.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

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
part 'widgets/animated_fade_out_in.dart';
part 'widgets/loading_indicator.dart';
part 'widgets/dialog.dart';
part 'widgets/container.dart';
part 'widgets/popup.dart';

/// Radius for all rounded rectangles.
const double kRadius = 5;

/// Fast animation duration.
const kFastAnimationDuration = Duration(milliseconds: 100);

/// Faster animation duration.
const kFasterAnimationDuration = Duration(milliseconds: 50);

/// Slow animation duration.
const kSlowAnimationDuration = Duration(milliseconds: 500);

/// Animation curve for all animations.
const Curve kAnimationCurve = Curves.easeOutCubic;
