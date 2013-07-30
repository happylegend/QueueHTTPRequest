//
//  MyQueueHTTPRequest.m
//  MyQueueHTTPRequest
//
//  Created by 紫冬 on 13-7-30.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

#import "MyQueueHTTPRequest.h"

@implementation MyQueueHTTPRequest

//利用队列请求
-(void)startSendQueueHTTPRequest
{
    //创建一个多线程队列
    NSOperationQueue *queue = [[[NSOperationQueue alloc] init] autorelease];
    
    //设置多线程队列允许同时执行的线程数
    [queue setMaxConcurrentOperationCount:2];
    
    //创建请求对象
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    request = [ASIHTTPRequest requestWithURL:url];
    //获取request请求对象以后，先设置相关的属性和数据，然后再设置selector
    
    //设置代理
    [request setDelegate:self];
    
    //设置发送方法get,post,put之一
    [request setRequestMethod:@"POST"];
    
    //设置缓存策略和客户端认证
    /*
     [request setCachePolicy:];
     [request setCacheStoragePolicy:];
     [request setClientCertificateIdentity:];
     [request setClientCertificates:];
     */
    
    //设置属性（属性是我们自定义的）和数据等等信
    /*
     设置cookies，headers，和返回编码
     [request setRequestCookies:nil];
     [request setRequestHeaders:nil];
     [request setResponseEncoding:nil];
     */
    
    //设置相关的属性数据
    /*
     [request addRequestHeader:@"Cookie" value:@"cookies"];
     [request setValue:@"JSON" forKey:@"type"];
     [request setValue:@"query" forKey:@"action"];
     */
    
    //下面是设置要发送数据的相关函数：
    /*
    [request setPostBody:nil];
    [request setPostBodyFilePath:nil];
    [request setPostLength:0];
     */
    
    
    //设置selector，由于是异步请求，所以需要执行各个阶段的回调函数
    [request setDidStartSelector:@selector(start:)];
    [request setDidReceiveResponseHeadersSelector:@selector(receiveHeader:)];
    [request setDidReceiveDataSelector:@selector(receiveData:)];
    [request setDidFinishSelector:@selector(finish:)];
    [request setDidFailSelector:@selector(fail:)];
    
    
    //上面我们已经把一个request设置完成了，然后将该请求对象（相当于一个任务）添加到请求队列中
    [queue addOperation:request];
}

//当开始发送请求的时候，调用
-(void)start:(ASIHTTPRequest *)myRequest
{
    
}

//当收到请求的header的时候
-(void)receiveHeader:(ASIHTTPRequest *)myRequest
{
    
}

//当收到返回的data时候
-(void)receiveData:(ASIHTTPRequest *)myRequest
{
    
}

//当一个请求结束后
-(void)finish:(ASIHTTPRequest *)myRequest
{
    NSString *response = [myRequest responseString];
    NSLog(@"response is: %@", response);
}

//当一个请求失败了
-(void)fail:(ASIHTTPRequest *)myRequest
{
    NSError *error = [myRequest error];
    NSLog(@"错误是：%@", error);
}


@end
