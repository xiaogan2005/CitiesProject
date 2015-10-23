//
//  WebViewController.m
//  CitiesProject
//
//  Created by GuoRui on 10/23/15.
//  Copyright © 2015 GuoRui. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView_1;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *urlWithHttps=[NSString stringWithFormat:@"https://%@",_url];
    NSLog(@"web view load");
    NSLog(@"url is %@",urlWithHttps);
    NSURL *url=[NSURL URLWithString:urlWithHttps];
    
    NSURLRequest *urlRequest=[NSURLRequest requestWithURL:url];
    [_webView_1 loadRequest:urlRequest];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
