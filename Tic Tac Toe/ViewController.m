//
//  ViewController.m
//  Tic Tac Toe
//
//  Created by Felix-Aditya on 27/03/16.
//  Copyright © 2016 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //if currentSymbol = 1 then print cross on button
    //if currentSymbol = 2 then print nought on button
    
    isGameFinished = false;
    
    currentSymbol = 1;
    
    count = 0;
    
    currentState = [NSMutableArray arrayWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
    
    
    winingCombinations = @[@[@0,@1,@2],
                           @[@3,@4,@5],
                           @[@6,@7,@8],
                           @[@0,@3,@6],
                           @[@1,@4,@7],
                           @[@2,@5,@8],
                           @[@0,@4,@8],
                           @[@2,@4,@6],
                           ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(UIButton *)sender
{
    
    if ([[currentState objectAtIndex:sender.tag] isEqual:@0] && isGameFinished == false)
    {
        
        count = count + 1;
        
        if (currentSymbol == 1)
        {
            [sender setBackgroundImage:[UIImage imageNamed:@"x1.png"] forState:UIControlStateNormal];
            
            [currentState replaceObjectAtIndex:sender.tag withObject:@1];
            
            currentSymbol = 2;
        }
        else
        {
            [sender setBackgroundImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
            [currentState replaceObjectAtIndex:sender.tag withObject:@2];
            currentSymbol = 1;
        }
        
        
        if (count >= 5)
        {
            for (NSArray * combination in winingCombinations)
            {
                int i = [[combination objectAtIndex:0]intValue];
                int j = [[combination objectAtIndex:1]intValue];
                int k = [[combination objectAtIndex:2]intValue];
                
                
                
                NSNumber * firstElement = [currentState objectAtIndex:i];
                NSNumber * secondElement = [currentState objectAtIndex:j];
                NSNumber * thirdElement = [currentState objectAtIndex:k];
                
                if (![firstElement isEqual:@0] && [firstElement isEqual:secondElement] && [secondElement isEqual:thirdElement])
                {
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Title" message:@"Winner" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                    //alert.alertViewStyle = UIAlertViewStylePlainTextInput;
                    [alert show];
                    

                    
                    NSLog(@"We have a winner");
                    
                    isGameFinished = true;
                    
                    break;
                }
                else{
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Title" message:@"Game Over" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                    //alert.alertViewStyle = UIAlertViewStylePlainTextInput;
                    [alert show];
                }
                
                
            }
        }
        
        
        
    }
    
    
}
@end
