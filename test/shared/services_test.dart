import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lb_planner/shared/data/data.dart';
import 'package:lb_planner/shared/shared.dart';

import '../config.dart';

void main() {
  group("DioNetworkService", () {
    final dio = Dio(
      BaseOptions(
        // so Dio doesn't throw on non success status codes
        validateStatus: (_) => true,
      ),
    );
    final networkService = DioNetworkService(dio);

    test("get should throw an exception for invalid url", () async {
      expect(() async => await networkService.get("invalid url"),
          throwsA(isA<Exception>()));
      expect(
          () async => await networkService.get(""), throwsA(isA<Exception>()));
    });
    test("post should throw an exception for invalid url", () async {
      expect(() async => await networkService.post("invalid url"),
          throwsA(isA<Exception>()));
      expect(
          () async => await networkService.post(""), throwsA(isA<Exception>()));
    });

    test("get should return Ok response", () async {
      final response = await networkService.get("$kUnitTestsMockoonAddress/ok");

      expect(
        response,
        isA<HttpResponse>(),
        reason: "response is not a HttpResponse",
      );
      expect(response.isOk, true, reason: "response is not Ok");
      expect(response.isNotOk, false, reason: "response is not Ok");
    });

    test("post should return Ok response", () async {
      final response =
          await networkService.post("$kUnitTestsMockoonAddress/ok");

      expect(
        response,
        isA<HttpResponse>(),
        reason: "response is not a HttpResponse",
      );
      expect(response.isOk, true, reason: "response is not Ok");
      expect(response.isNotOk, false, reason: "response is not Ok");
    });

    test("get should return not Ok response", () async {
      final response =
          await networkService.get("$kUnitTestsMockoonAddress/notOk");

      expect(response, isA<HttpResponse>());
      expect(response.isOk, false);
      expect(response.isNotOk, true);
    });
    test("post should return not Ok response", () async {
      final response =
          await networkService.post("$kUnitTestsMockoonAddress/notOk");

      expect(response, isA<HttpResponse>());
      expect(response.isOk, false);
      expect(response.isNotOk, true);
    });

    test("get should parse to json", () async {
      final response =
          await networkService.get("$kUnitTestsMockoonAddress/json");

      expect(response, isA<HttpResponse>());
      expect(response.body, {"message": "ok"});
    });

    test("post should parse to json", () async {
      final response =
          await networkService.post("$kUnitTestsMockoonAddress/json");

      expect(response, isA<HttpResponse>());
      expect(response.body, {"message": "ok"});
    });

    test("get should support non json response", () async {
      final response =
          await networkService.get("$kUnitTestsMockoonAddress/nonJson");

      expect(response, isA<HttpResponse>());
      expect(response.body, "ok");
    });

    test("post should support non json response", () async {
      final response =
          await networkService.post("$kUnitTestsMockoonAddress/nonJson");

      expect(response, isA<HttpResponse>());
      expect(response.body, "ok");
    });
  });
}
