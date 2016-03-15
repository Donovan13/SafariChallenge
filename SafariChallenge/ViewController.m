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
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIWebView *onBackButtonPressed;
- (IBAction)onForwardButtonPressed:(UIButton *)sender;
- (IBAction)onStopLoadingButtonPressed:(UIButton *)sender;
- (IBAction)onReloadButtonPressed:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadRequestWithString: @"http://www.mobilemakers.co"];
    
}

- (void) loadRequestWithString: (NSString *)string {
    NSURL *url = [NSURL URLWithString: string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
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

- (IBAction)onBackButtonPressed:(UIButton *)sender {
    [self.webView goBack];
}
- (IBAction)onForwardButtonPressed:(UIButton *)sender {
    [self.webView goForward];
}

- (IBAction)onStopLoadingButtonPressed:(UIButton *)sender {
    [self.webView stopLoading];
}

- (IBAction)onReloadButtonPressed:(UIButton *)sender {
    [self.webView reload];
}

@end

