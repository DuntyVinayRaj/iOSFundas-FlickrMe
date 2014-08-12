//
//  FlickrParser.h
//  FlickrMe!!
//
//  Created by Vinay Raj on 12/08/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrParser : NSObject

+(NSMutableArray*)getParsedFlickrMediaFromResponse : (NSDictionary*)response;

@end
