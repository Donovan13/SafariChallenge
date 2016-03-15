//
//  ViewController.m
//  SafariChallenge
//
//  Created by Kyle on 3/15/16.
//  Copyright © 2016 Kyle. All rights reserved.
//
// This is a new comment from Scot.

#import "ViewController.h"


@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  

}

- (void) textFieldShouldReturn: UITextFieldDelegate {
    
    
    
}


@end
