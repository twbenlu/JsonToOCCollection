//
//  main.m
//  9_JsonToOCList
//
//  Created by benlu on 2/25/15.
//  Copyright (c) 2015 benlu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "object.h"
#import "Jastor.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSURL *url = [NSURL URLWithString:@"http://benluwebapi.azurewebsites.net/api/values"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        //取得Json資訊
        NSArray* jsonobj = [NSJSONSerialization JSONObjectWithData:data
                                                           options:NSJSONReadingMutableContainers
                                                             error:nil];
        
        NSMutableArray *Listobj = [[NSMutableArray alloc]init];
        
        //迭代出NSArray裡面的所有值，轉成物件後，存放到NSMutableArray裡面
        [jsonobj enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
            NSDictionary* array1 = [jsonobj objectAtIndex:idx];
            RootObject *product = [[RootObject alloc] initWithDictionary:array1];
            [Listobj addObject:product];
        }];
        
        //取得NSMutableArray裡面的值，一一列出。
         [Listobj enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
             RootObject *product = [Listobj objectAtIndex:idx];
             NSLog(@"title = %@, detail = %@", product.title,product.detail);
         }];
        
        
    }
    return 0;
}
