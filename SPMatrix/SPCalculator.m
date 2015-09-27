//
//  SPCalculator.m
//  SPMatrix
//
//  Created by popovychs on 21.09.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "SPCalculator.h"

@implementation SPCalculator

-(void)add:(SPMatrix*)matrix1 and:(SPMatrix*)matrix2 callback:(void (^)(SPMatrix* mtrx))completion
{
    dispatch_queue_t addQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t addGroup = dispatch_group_create();
    
    NSLog(@"---------- Addition calculation:");
    __block SPMatrix *newMatrix = [[SPMatrix alloc] initMatrixWithSize:[matrix1.column count]];
    
    for (int i = 0; i < [matrix1.column count]; i++) {
        for (int j = 0; j < [matrix1.row count]; j++) {
            
            dispatch_group_async(addGroup,addQueue, ^{
            
            NSInteger val1 = (long)[[[matrix1.column objectAtIndex:i]objectAtIndex:j]integerValue];
            NSInteger val2 = (long)[[[matrix2.column objectAtIndex:i]objectAtIndex:j]integerValue];
            NSInteger result = val1 + val2;
            [[newMatrix.column objectAtIndex:i] replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:result]];
                });
        }
    }

    dispatch_group_wait(addGroup, DISPATCH_TIME_FOREVER);
    completion(newMatrix);
}

-(void)sub:(SPMatrix*)matrix1 and:(SPMatrix*)matrix2 callback:(void (^)(SPMatrix* mtrx))completion
{
    dispatch_queue_t subQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t subGroup = dispatch_group_create();
    
    NSLog(@"---------- Subtraction calculation:");
    __block SPMatrix *newMatrix = [[SPMatrix alloc] initMatrixWithSize:[matrix1.column count]];
    
        for (int i = 0; i < [matrix1.column count]; i++) {
                for (int j = 0; j < [matrix1.row count]; j++) {
                    
                    dispatch_group_async(subGroup,subQueue, ^{
                
                CGFloat val1 = [[[matrix1.column objectAtIndex:i]objectAtIndex:j]floatValue];
                CGFloat val2 = [[[matrix2.column objectAtIndex:i]objectAtIndex:j]floatValue];
                CGFloat result = val1 - val2;
            [[newMatrix.column objectAtIndex:i] replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:result]];
                        });
                }
        }
    dispatch_group_wait(subGroup, DISPATCH_TIME_FOREVER);
    completion(newMatrix);
}

-(void)mult:(SPMatrix*)matrix1 and:(SPMatrix*)matrix2 callback:(void (^)(SPMatrix* mtrx))completion
{
    NSLog(@"---------- Multiplying calculation:");
    NSUInteger matrixCapacity=[matrix1.column count];
    SPMatrix *newMatrix = [[SPMatrix alloc] initMatrixWithSize:matrixCapacity];
    
    dispatch_queue_t multQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t multGroup = dispatch_group_create();
    
        for (int i = 0; i < [matrix1.column count]; i++) {
            for (int j = 0; j < [matrix1.row count]; j++) {
                
                    dispatch_group_async(multGroup,multQueue, ^{
                
                [[newMatrix.column objectAtIndex:i ]replaceObjectAtIndex:j withObject:[NSNumber numberWithInt:0]];
                
                for (int k = 0; k < [matrix1.column count]; k++) {
                    
                    CGFloat val1 = [[[newMatrix.column objectAtIndex:i]objectAtIndex:j]floatValue];
                    CGFloat val2 = [[[matrix1.column objectAtIndex:i]objectAtIndex:k]floatValue];
                    CGFloat val3 = [[[matrix2.column objectAtIndex:k]objectAtIndex:j]floatValue];
                    val1 = val1 + val2 * val3;
                    
                    [[newMatrix.column objectAtIndex:i ]replaceObjectAtIndex:j withObject:[NSNumber numberWithInt:val1]];
                }
            });
        }
    }
    dispatch_group_wait(multGroup, DISPATCH_TIME_FOREVER);
    completion(newMatrix);
}

@end
