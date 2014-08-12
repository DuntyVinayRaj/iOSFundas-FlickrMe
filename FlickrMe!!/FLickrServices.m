//
//  FLickrServices.m
//  FlickrMe!!
//
//  Created by Vinay Raj on 12/08/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import "FLickrServices.h"
#import "AppDelegate.h"
#import "FlickrParser.h"

@implementation FLickrServices

+(FLickrServices*)sharedInstance
{
    static FLickrServices *client = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[self alloc]init];
    });
    
    return client;
}


-(void)fetchTheResponseFromFlickrFeed
{
    feedData = nil;
    feedData = [[NSMutableData alloc]init];
    
    NSURL *flickrUrl = [NSURL URLWithString:@"https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"];
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:flickrUrl];
    [req setHTTPMethod:@"GET"];
    [req setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    
    NSURLConnection *con = [NSURLConnection connectionWithRequest:req delegate:self];
    [con start];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"flickerfeederror" object:error];
    NSLog(@"Log : Error is - %@", error);
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [feedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *jsonObject=[NSJSONSerialization
                                                       JSONObjectWithData:feedData
                                                       options:kNilOptions
                                                       error:nil];
    
    NSLog(@"Log : The response is - %@", jsonObject);
    
    ((AppDelegate*)[UIApplication sharedApplication].delegate).flickrFeed = [FlickrParser getParsedFlickrMediaFromResponse:jsonObject];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadContents" object:nil userInfo:nil];
}

@end
