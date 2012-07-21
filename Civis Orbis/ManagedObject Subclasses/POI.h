//
//  POI.h
//  Civis Orbis
//
//  Created by Kris Markel on 7/21/12.
//  Copyright (c) 2012 Civis Orbis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface POI : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSString * mapPoint;
@property (nonatomic, retain) NSManagedObject *checkIns;
@property (nonatomic, retain) NSManagedObject *city;
@property (nonatomic, retain) NSSet *tour;
@end

@interface POI (CoreDataGeneratedAccessors)

- (void)addTourObject:(NSManagedObject *)value;
- (void)removeTourObject:(NSManagedObject *)value;
- (void)addTour:(NSSet *)values;
- (void)removeTour:(NSSet *)values;

@end
