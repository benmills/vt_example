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

#import "ManualFormViewController.h"

@interface ViewController () <BTPaymentViewControllerDelegate>
@property (nonatomic, strong) BTPaymentViewController *btpvc;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[VTClient sharedVTClient] refresh];

 }

- (IBAction)tappedPayShit:(id)sender {
    NSLog(@"YOu pushed da button");
    self.btpvc = [BTPaymentViewController paymentViewControllerWithVenmoTouchEnabled:YES];
    [self.btpvc setDelegate:self];

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.btpvc];

    self.btpvc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissItNow)];
    NSLog(@"%@, %@", self.btpvc, nav);

    [self presentViewController:nav animated:YES completion:nil];
}
- (IBAction)refreshPleaseTapped:(id)sender {
    [[VTClient sharedVTClient] refresh];
}
- (IBAction)tappedManualForm:(id)sender {
    [self presentViewController:[[ManualFormViewController alloc] init] animated:YES completion:nil];
}

- (void)dismissItNow {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark VT shit

- (void)paymentViewController:(BTPaymentViewController *)paymentViewController didSubmitCardWithInfo:(NSDictionary *)cardInfo andCardInfoEncrypted:(NSDictionary *)cardInfoEncrypted {
    NSLog(@"Got card info: %@", cardInfo);
    NSLog(@"Dismissing BTPVC and refreshing VTClient!");

    #warning To finish implementing VT, you need to submit the card to the merchant server. Only call the next few lines on a callback when the network call to fulfill the order with the merchant server is successful.

    [self.btpvc prepareForDismissal];
    [self dismissViewControllerAnimated:YES completion:nil];

    [[VTClient sharedVTClient] refresh];
}

@end
