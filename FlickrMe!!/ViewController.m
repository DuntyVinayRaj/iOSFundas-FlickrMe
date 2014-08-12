//
//  ViewController.m
//  FlickrMe!!
//
//  Created by Vinay Raj on 12/08/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "FlickrCell.h"
#import "Flickr.h"
#import "FLickrServices.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tblFlickrFeed;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshView) name:@"reloadContents" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(errorInFetchingResponse) name:@"flickrfeederror" object:nil];
    
    FLickrServices *service = [FLickrServices sharedInstance];
    [service fetchTheResponseFromFlickrFeed];
}

-(void)errorInFetchingResponse
{
    NSLog(@"Log : Could not make a connection or there was an error getting data from the server---");
}

-(void)refreshView
{
    flickrFeed = [((AppDelegate*)[UIApplication sharedApplication].delegate).flickrFeed mutableCopy];
    [self.tblFlickrFeed reloadData];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return flickrFeed.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FlickrCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flickrcell"];
    
    Flickr *flickrObj = flickrFeed[indexPath.row];
    
    
    NSURL *link = [NSURL URLWithString:flickrObj.link];
    NSData *data = [NSData dataWithContentsOfURL:link];
    cell.flickrImg.image = [UIImage imageWithData:data];
    
    cell.lblTitle.text = flickrObj.title;
    return cell;
}
@end
