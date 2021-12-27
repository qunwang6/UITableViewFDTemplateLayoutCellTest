//
//  AppDelegate.m
//  tableViewTest
//
//  Created by qun on 2021/12/27.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *VC = [[ViewController alloc] init];
    [self.window setRootViewController:VC];
    [self.window makeKeyAndVisible];
    return YES;
}





@end
