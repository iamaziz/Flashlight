//
//  PSTaggedText+ToNestedDictionaries.m
//  Parsnip2
//
//  Created by Nate Parrott on 12/24/14.
//  Copyright (c) 2014 Nate Parrott. All rights reserved.
//

#import "PSTaggedText+ToNestedDictionaries.h"
#import "PSHelpers.h"

@implementation PSTaggedText (ToNestedDictionaries)

- (NSDictionary *)toNestedDictionary {
    NSMutableDictionary *d = [NSMutableDictionary new];
    for (id child in self.contents) {
        if ([child isKindOfClass:[PSTaggedText class]]) {
            id tag = [child tag];
            NSDictionary *nestedDict = [child toNestedDictionary];
            d[tag] = nestedDict.count > 0 ? nestedDict : [child _getText];
        }
    }
    return d;
}

- (NSString *)_getText {
    return [[self.contents mapFilter:^id(id obj) {
        return [obj isKindOfClass:[NSString class]] ? obj : nil;
    }] componentsJoinedByString:@" "];
}

@end
