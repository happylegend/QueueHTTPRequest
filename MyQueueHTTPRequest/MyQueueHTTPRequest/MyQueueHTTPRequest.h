//
//  MyQueueHTTPRequest.h
//  MyQueueHTTPRequest
//
//  Created by 紫冬 on 13-7-30.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

/*
 利用请求队列的一般步骤：
 第一：创建一个多线程队列
 第二：创建需要request，每一个request相当于一个任务
 第三：设置request的代理，相关属性，数据和selector
 第四：将request添加到多线程队列中
 
 注意：利用请求队列，实际上还是利用了多线程和异步请求
 */


/*
 一个特别有用的子类ASINetworkQueues, 它的delegate提供更为丰富的功能，父类AsiHTTPRequest也由这些回调，但是没有
 提供的更多的回调方法如下：
 a，requestDidStartSelector，请求发起时会调此方法，你可以在此方法中跟据业务选择性的设置request对象的deleaget。
 b，requestDidReceiveResponseHeadersSelector，当接受完响应的Header后设计此方法，这个对下载大数据的时候相当有用，你可以在方法里做更多业务上的处理。
 c，requestDidFinishSelector，请求并响应成功完成时调用此方法
 d，requestDidFailSelector，请求失败
 e，queueDidFinishSelector，整个队列里的所有请求都结束时调用此方法。
 
 它是NSOperationQueues的扩展，小而强大。但也与它的父类略有区别。如，仅添加到队列中其实并不能执行请求，
 只有调用[queue go]才会执行；一个正在运行中的队列，并不需要重复调用[queue go]。
 
 引用
 
 默认情况下，队列中的一个请求如果失败，它会取消所有未完成的请求。可以设置[queue setShouldCancelAllRequestsOnFailure:NO]来修 正。
 
 取消异步请求
 首先，同步请求是不能取消的。
 其次，不管是队列请求，还是简单的异步请求，全部调用[request cancel]来取消请求。
 
 
 引用
 取消的请求默认都会按请求失败处理，并调用请求失败delegate。
 如果不想调用delegate方法，则设置：[request clearDelegatesAndCancel];
 
 
 队列请求中需要注意的是，如果你取消了一个请求，队列会自动取消其它所有请求。
 如果只想取消一个请求，可以设置队列：[queue setShouldCancelAllRequestsOnFailure:NO];
 如果想明确取消所有请求：[queue cancelAllOperations];
 
 */

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@interface MyQueueHTTPRequest : NSObject

{
    ASIHTTPRequest *request;
}


//利用请求队列
-(void)startSendQueueHTTPRequest;

@end
