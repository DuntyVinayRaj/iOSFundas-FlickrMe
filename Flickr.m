//
//  Flickr.m
//  FlickrMe!!
//
//  Created by Vinay Raj on 12/08/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import "Flickr.h"

@implementation Flickr

-(NSString*)description
{
    return [NSString stringWithFormat:@"link : %@, title : %@", self.link, self.title];
}

@end
