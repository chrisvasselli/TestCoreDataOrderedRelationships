//
//  AppDelegate.h
//  TestCoreDataOrderedRelationships
//
//  Created by Chris Vasselli on 2019/09/27.
//  Copyright © 2019 Serpenti Sei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

