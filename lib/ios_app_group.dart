import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

class IosAppGroup {
  static const MethodChannel _channel =
      const MethodChannel('com.github.mingchen.flutter.plugins/ios_app_group');

  /// Returns the container directory associated with the specified security
  /// application group identifier [groupId].
  ///
  /// Returns `null` if app group is not exist or no access.
  ///
  /// On iOS, this uses the `containerURLForSecurityApplicationGroupIdentifier` API.
  ///
  /// see https://developer.apple.com/documentation/foundation/nsfilemanager/1412643-containerurlforsecurityapplicati
  ///
  /// On Android, this function throws an [UnsupportedError].
  ///
  static Future<Directory> getAppGroupDirectory(String groupId) async {
    if (!Platform.isIOS) {
      throw UnsupportedError("getAppGroupDirectory requires iOS");
    }

    final String path =
        await _channel.invokeMethod<String>('getAppGroupDirectory', groupId);
    if (path == null) {
      return null;
    }

    return Directory(path);
  }
}
