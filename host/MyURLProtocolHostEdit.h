//
//  MyURLProtocolHostEdit.h
//  HostWebView
//
//  Created by 陈建峰 on 16/4/1.
//  Copyright © 2016年 helloChimpanzee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyURLProtocolHostEdit : NSURLProtocol
+ (void)addHost:(NSString*)host ip:(NSString *)ip;
@end
