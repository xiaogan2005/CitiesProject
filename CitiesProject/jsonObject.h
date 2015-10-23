//
//  jsonObject.h
//  CitiesProject
//
//  Created by GuoRui on 10/22/15.
//  Copyright © 2015 GuoRui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jsonObject : NSObject
@property NSString *fcodeName;
@property NSString *toponymName;
@property NSString *countrycode;
@property NSString *fclName;
@property NSString *name;
@property NSString *wikipedia;
@property NSString *lng;
@property NSString *lat;
@property NSString *geonameId;
@property NSString *fcode;
@property NSString *fcl;
@property NSString *population;

@end
//json format
//"fcodeName": "capital of a political entity",
//"toponymName": "Mexico City",
//"countrycode": "MX",
//"fcl": "P",
//"fclName": "city, village,...",
//"name": "Mexiko-Stadt",
//"wikipedia": "en.wikipedia.org/wiki/Mexico_City",
//"lng": -99.12766456604,
//"fcode": "PPLC",
//"geonameId": 3530597,
//"lat": 19.428472427036,
//"population": 12294193