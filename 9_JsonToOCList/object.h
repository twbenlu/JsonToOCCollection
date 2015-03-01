//
//  object.h
//  JsonToOCWithAClass
//
//  Created by benlu on 2/12/15.
//  Copyright (c) 2015 benlu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"

#ifndef JsonToOCWithAClass_object_h
#define JsonToOCWithAClass_object_h

@interface RootObject : Jastor

@property (nonatomic) NSString* title;
@property (nonatomic) NSString* detail;
@property (nonatomic) NSString* image;

@end


#endif
