//
//  SPMatrix.m
//  SPMatrix
//
//  Created by popovychs on 20.09.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "SPMatrix.h"

@implementation SPMatrix

@synthesize row;
@synthesize column;

-(id)initMatrixWithSize:(NSInteger)size
{
    self = [super init];
    if (self){
            self.column=[[NSMutableArray alloc] init];
                for(int i = 0; i < size; i++) {
                    self.row = [[NSMutableArray alloc]init];
                    for(int j = 0; j < size; j++){
                        [self.row addObject:[NSNumber numberWithInteger:arc4random()%101]];
                    }
                        [self.column addObject:self.row];
                    }
    }
    return self;
}

-(void)showMatrixOnScreen
{
    NSLog(@"--------------------------------------");
    for (int i = 0; i < [self.column count]; i++) {
         NSString* someString=@"";
        for (int j = 0; j < [self.row count]; j++) {
            NSString* anotherString=[NSString stringWithFormat:@"%ld  ",(long)[[[self.column objectAtIndex:i]objectAtIndex:j]integerValue]];
            someString=[someString stringByAppendingString:anotherString];
        }
         NSLog(@"%@", someString);
    }
}

@end
