//
//  GeoMapsViewController.m
//  GeoMaps
//
//  Created by Juan Alberto López Cavallotti on 12/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GeoMapsViewController.h"
#import <MapKit/MapKit.h>

@interface GeoMapsViewController ()

@property (nonatomic,strong)CLLocationManager* locMgr;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic,strong)CLGeocoder* geocoder;
@end

@implementation GeoMapsViewController
@synthesize latitudeLabel = _latitudeLabel;
@synthesize longitudeLabel = _longitudeLabel;
@synthesize nameLabel = _nameLabel;
@synthesize locMgr = _locMgr;
@synthesize geocoder = _geocoder;
@synthesize mapView = _mapView;

//configuracion de la ubicacion.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //inicializar el geolocalizador.
    self.geocoder = [[CLGeocoder alloc] init];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.locMgr = [[CLLocationManager alloc] init];
    self.locMgr.delegate = self;
    self.locMgr.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    
    //verificar que el usuario haya autorizado el servicio antes de utilizar la ubicacion
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied) {
        [self.locMgr startUpdatingLocation];
    }
    
    
    //find if there is any last location.
    CLLocation *loc = self.locMgr.location;
    
    if (!loc) {
        return;
    }
    
    self.latitudeLabel.text = [NSString stringWithFormat:@"%f",loc.coordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%f",loc.coordinate.longitude];
    
    MKPlacemark* placeMark = [[MKPlacemark alloc] initWithCoordinate:loc.coordinate addressDictionary:nil];
    [self.mapView addAnnotation:placeMark];
    [self.mapView setCenterCoordinate:loc.coordinate animated:YES];
}

- (void)viewDidUnload
{
    [self setLatitudeLabel:nil];
    [self setLongitudeLabel:nil];
    [self setMapView:nil];
    [self setNameLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    if ([newLocation distanceFromLocation:oldLocation] < 100) {
        NSLog(@"Actualizacion no significativa");
        return;
    }
    
    CLLocationCoordinate2D newLoc = newLocation.coordinate;
    
    if ([newLocation.timestamp compare:oldLocation.timestamp] == NSOrderedAscending) {
        NSLog(@"Actualizacion demasiado vieja.");
        return;
    }
    
    if (newLocation.horizontalAccuracy > 100 || newLocation.verticalAccuracy > 100) {
        NSLog(@"Actualizacion imprecisa");
        return;
    }
    
    
    //actualizar la pantalla
    NSLog(@"Updated Loc!!");
    self.latitudeLabel.text = [NSString stringWithFormat:@"%f",newLocation.coordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%f",newLocation.coordinate.longitude];
    
    
    //obtener la ultima marca para saber si es necesario eliminarla
    MKPlacemark *oldPm = [self.mapView.annotations lastObject];
    
    //crear la nueva marca
    MKPlacemark *pm = [[MKPlacemark alloc] initWithCoordinate:newLoc addressDictionary:nil];
    [self.mapView addAnnotation:pm];
    [self.mapView setCenterCoordinate:newLoc animated:YES];
    
    //si habia marca anterior, removerla
    if (oldPm) {
        [self.mapView removeAnnotation:oldPm];
    }
    
    //ejecutar un geocoding inverso para averiguar el nombre del lugar
    [self.geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray* data, NSError* error){
        if (error) {
            NSLog(@"Hubo un error");
        }
        CLPlacemark* pm = [data lastObject];
        self.nameLabel.text = pm.country;
        
    }];
}

@end
