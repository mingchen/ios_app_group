# ios_app_group

Flutter plugin to access get shared app group on iOS.

On iOS, this uses the `NSFileManager`'s `containerURLForSecurityApplicationGroupIdentifier` API to get app group container URL.
see https://developer.apple.com/documentation/foundation/nsfilemanager/1412643-containerurlforsecurityapplicati

## Usage

```dart
import 'dart:io';
import 'package:ios_app_group/ios_app_group.dart';

// Return null if shared app group is not exist or not accessible.
Directory sharedDirectory = await IosAppGroup.getAppGroupDirectory('com.example.app1');
```

# License

BSD. see [LICENSE](LICENSE)
