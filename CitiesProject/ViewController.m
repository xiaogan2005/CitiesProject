//
//  ViewController.m
//  CitiesProject
//    function: 1.use webcall get array of json objects and send to next table view
//  2.a button click function to push segue and past data 
//  Created by GuoRui on 10/22/15.
//  Copyright © 2015 GuoRui. All rights reserved.
//

#import "ViewController.h"
#import "jsonObject.h"
#import "TableViewController.h"
@interface ViewController ()

@property NSMutableArray *arr_objs;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _arr_objs=[[NSMutableArray alloc]init];
     [self webServiceCall];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark web service methods
-(void)webServiceCall{
    //same procecure
    NSString *str_url=@"http://api.geonames.org/citiesJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&lang=de&username=demo";
    NSURL *url=[NSURL URLWithString:str_url];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        //NSLog(@"the data is %@",data);
        //NSLog(@"the response is %@",response);
        // need to change the data into visible format ,or it just hex-number, use [ description]
        
        //id no pointer needed, cause id is pointer
        //error is same with error message, use &
        id object=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if(error){
            NSLog(@"there is error:%@",error);
            
        }else{
           // NSLog(@"the data is:%@",[object description]);
            if(object){
                //if object is not nil
                NSLog(@"call jsonObject mehtod");
                [self jsonObjectWithData:object];}
        }
        
    }];
    
    //data task should continue
    [dataTask resume];
}
-(void)jsonObjectWithData:(id) object{
    
    
    if([object isKindOfClass:[NSDictionary class]]){
        NSDictionary *dict_main=object;
        NSLog(@"the main dict is%@",dict_main);
        NSArray *arr_result=[dict_main objectForKey:@"geonames"];
        NSLog(@"the result is:%@",arr_result);
        
        for(int i=0;i<arr_result.count;i++){
            NSDictionary *dict_temp=arr_result[i];
            
            NSString *fcodeName=[dict_temp objectForKey:@"fcodeName"];
            
            NSString *toponymName=[dict_temp objectForKey:@"toponymName"];
            NSString *countrycode=[dict_temp objectForKey:@"countrycode"];
            
            NSString *fcl=[dict_temp objectForKey:@"fcl"];
            NSString *name=[dict_temp objectForKey:@"name"];
           
            NSString *wikipedia=[dict_temp objectForKey:@"wikipedia"];
            
            NSString *lat=[dict_temp objectForKey:@"lat"];
            //NSLog(@"the lat is:%@",lat);
            NSString *lng=[dict_temp objectForKey:@"lng"];
            
            NSString *fcode=[dict_temp objectForKey:@"fcode"];
            NSString *population=[dict_temp objectForKey:@"population"];
            NSString *geonameId=[dict_temp objectForKey:@"geonameId"];
            jsonObject  *obj=[[jsonObject alloc]init];
            obj.fcodeName=fcodeName;
            obj.toponymName =toponymName;
            obj.countrycode=countrycode;
            obj.fcl=fcl;
            obj.name =name;
            obj.wikipedia=wikipedia;
            obj.lat=lat;
            obj.lng =lng;
            obj.fcode=fcode;
            obj.population=population;
            obj.geonameId =geonameId;
            
            
            
            [_arr_objs addObject:obj];
            
         
           
        }
        
        
        
    }
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //  [self webServiceCall]; not using it in bt click action or here
    //cause it cause trouble
    //it will call this method and push to next page
   
    
    if([[segue identifier] isEqualToString:@"gotoTableView"]){
        TableViewController *viewController=[segue destinationViewController];
        
        NSLog(@"going to tableview");
       
        viewController.arr_objs=_arr_objs;
        
       
        
        
        
    }
    
}
@end
