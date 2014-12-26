//
//  PSEndNode.m
//  Parsnip2
//
//  Created by Nate Parrott on 12/21/14.
//  Copyright (c) 2014 Nate Parrott. All rights reserved.
//

#import "PSEndNode.h"

@implementation PSEndNode

- (NSString *)tag {
    return @"$END";
}

+ (BOOL)isNameOfEndNode:(NSString *)name {
    return [name isEqualToString:@"$END"];
}

@end
