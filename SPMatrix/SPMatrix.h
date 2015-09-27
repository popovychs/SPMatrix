//
//  SPMatrix.h
//  SPMatrix
//
//  Created by popovychs on 20.09.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPMatrix : NSObject

@property (strong,nonatomic) NSMutableArray *row;
@property (strong, nonatomic) NSMutableArray *column;

-(id)initMatrixWithSize:(NSInteger)size;
-(void)showMatrixOnScreen;

@end
