//
//  ViewController.h
//  Tic Tac Toe
//
//  Created by Felix-Aditya on 27/03/16.
//  Copyright © 2016 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int currentSymbol;
    
    NSMutableArray * currentState;
    
    
    NSArray * winingCombinations;
    
    int count;
    
    bool isGameFinished;
    
}
- (IBAction)buttonTapped:(UIButton *)sender;

@end

