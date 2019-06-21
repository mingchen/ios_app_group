// Copyright 2019 Ming Chen.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "IosAppGroupPlugin.h"

@implementation IosAppGroupPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"com.github.mingchen.flutter.plugins/ios_app_group"
            binaryMessenger:[registrar messenger]];
  IosAppGroupPlugin* instance = [[IosAppGroupPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getAppGroupDirectory" isEqualToString:call.method]) {
    result([self getAppGroupDirectoryWithId:call.arguments]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (NSString*)getAppGroupDirectoryWithId:(NSString*)groupId {
  NSFileManager* fileManager = [NSFileManager defaultManager];

  // A URL indicating the location of the group's shared directory in the file system.
  // In iOS, the value is nil when the group identifier is invalid.
  NSURL *groupURL = [fileManager containerURLForSecurityApplicationGroupIdentifier:groupId];
  return [groupURL path];
}

@end
