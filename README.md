# Flutter ios_app_group plugin

[![pub package](https://img.shields.io/pub/v/ios_app_group.svg)](https://pub.dev/packages/ios_app_group)

A Flutter plugin to access shared application group container on iOS.

On iOS, this uses the `NSFileManager`'s [containerURLForSecurityApplicationGroupIdentifier](https://developer.apple.com/documentation/foundation/nsfilemanager/1412643-containerurlforsecurityapplicati) API to get app group container URL.

## Install

Add this to your package's `pubspec.yaml` file:


```yaml
dependencies:
  ios_app_group: ^1.0.0
```

## Usage

```dart
import 'dart:io';
import 'package:ios_app_group/ios_app_group.dart';

// Return null if shared app group is not exist or not accessible.
Directory sharedDirectory = await IosAppGroup.getAppGroupDirectory('com.example.app1');
```

# License

BSD. see [LICENSE](LICENSE).
