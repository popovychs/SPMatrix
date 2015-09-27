//
//  SPCalculator.h
//  SPMatrix
//
//  Created by popovychs on 21.09.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPMatrix.h"

@interface SPCalculator : NSObject

-(void)add:(SPMatrix*)matrix1 and:(SPMatrix*)matrix2 callback:(void (^)(SPMatrix* mtrx))completion;
-(void)sub:(SPMatrix*)matrix1 and:(SPMatrix*)matrix2 callback:(void (^)(SPMatrix* mtrx))completion;
-(void)mult:(SPMatrix*)matrix1 and:(SPMatrix*)matrix2 callback:(void (^)(SPMatrix* mtrx))completion;

@end
