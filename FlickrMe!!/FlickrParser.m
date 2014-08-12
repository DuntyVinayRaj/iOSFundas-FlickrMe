//
//  FlickrParser.m
//  FlickrMe!!
//
//  Created by Vinay Raj on 12/08/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import "FlickrParser.h"
#import "Flickr.h"

@implementation FlickrParser


+(NSMutableArray*)getParsedFlickrMediaFromResponse : (NSDictionary*)response
{
    /*
     
     {
     "title": "IMG_8084.jpg",
     "link": "https://www.flickr.com/photos/102010012@N02/14705241600/",
     "media": {"m":"https://farm4.staticflickr.com/3915/14705241600_2dd14842e5_m.jpg"},
     "date_taken": "2014-08-09T19:45:04-08:00",
     "description": " <p><a href=\"https://www.flickr.com/people/102010012@N02/\">dolfvermeulen<\/a> posted a photo:<\/p> <p><a href=\"https://www.flickr.com/photos/102010012@N02/14705241600/\" title=\"IMG_8084.jpg\"><img src=\"https://farm4.staticflickr.com/3915/14705241600_2dd14842e5_m.jpg\" width=\"160\" height=\"240\" alt=\"IMG_8084.jpg\" /><\/a><\/p> ",
     "published": "2014-08-12T01:47:03Z",
     "author": "nobody@flickr.com (dolfvermeulen)",
     "author_id": "102010012@N02",
     "tags": ""
     }
     
     */
    
    NSArray *itemsArray = response[@"items"];
    NSMutableArray *feedArray = [[NSMutableArray alloc]init];
    
    for(NSDictionary *record in itemsArray)
    {
        Flickr *flickrObj = [[Flickr alloc]init];
        flickrObj.title = record[@"title"];
        flickrObj.link = record[@"media"][@"m"];
        [feedArray addObject:flickrObj];
    }
    return feedArray;
}


@end
