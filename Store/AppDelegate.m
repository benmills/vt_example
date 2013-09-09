//
//  AppDelegate.m
//  Store
//
//  Created by Benjamin Mills on 9/9/13.
//  Copyright (c) 2013 Benjamin Mills. All rights reserved.
//

#import "AppDelegate.h"
#import <VenmoTouch/VenmoTouch.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [VTClient
     startWithMerchantID:@"qh5bmbx4v6pzw93h"
     customerEmail:@"ben@getbraintree.com"
     braintreeClientSideEncryptionKey:@"MIIBCgKCAQEA1wdEJdya+wre6n7PTaRFy7eAbaiK6/CV0782D5ho6gwF7VBXPBK7mypzF8PUwGm1mvOUuMVdtnyagpY/Lz7eSbiudpBwAlLEZn21Ou7nOxcfPexkaG5P09AiVfnWnxVo0t+VkkbC7yPVj5K1emxJ4VOFCCwJ3xfWm2DQ36XZoGX0mXzubHscWRUjxkEKOshkee9x7U6IquJDoWqqYt0y1XsJoawHxK44TolWcg3sxDck4D6ToSkYUzm08mVqxmLl0sRDPztFbUC1oxaFCY6wpG/iISNKsitWZTsHxythRo0y4VnqzNTgUsUHWjGiK6UicpehlEgq72PqiFJnxf5B0QIDAQAB"
     environment:VTEnvironmentSandbox];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
