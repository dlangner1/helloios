//
//  ViewController.m
//  Hello
//
//  Created by Dustin Langner on 1/9/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>

@interface ViewController ()

@property NSArray *textPhrases;
@property int textPhraseIndex;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.textPhraseIndex = 0;
    self.textPhrases = @[@"Hello World!", @"Go Seahawks!", @"Go Dawgs!", @"Cougs Suck!"];
    
    [self setUpHelloWorld];
}

- (void)setUpHelloWorld
{
    // Set state for textDisplay button
    self.textDisplayButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.textDisplayButton setTitle:self.textPhrases[self.textPhraseIndex] forState:UIControlStateNormal];
    [self.textDisplayButton setTitleColor:self.view.tintColor forState:UIControlStateNormal];
    [self.textDisplayButton.titleLabel setFont:[UIFont systemFontOfSize:40.0]];
    self.textDisplayButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self.textDisplayButton addTarget:self action:@selector(displayedTextPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.textDisplayButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Add button as subiew
    [self.view addSubview:self.textDisplayButton];
    
    // Set autolayout constraints
    [self.textDisplayButton.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.textDisplayButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.textDisplayButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [self.textDisplayButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}
     
- (void)displayedTextPressed:(UIButton *)sender
{
    self.textPhraseIndex++;
    if (self.textPhraseIndex >= self.textPhrases.count) {
        self.textPhraseIndex = 0;
    }
    [self.textDisplayButton setTitle:self.textPhrases[self.textPhraseIndex] forState:UIControlStateNormal];
}

@end
