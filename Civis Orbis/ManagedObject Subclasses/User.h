//
//  User.h
//  Civis Orbis
//
//  Created by Kris Markel on 7/21/12.
//  Copyright (c) 2012 Civis Orbis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *checkIns;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addCheckInsObject:(NSManagedObject *)value;
- (void)removeCheckInsObject:(NSManagedObject *)value;
- (void)addCheckIns:(NSSet *)values;
- (void)removeCheckIns:(NSSet *)values;

@end
