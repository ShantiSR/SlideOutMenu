//
//  MenuLayerViewController.h
//  SlideOutDemo
//
//  Created by Wenzhong Chi on 12/23/13.
//  Copyright (c) 2013 Wenzhong Chi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuLayerViewControllerDelegate <NSObject>

-(void)MenuLayerSelectItemFromTableView:(UIViewController *)controller didFinishWithData:(NSString *)tableRowNumber;

@end


@interface MenuLayerViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *menuTableView;

@property (strong, nonatomic) id<MenuLayerViewControllerDelegate>delegate;

@end
