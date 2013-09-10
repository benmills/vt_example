//
//  ManualFormViewController.m
//  Store
//
//  Created by Mickey Reiss on 9/9/13.
//  Copyright (c) 2013 Benjamin Mills. All rights reserved.
//

#import "ManualFormViewController.h"


@interface ManualFormViewController ()

@end

@implementation ManualFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[VTClient sharedVTClient] setDelegate:self];

    if ([[VTClient sharedVTClient] liveStatus] != VTLiveStatusYes) {
        NSLog(@"Can't display card view because account is not live");
        @throw NSInternalInconsistencyException;
    }

    if ([[VTClient sharedVTClient] paymentMethodOptionStatus] != VTPaymentMethodOptionStatusYes) {
        NSLog(@"Can't display card view because payment method option status is not loaded");
        @throw NSInternalInconsistencyException;
    }

    UIView *cardView = [[VTClient sharedVTClient] cardView];
    cardView.frame = CGRectMake(10, 10, 280, 300);
    [self.view addSubview:cardView];
}


- (void)client:(VTClient *)client approvedPaymentMethodWithCodeAndCard:(VTPaymentMethodCode *)paymentMethodCode {
    NSLog(@"approvedPaymentMethodWithCodeAndCard: %@", paymentMethodCode);
}

- (void)client:(VTClient *)client approvedPaymentMethodWithCode:(NSString *)paymentMethodCode {
    NSLog(@"approvedPaymentMethodWithCode: %@", paymentMethodCode);
}

@end
