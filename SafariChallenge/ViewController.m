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
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void) webViewDidStartLoad:(UIWebView *)webView {
    [self.spinner startAnimating];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.spinner stopAnimating];
}


- (BOOL)textFieldShouldReturn:(UITextField *)urlTextField {
    NSURL *url = [NSURL URLWithString:urlTextField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    return YES;
}



@end
