/*
 * PhoneGap is available under *either* the terms of the modified BSD license *or* the
 * MIT License (2008). See http://opensource.org/licenses/alphabetical for full text.
 *
 * Copyright 2011 Matt Kane. All rights reserved.
 * Copyright (c) 2011, IBM Corporation
 */

#import <Cordova/CDVPlugin.h>
#import "WQCodeScanner.h"


@interface CDVBarcodeScanner : CDVPlugin

@end

@implementation CDVBarcodeScanner


- (void)scan:(CDVInvokedUrlCommand*)command {

    WQCodeScanner *scanner = [[WQCodeScanner alloc]init];
    

    
    [self.viewController presentViewController:scanner
                                      animated:YES
                                    completion:nil];
    
    scanner.resultBlock = ^(NSString *value) {
 
            CDVPluginResult* cdVPluginResult = [CDVPluginResult
                                                resultWithStatus: CDVCommandStatus_OK
                                                messageAsString:value
                                                ];
            [self.commandDelegate sendPluginResult:cdVPluginResult callbackId:command.callbackId];
       
       
    };
}




@end
