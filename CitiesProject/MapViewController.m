//
//  MapViewController.m
//  CitiesProject
//
//  Created by GuoRui on 10/22/15.
//  Copyright © 2015 GuoRui. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView_1;
@property (nonatomic, strong) CLGeocoder *geocoder;
@property (nonatomic, strong) MKPlacemark *placemark;
@property  (nonatomic, strong)CLLocationManager *CLLManager_1;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self mapInit];
    
    self.navigationItem.title=@"Map View";
    [_CLLManager_1 startUpdatingLocation];
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

#pragma mark location and map methods
-(void) mapInit{
    _mapView_1.delegate=self;
    _CLLManager_1=[[CLLocationManager alloc]init];
    _CLLManager_1.delegate=self;
    if([_CLLManager_1 respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        [_CLLManager_1 requestWhenInUseAuthorization];
        
    }
    [_CLLManager_1 setDesiredAccuracy:kCLLocationAccuracyBest];
    
    
    _mapView_1.showsUserLocation=YES;
    
    //show point in map
    
    MKPointAnnotation *point=[[MKPointAnnotation alloc]init];
    point.coordinate=CLLocationCoordinate2DMake([_obj.lat floatValue], [_obj.lng floatValue]);//
    // NSLog(@"lag %@, lng %@", _obj.lat,_obj.str_lng);
    NSLog(@"%@",[point description]);
    point.title=_obj.name;
    point.subtitle=_obj.wikipedia;
    [self.mapView_1 addAnnotation:point];
    
    
    
    //zoom and center
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(point.coordinate, 3000, 3000);
    [self.mapView_1 setRegion:[_mapView_1 regionThatFits:region]animated:YES];
}

#pragma mark zoom a map using button

- (IBAction)click_bt_zoomIn:(id)sender {
    [self  zoomMap:_mapView_1 byDelta:0.5];
}
- (IBAction)click_bt_zoomOut:(id)sender {
    [self  zoomMap:_mapView_1 byDelta:2.0];
}

// delta is the zoom factor
// 2 will zoom out x2
// .5 will zoom in by x2
- (void)zoomMap:(MKMapView*)mapView byDelta:(float) delta {
    
    MKCoordinateRegion region = mapView.region;
    MKCoordinateSpan span = mapView.region.span;
    span.latitudeDelta*=delta;
    span.longitudeDelta*=delta;
    region.span=span;
    [mapView setRegion:region animated:YES];
    
}

//static version dont need this
//# pragma  mark will update all the time.
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
//    CLLocation *location=locations.lastObject;
//    //@.6f float with 6 digit after zero
//    NSLog(@"lat value is %.6f, lng value is %.6f",location.coordinate.latitude,location.coordinate.longitude);
//    
//    
//    
//    //region should not be pointer, dont know why
//    
//    //control  center and zoom for phone location
//  
//   
//    
//    
//    
//}



//handle the case when GPS cant be used
-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"the error message is:%@",error.localizedDescription);
}

#pragma mark for each Annotation is map, this method control the view and animation of annotation
- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView *annotationview = nil;
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    
    static NSString *str =@"Identifier";
    MKPinAnnotationView *areaPin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:str];
    if (!areaPin)
    {
        MKPinAnnotationView *areaPin =[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:str];
        areaPin.pinTintColor = [self randomColor];
        areaPin.animatesDrop = YES;
        areaPin.canShowCallout = YES;
        areaPin.pinTintColor=[self randomColor];//NSColor UIColor
        annotationview = areaPin;
        
        
        
    }
    return annotationview;
}

-(UIColor *)randomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return  color;
}



@end
