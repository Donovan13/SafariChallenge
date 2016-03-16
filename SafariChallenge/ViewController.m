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
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *comingSoon;


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
    
    if ([webView canGoBack]) {
        [self.backButton setEnabled:YES];
    } else {
     [self.backButton setEnabled:NO];
    }
    if ([webView canGoForward]) {
        [self.forwardButton setEnabled:YES];
    }     else {
        [self.forwardButton setEnabled:NO];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)urlTextField {

//    if([self.urlTextField.text containsString:@"http://"]) {
//        NSURL *url = [NSURL URLWithString:urlTextField.text];
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        [self.webView loadRequest:request];
//        return YES;
//    } else {
//        url =[NSString stringWithFormat:@"http://%@", urlTextField.text];
//    }
   
    NSString *URLString = urlTextField.text;
    if ([URLString rangeOfString:@"http://"].location == NSNotFound && [URLString rangeOfString:@"https://"].location == NSNotFound)
    {
        URLString=[NSString stringWithFormat:@"http://%@",urlTextField.text];
    }
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self.webView loadRequest:request];
    return 0;

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




- (IBAction)displayTeaser:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Coming Soon!" message:@"We are working day and night!!" preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *Cancel = [UIAlertAction actionWithTitle: @"Go back" style:(UIAlertActionStyleCancel) handler:nil];
  
    [alert addAction:Cancel];
    
    [self presentViewController: alert animated:YES completion:nil];

}



@end

