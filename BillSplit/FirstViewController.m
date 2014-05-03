//
//  FirstViewController.m
//  BillSplit
//
//  Created by Wai Hoe Yuen on 5/1/14.
//  Copyright (c) 2014 terryxlife. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UITextField *price1;
@property (weak, nonatomic) IBOutlet UITextField *price2;
@property (weak, nonatomic) IBOutlet UITextField *price3;
@property (weak, nonatomic) IBOutlet UITextField *govTax;
@property (weak, nonatomic) IBOutlet UITextField *servTax;

@property (weak, nonatomic) IBOutlet UITextField *total;

- (IBAction)calculate:(id)sender;
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // [self displayTheKeyboard];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) displayTheKeyboard {
    [self.price1 becomeFirstResponder];
}

- (void) textFieldDidEndEditing:(UITextField *) textField {
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)calculate:(id)sender {
    [self.price1 resignFirstResponder];
    [self.price2 resignFirstResponder];
    [self.price3 resignFirstResponder];
    [self.govTax resignFirstResponder];
    [self.servTax resignFirstResponder];
}
@end
