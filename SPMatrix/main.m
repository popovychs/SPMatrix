//
//  main.m
//  SPMatrix
//
//  Created by popovychs on 20.09.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPMatrix.h"
#import "SPCalculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        SPMatrix *m1 = [[SPMatrix alloc]initMatrixWithSize:7];
        [m1 showMatrixOnScreen];
        SPMatrix *m2 = [[SPMatrix alloc]initMatrixWithSize:7];
        [m2 showMatrixOnScreen];
        
        SPCalculator *calc1 = [[SPCalculator alloc]init];
        [calc1 add:m1 and:m2 callback:^(SPMatrix *mtrx) {
            [mtrx showMatrixOnScreen];
        }];
        
        SPCalculator *calc2 = [[SPCalculator alloc]init];
        [calc2 sub:m1 and:m2 callback:^(SPMatrix *mtrx) {
            [mtrx showMatrixOnScreen];
        }];
        
        SPCalculator *calc3 = [[SPCalculator alloc]init];
        [calc3 mult:m1 and:m2 callback:^(SPMatrix *mtrx) {
            [mtrx showMatrixOnScreen];
        }];
        
    }
    return 0;
}
