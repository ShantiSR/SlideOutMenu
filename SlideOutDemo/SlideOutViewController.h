//
//  SlideOutViewController.h
//  SlideOutDemo
//
//  Created by Wenzhong Chi on 12/22/13.
//  Copyright (c) 2013 Wenzhong Chi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuLayerViewController.h"
#import "DetailLayerViewController.h"



@interface SlideOutViewController : UIViewController <MenuLayerViewControllerDelegate>


@property (strong, nonatomic) UIView *frontLayerView;
@property (strong, nonatomic) UIView *menuLayerView;
@property (strong, nonatomic) UIView *detailLayerView;

@property (strong, nonatomic) MenuLayerViewController *menuLayerViewController;
@property (strong, nonatomic) DetailLayerViewController *detailLayerViewController;
//subContentView contians the main view
//subBackgroundView contains the leftsidebarview and rightsidebarview
//subBackgroundView will bring to the front when subContentView move to the side


- (void)addContentAndBackgroundView;



@end
