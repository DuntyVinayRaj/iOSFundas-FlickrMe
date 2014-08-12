//
//  ViewController.h
//  FlickrMe!!
//
//  Created by Vinay Raj on 12/08/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *flickrFeed;
}
@end
