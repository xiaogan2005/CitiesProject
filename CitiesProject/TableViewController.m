//
//  TableViewController.m
//  CitiesProject
//  function: 1 display info
//              2.push and send obj to next view
//  Created by GuoRui on 10/22/15.
//  Copyright © 2015 GuoRui. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"
@interface TableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView_1;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@" Result List";
    
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

#pragma mark segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"gotoDetailView"]) {
        //NSLog(@"%@");
        NSLog(@"segue is :%@",[segue identifier]);
        DetailViewController *viewController =[segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView_1 indexPathForSelectedRow];
        viewController.obj = [self.arr_objs objectAtIndex:myIndexPath.row];
    }
    
    
    
}

#pragma mark table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr_objs.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    jsonObject *obj = [_arr_objs objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"CityName: %@",obj.name];
    
    //the price will automaticlly convert back to integer, it's wired as shit
    cell.detailTextLabel.text = [NSString stringWithFormat:@"country code: %@",obj.countrycode];
    
    return cell;
    
}

@end
