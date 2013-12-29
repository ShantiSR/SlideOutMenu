//
//  SlideOutViewController.m
//  SlideOutDemo
//
//  Created by Wenzhong Chi on 12/22/13.
//  Copyright (c) 2013 Wenzhong Chi. All rights reserved.
//

#import "SlideOutViewController.h"
#import <QuartzCore/QuartzCore.h>



@interface SlideOutViewController ()
{
    
    UIPanGestureRecognizer *_panGestureRecognizer;
    CGFloat _currentTranslation;
    
}

@end

@implementation SlideOutViewController


@synthesize frontLayerView,menuLayerView,detailLayerView;
@synthesize menuLayerViewController,detailLayerViewController;


const int frontLayerPosition = 240;
const int minFrontLayerPosition = 50;

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
    
    _currentTranslation = 0;
    
    
    //add subview to the slideoutView
    [self addContentAndBackgroundView];
    
    //add shadow to subcontentview
    self.frontLayerView.layer.shadowOffset = CGSizeMake(0, 0);
    self.frontLayerView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.frontLayerView.layer.shadowOpacity = 1;
    
    self.menuLayerViewController = [[MenuLayerViewController alloc] init];
    self.menuLayerViewController.delegate = self;
    
    self.detailLayerViewController = [[DetailLayerViewController alloc] init];
    
    [self addChildViewController:self.menuLayerViewController];
    [self addChildViewController:self.detailLayerViewController];
    
    self.menuLayerViewController.view.frame = self.menuLayerView.bounds;
    self.detailLayerViewController.view.frame = self.detailLayerView.bounds;
    
    [self.menuLayerView addSubview:self.menuLayerViewController.view];
    [self.detailLayerView addSubview:self.detailLayerViewController.view];
    
    _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panInFrontLayerView:)];
    
    [self.frontLayerView addGestureRecognizer:_panGestureRecognizer];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addContentAndBackgroundView
{
    
    self.frontLayerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    self.frontLayerView.backgroundColor = [UIColor blueColor];
    
    self.menuLayerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    self.detailLayerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    
    [self.view addSubview:self.detailLayerView];
    [self.view addSubview:self.menuLayerView];
    [self.view addSubview:self.frontLayerView];
    
}

- (void)panInFrontLayerView:(UIPanGestureRecognizer *)panGestureRecognizer
{
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        CGFloat translation = [panGestureRecognizer translationInView:self.frontLayerView].x;
        
        
        if (translation > 0)
        {
            if (_currentTranslation + translation < minFrontLayerPosition) {
                self.frontLayerView.transform = CGAffineTransformMakeTranslation(translation, 0);
            }
            else if(translation + _currentTranslation > frontLayerPosition)
            {
                self.frontLayerView.transform = CGAffineTransformMakeTranslation(frontLayerPosition+translation, 0);
            }
            else
            {
                self.frontLayerView.transform = CGAffineTransformMakeTranslation(translation, 0);
            }
           
                   }
        else
        {
            
            
        }
        
    }
    else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        _currentTranslation = self.frontLayerView.transform.tx;
        CGFloat translation = [panGestureRecognizer translationInView:self.frontLayerView].x;
        
        if ( _currentTranslation < minFrontLayerPosition)
        {
            [UIView animateWithDuration:0.15 animations:^{
                
                self.frontLayerView.transform = CGAffineTransformMakeTranslation(0, 0);
                
               
            }
            completion:^(BOOL finished){
                
                self.frontLayerView.userInteractionEnabled = YES;
                _currentTranslation = 0;
            }];
            
        }
        else if(translation < 0 && _currentTranslation+translation < frontLayerPosition)
        {
            [UIView animateWithDuration:0.4 animations:^{
                
                self.frontLayerView.transform = CGAffineTransformMakeTranslation(0, 0);
                
                
            }
            completion:^(BOOL finished){
                                 
                self.frontLayerView.userInteractionEnabled = YES;
                _currentTranslation = 0;
            }];

        
        }
        else
        {
            
            [UIView animateWithDuration:0.4 animations:^{
                
                self.frontLayerView.transform = CGAffineTransformMakeTranslation(frontLayerPosition, 0);
                
                
            }
            completion:^(BOOL finished){
                                 
                self.frontLayerView.userInteractionEnabled = YES;
                _currentTranslation = frontLayerPosition;
            }];

            
        }
        
    }

    
}


- (void)MenuLayerSelectItemFromTableView:(UIViewController *)controller didFinishWithData:(NSString *)tableRowNumber
{
    [UIView animateWithDuration:0.15 animations:^{
        
        self.menuLayerView.transform = CGAffineTransformMakeTranslation(180, 0);
        
        
    }
                     completion:^(BOOL finished){
                         
                         self.menuLayerView.userInteractionEnabled = YES;
                         self.menuLayerView.layer.shadowOffset = CGSizeMake(0, 0);
                         self.menuLayerView.layer.shadowColor = [UIColor blackColor].CGColor;
                         self.menuLayerView.layer.shadowOpacity = 1;

                      
                     }];

}

@end
