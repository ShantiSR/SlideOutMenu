//
//  MenuLayerViewController.m
//  SlideOutDemo
//
//  Created by Wenzhong Chi on 12/23/13.
//  Copyright (c) 2013 Wenzhong Chi. All rights reserved.
//

#import "MenuLayerViewController.h"
#import "SlideOutViewController.h"



@interface MenuLayerViewController ()
{
    NSMutableArray *_menuData;
    
}


@end

@implementation MenuLayerViewController
@synthesize menuTableView;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _menuData = [[NSMutableArray alloc]initWithObjects:
              @"Angela",@"Ashley",@"Nikki",
              @"Bernice",@"Rosanna",@"Phebe",nil];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.menuTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    
    [self.view addSubview:self.menuTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_menuData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *result = nil;
    
    if ([tableView isEqual:self.menuTableView])
    {
        static NSString *tableViewCellIdentifier = @"MenuCell";
        result = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
        
        if (result == nil)
        {
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellIdentifier];
        }
        
        result.textLabel.text = [_menuData objectAtIndex:indexPath.row];
        
    }
    
    return result;
    
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [delegate MenuLayerSelectItemFromTableView:self didFinishWithData:[_menuData objectAtIndex:indexPath.row]];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
