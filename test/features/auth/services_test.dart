import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lb_planner/features/auth/data/data.dart';
import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/data/data.dart';
import 'package:lb_planner/shared/shared.dart';

import '../../hooks.dart';
import 'env.dart';

void main() {
  group("AuthService", () {
    group("MoodleAuthService", () {
      final networkService = DioNetworkService(Dio());

      group("Moodle Mobile App", () {
        final authService = MoodleAuthService(
          kMoodleMobileAppServiceName,
          networkService,
        );

        test("requestToken with valid login", () async {
          final token = await authService.requestToken(kUsername, kPassword);

          expect(token, kMoodleMobileAppToken);
        });

        test("requestToken with invalid login", () async {
          expect(
            authService.requestToken("invalid", "invalid"),
            throwsException,
          );
        });

        test("validateToken with valid token", () {
          expect(
            authService.validateToken(kMoodleMobileAppToken),
            completion(equals(true)),
          );
        });

        test("validateToken with invalid token", () {
          expect(
            authService.validateToken("invalid"),
            completion(equals(false)),
          );
        });
      });
      group("LB Planner API", () {
        final authService = MoodleAuthService(
          kLbPlannerApiServiceName,
          networkService,
        );

        test("requestToken with valid login", () async {
          final token = await authService.requestToken(kUsername, kPassword);

          expect(token, kLbPlannerApiToken);
        });

        test("requestToken with invalid login", () async {
          expect(
            authService.requestToken("invalid", "invalid"),
            throwsException,
          );
        });

        test("validateToken with valid token", () {
          expect(
            authService.validateToken(kLbPlannerApiToken),
            completion(equals(true)),
          );
        });

        test("validateToken with invalid token", () {
          expect(
            authService.validateToken("invalid"),
            completion(equals(false)),
          );
        });
      });
    });
  });

  group("LocalConfigService", () {
    useTestPathProviderPlatform();

    final container = ProviderContainer();

    final appDirService = container.read(appDirServiceProvider);

    tearDownAll(() {
      clearTestDir();
    });

    setUpAll(() {
      clearTestDir();
    });

    group("UserTokenLocalConfigService", () {
      final configService = UserTokenLocalConfigService(appDirService);

      final userToken = UserToken(
        lbPlannerApiToken: kLbPlannerApiToken,
        moodleMobileAppToken: kMoodleMobileAppToken,
      );

      test("loadConfig should throw if there is no file", () {
        expect(configService.loadConfig(), throwsException);
      });

      test("saveConfig should save the config", () async {
        await configService.saveConfig(userToken);

        final f = await configService.resolveConfigFile();

        expect(f.existsSync(), true, reason: "The config file should exist");

        expect(
          f.readAsString(),
          completion(equals(jsonEncode(userToken))),
        );
      });

      test(
        "loadConfig should load the config",
        () async {
          final f = await configService.resolveConfigFile();

          await f.writeAsString(jsonEncode(userToken));

          final loadedUserToken = await configService.loadConfig();

          expect(loadedUserToken, userToken);
        },
      );
    });
  });
}
