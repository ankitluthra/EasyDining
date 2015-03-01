//
//  ViewController.m
//  EasyDining
//
//  Created by Ankit Luthra on 2/28/15.
//  Copyright (c) 2015 Hackillinois. All rights reserved.
//


#import "ViewController.h"

#import <GoogleMaps/GoogleMaps.h>
#import <GoogleMaps/GMSMapView.h>




@interface ViewController ()

@end

@implementation ViewController {
    GMSMapView *mapView_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.107760
                                                            longitude:-88.226927
                                                                 zoom:15];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(40.107760, -88.226927);
    marker.title = @"Main Quad";
    marker.snippet = @"Menu \n Rate Food";
    //marker.snippet = @"Rate Food";
    marker.map = mapView_;
    
    CLLocationCoordinate2D position2 = CLLocationCoordinate2DMake(40.103758, -88.235396);
    GMSMarker *marker2 = [GMSMarker markerWithPosition:position2];
    marker2.title = @"Ikenberry Dining Hall";
    marker2.snippet = @"Menu \n Rate Food";
    //marker2.snippet = @"Rate Food";
    marker2.map = mapView_;
    
    CLLocationCoordinate2D position3 = CLLocationCoordinate2DMake(40.109939, -88.220980);
    GMSMarker *marker3 = [GMSMarker markerWithPosition:position3];
    marker3.title = @"ISR";
    marker3.snippet = @"Menu \n Rate Food";
    //marker3.snippet = @"Rate Food";
    marker3.map = mapView_;
    
    CLLocationCoordinate2D position4 = CLLocationCoordinate2DMake(40.104156, -88.220341);
    GMSMarker *marker4 = [GMSMarker markerWithPosition:position4];
    marker4.title = @"Lincoln/Allen";
    marker4.snippet = @"Menu \n Rate Food";
    //marker4.snippet = @"Rate Food";
    marker4.map = mapView_;
    
    CLLocationCoordinate2D position5 = CLLocationCoordinate2DMake(40.099795, -88.220456);
    GMSMarker *marker5 = [GMSMarker markerWithPosition:position5];
    marker5.title = @"Pennsylvania Avenue (PAR)";
    marker5.snippet = @"Menu\n  Rate Food";
    //marker5.snippet = @"Rate Food";
    marker5.map = mapView_;
    
    CLLocationCoordinate2D position6 = CLLocationCoordinate2DMake(40.099052, -88.220951);
    GMSMarker *marker6 = [GMSMarker markerWithPosition:position6];
    marker6.title = @"FAR";
    marker6.snippet = @"Menu  Rate Food";
    //marker6.snippet = @"Rate Food";
    marker6.map = mapView_;
    
    CLLocationCoordinate2D position7 = CLLocationCoordinate2DMake(40.105556, -88.222798);
    GMSMarker *marker7 = [GMSMarker markerWithPosition:position7];
    marker7.title = @"Busey Evans";
    marker7.snippet = @"Menu  Rate Food";
    //marker7.snippet = @"Rate Food";
    marker7.map = mapView_;
    
    marker.icon = [GMSMarker markerImageWithColor:[UIColor blackColor]];
    marker2.icon = [GMSMarker markerImageWithColor:[UIColor greenColor]];
    marker3.icon = [GMSMarker markerImageWithColor:[UIColor colorWithRed:(CGFloat)26/256
                                                                   green:(CGFloat)188/256
                                                                    blue:(CGFloat)156/256
                                                                   alpha:1.0]];
   }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end