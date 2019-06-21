import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_app_group/ios_app_group.dart';
import 'dart:io';

void main() {
  const MethodChannel channel =
      MethodChannel('com.github.mingchen.flutter.plugins/ios_app_group');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '/private/var/mobile/Containers/Shared/AppGroup/5CFF96C4-8B73-449F-99A3-F871D21862BD';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(
        await IosAppGroup.getAppGroupDirectory('com.example.app1'),
        Directory(
            '/private/var/mobile/Containers/Shared/AppGroup/5CFF96C4-8B73-449F-99A3-F871D21862BD'));
  });
}
