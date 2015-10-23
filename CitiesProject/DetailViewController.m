//
//  DetailViewController.m
//  CitiesProject
//
//  Created by GuoRui on 10/22/15.
//  Copyright © 2015 GuoRui. All rights reserved.
//

#import "DetailViewController.h"
#import "MapViewController.h"
@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lb_cityName;
@property (weak, nonatomic) IBOutlet UITextView *tv_1;
- (IBAction)click_bt_display:(id)sender;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lb_cityName.text=_obj.name;
    NSMutableString *str=[[NSMutableString alloc]init];
    self.navigationItem.title=@"Detail";

    [str appendString:[NSString stringWithFormat:@"name = %@ \r",_obj.name]];
    [str appendString:[NSString stringWithFormat:@"lattitude= %@ \r",_obj.lat]];
   [str appendString:[NSString stringWithFormat:@"longtitude= %@ \r",_obj.lng]];
    [str appendString:[NSString stringWithFormat:@"population = %@ \r",_obj.population]];
    [str appendString:[NSString stringWithFormat:@"wiki link = %@ \r",_obj.wikipedia]];
    
    _tv_1.text=str;
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

- (IBAction)click_bt_display:(id)sender {
}


#pragma mark segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"gotoMapView"]) {
        //NSLog(@"%@");
        NSLog(@"segue is :%@",[segue identifier]);
        MapViewController *viewController =[segue destinationViewController];
        
        viewController.obj = _obj;
    }
    
    
    
}
@end
