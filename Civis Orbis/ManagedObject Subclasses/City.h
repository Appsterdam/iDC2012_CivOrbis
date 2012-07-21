//
//  City.h
//  Civis Orbis
//
//  Created by Kris Markel on 7/21/12.
//  Copyright (c) 2012 Civis Orbis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class POI;

@interface City : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * mapFile;
@property (nonatomic, retain) NSSet *pois;
@property (nonatomic, retain) NSSet *tours;
@end

@interface City (CoreDataGeneratedAccessors)

- (void)addPoisObject:(POI *)value;
- (void)removePoisObject:(POI *)value;
- (void)addPois:(NSSet *)values;
- (void)removePois:(NSSet *)values;

- (void)addToursObject:(NSManagedObject *)value;
- (void)removeToursObject:(NSManagedObject *)value;
- (void)addTours:(NSSet *)values;
- (void)removeTours:(NSSet *)values;

@end
