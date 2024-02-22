import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/presentation/presentation.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Displays the profile image of the current user with the current size.
class UserProfileImg extends StatelessWidget {
  /// Displays the profile image of the current user with the current size.
  const UserProfileImg({Key? key, required this.size, this.userId})
      : super(key: key);

  /// The size of the profile image.
  final double size;

  /// The id of the user to display. If not specified, the current user is used.
  final int? userId;

  /// Cache manager for the profile image.
  static CacheManager get cacheManager => CacheManager(
        Config(
          'user_profile',

          // ignore: no-magic-number
          stalePeriod: Duration(days: 7),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var user = userId != null
            ? ref.watch(usersProvider)[userId!]
            : ref.watch(userProvider);

        return ClipOval(
          child: ConditionalWidget(
            condition: user != null && user.profileImageUrl.isNotEmpty,
            ifTrue: CachedNetworkImage(
              imageUrl: user!.profileImageUrl,
              width: size,
              height: size,
              fit: BoxFit.contain,
              placeholder: (_, __) => CircularProgressIndicator(),
              errorWidget: (_, __, ___) => Icon(
                Icons.account_circle,
                size: size,
              ),
              cacheManager: cacheManager,
            ),
            ifFalse: ShimmerEffect(height: size, width: size),
          ),
        );
      },
    );
  }
}
