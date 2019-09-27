//
//  AppDelegate.m
//  TestCoreDataOrderedRelationships
//
//  Created by Chris Vasselli on 2019/09/27.
//  Copyright © 2019 Serpenti Sei. All rights reserved.
//

#import "AppDelegate.h"
#import "Basket+CoreDataClass.h"
#import "Basket+CoreDataProperties.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self testCoreDataMethods];
    return YES;
}

- (void) testCoreDataMethods
{
    Basket* basket = (Basket*) [NSEntityDescription insertNewObjectForEntityForName:@"Basket" inManagedObjectContext:[self persistentContainer].viewContext];

    // From Basket+CoreDataProperties.h:
    
//    - (void)insertObject:(Egg *)value inEggsAtIndex:(NSUInteger)idx;
//    - (void)removeObjectFromEggsAtIndex:(NSUInteger)idx;
//    - (void)insertEggs:(NSArray<Egg *> *)value atIndexes:(NSIndexSet *)indexes;
//    - (void)removeEggsAtIndexes:(NSIndexSet *)indexes;
//    - (void)replaceObjectInEggsAtIndex:(NSUInteger)idx withObject:(Egg *)value;
//    - (void)replaceEggsAtIndexes:(NSIndexSet *)indexes withEggs:(NSArray<Egg *> *)values;
//    - (void)addEggsObject:(Egg *)value;
//    - (void)removeEggsObject:(Egg *)value;
//    - (void)addEggs:(NSOrderedSet<Egg *> *)values;
//    - (void)removeEggs:(NSOrderedSet<Egg *> *)values;

        NSArray<NSString*>* selectors = @[
            NSStringFromSelector(@selector(insertObject:inEggsAtIndex:)),
            NSStringFromSelector(@selector(removeObjectFromEggsAtIndex:)),
            NSStringFromSelector(@selector(insertEggs:atIndexes:)),
            NSStringFromSelector(@selector(removeEggsAtIndexes:)),
            NSStringFromSelector(@selector(replaceObjectInEggsAtIndex:withObject:)),
            NSStringFromSelector(@selector(replaceEggsAtIndexes:withEggs:)),
            NSStringFromSelector(@selector(addEggsObject:)),
            NSStringFromSelector(@selector(removeEggsObject:)),
            NSStringFromSelector(@selector(addEggs:)),
            NSStringFromSelector(@selector(removeEggs:))
        ];
        
        for ( NSString* selector in selectors )
        {
            if ( [basket respondsToSelector:NSSelectorFromString(selector)] )
                NSLog(@"%@ exists.", selector);
            else
                NSLog(@"%@ does not exist.", selector);
        }

}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"TestCoreDataOrderedRelationships"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
