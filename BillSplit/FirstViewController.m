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
@property (weak, nonatomic) IBOutlet UITextField *tax;
@property (weak, nonatomic) IBOutlet UITextField *totalprice;
@property (weak, nonatomic) IBOutlet UILabel *totaltax;


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

- (void) displayPrice1:(double) price1 {
    
}

- (IBAction)calculate:(id)sender {
    
    //format decimal
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *price1num = [nf numberFromString:self.price1.text];
    NSNumber *price2num = [nf numberFromString:self.price2.text];
    NSNumber *price3num = [nf numberFromString:self.price3.text];
    
    //format percentage
    NSNumberFormatter *perc = [[NSNumberFormatter alloc] init];
    NSNumber *taxnum = [perc numberFromString:self.tax.text];
    
    double price1 = [price1num doubleValue];
    double price2 = [price2num doubleValue];
    double price3 = [price3num doubleValue];
    int tax = [taxnum intValue];
    
    double totalprice = price1 + price2 + price3;
    double totaltax = totalprice * tax / 100;
    double totalCost = totalprice + totaltax;
    
    NSNumber *totalTaxNumber = [NSNumber numberWithDouble:totaltax];
    
    NSNumber *totalCostNumber = [NSNumber numberWithDouble:totalCost];
    
   NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    self.totaltax.text = [nf stringFromNumber:totalTaxNumber];
    self.totalprice.text = [currencyFormatter stringFromNumber:totalCostNumber];
    
    [self.price1 resignFirstResponder];
    [self.price2 resignFirstResponder];
    [self.price3 resignFirstResponder];
    [self.tax resignFirstResponder];
}
@end
