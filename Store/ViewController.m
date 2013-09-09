//
//  ViewController.m
//  Store
//
//  Created by Benjamin Mills on 9/9/13.
//  Copyright (c) 2013 Benjamin Mills. All rights reserved.
//

#import "ViewController.h"
#import <VenmoTouch/VenmoTouch.h>
#import <Braintree/BTPaymentViewController.h>

@interface ViewController () <BTPaymentViewControllerDelegate>
@property (nonatomic, strong) BTPaymentViewController *view;
@property (nonatomic, strong) UINavigationController *nav;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PayShit:(id)sender {
    BTPaymentViewController *newView = [BTPaymentViewController paymentViewControllerWithVenmoTouchEnabled:YES];
    self.view.delegate = self;
    self.nav = [[UINavigationController alloc] initWithRootViewController:self.view];
    
    [self presentViewController:self.nav animated:NO completion:nil];
}

#pragma mark VT shit

- (void)paymentViewController:(BTPaymentViewController *)paymentViewController didSubmitCardWithInfo:(NSDictionary *)cardInfo andCardInfoEncrypted:(NSDictionary *)cardInfoEncrypted {
    [self.view prepareForDismissal];
    [self dismissViewControllerAnimated:NO completion:nil];
    
    NSLog(@"%@", cardInfo);
}

- (void)paymentViewController:(BTPaymentViewController *)paymentViewController didAuthorizeCardWithPaymentMethodCode:(NSString *)paymentMethodCode {
    
    
}
@end
