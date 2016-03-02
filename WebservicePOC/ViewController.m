//
//  ViewController.m
//  WebservicePOC
//
//  Created by Sravan on 02/03/16.
//  Copyright © 2016 com.tcs.best.development. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

//#define DOCUMENT_DIRECTORY_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define DOCUMENT_DIRECTORY_URL [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil]
#define CACHE_DIRECTORY_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
#define URL_DOWNLOAD_PDF_SWIFT_FOR_BEGINNERS_4MB @"http://ptgmedia.pearsoncmg.com/images/9780134044705/samplepages/9780134044705.pdf"
#define URL_DOWNLOAD_PDF_250KB  @"http://swift-lang.org/guides/tutorial.pdf"
#define URL_DOWNLOAD_DMG_1MB    @"http://files.downloadnow.com/s/software/11/64/76/37/svnX%201.3.dmg?token=1456426644_f3e9f4ddcfdccbcb3f16233c40be87b7&fileName=svnX%201.3.dmg"
#define URL_DOWNLOAD_DMG_66MB   @"http://supportdownload.apple.com/download.info.apple.com/Apple_Support_Area/Apple_Software_Updates/Mac_OS_X/downloads/031-29055.20150831-0f779fb2-4bf4-11e5-a8d8-/javaforosx.dmg"
#define URL_DOWNLOAD_DMG_35MB   @"http://res.taig.com/installer/mac/TaiGjailbreak_V100.dmg"
#define URL_DOWNLOAD_ZIP_70KB   @"https://codeload.github.com/mzeeshanid/MZDownloadManager/zip/master"
#define URL_DOWNLOAD_ZIP_51KB   @"https://codeload.github.com/YuansGitHub/iOS-MultiThread-NSOperation/zip/master"
#define URL_DOWNLOAD_ZIP_6KB    @"https://codeload.github.com/H2CO3/HCDownload/zip/master"
#define URL_DOWNLOAD_ZIP_13KB   @"https://codeload.github.com/azu/OperationPromise/zip/master"
#define URL_DOWNLOAD_ZIP_37KB   @"https://s3.amazonaws.com/hayageek/downloads/ios/apns.zip"
#define URL_DOWNLOAD_ZIP_633KB  @"http://cdn1.raywenderlich.com/wp-content/uploads/2015/09/VacationSpots_Complete.zip"
#define URL_DOWNLOAD_ZIP_686KB  @"http://cdn3.raywenderlich.com/wp-content/uploads/2014/01/Weather_Final.zip"
#define URL_DOWNLOAD_ZIP_215KB  @"http://cdn4.raywenderlich.com/wp-content/uploads/2014/01/GooglyPuff_Start_1.zip"

@interface ViewController () {
    int counter ;
    NSOperationQueue *zipFileDownloadQueue ;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    counter = 0 ;
    
    zipFileDownloadQueue = [[NSOperationQueue alloc] init] ;
    zipFileDownloadQueue.maxConcurrentOperationCount = 1 ;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)downloadBtnTapped:(id)sender {
//    NSLog(@"Download button tapped: %d", counter) ;
    
    
    NSURL *url ;
    
    if (counter == 5) {
        counter = 0;
    }
    
    ++counter ;
    
    if (counter == 1) {
        url = [NSURL URLWithString:URL_DOWNLOAD_ZIP_6KB];
    } else if (counter == 2) {
        url = [NSURL URLWithString:URL_DOWNLOAD_ZIP_633KB];
    } else if (counter == 3) {
        url = [NSURL URLWithString:URL_DOWNLOAD_ZIP_686KB];
    } else if (counter == 4) {
        url = [NSURL URLWithString:URL_DOWNLOAD_ZIP_215KB];
    } else if (counter == 5) {
        url = [NSURL URLWithString:URL_DOWNLOAD_ZIP_37KB];
    }
    
// #1
    NSInvocationOperation *fileDownloadOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(startDownloadingZipFileAtUrl:) object:url] ;
    [zipFileDownloadQueue addOperation:fileDownloadOperation] ;
    
    
    
// #2
//    [zipFileDownloadQueue addOperationWithBlock:^{
//        [self startDownloadingZipFileAtUrl:url] ;
//    }];
    
    
// #3
//    dispatch_queue_t serial ;
//    serial = dispatch_queue_create("downloadQueue", DISPATCH_QUEUE_SERIAL) ;
//    dispatch_sync(serial, ^{
//        [self startDownloadingZipFileAtUrl:url] ;
//    }) ;
    
    
// #4
//    NSOperation *fileDownloadOperation = [NSBlockOperation blockOperationWithBlock:^{
//        [self startDownloadingZipFileAtUrl:url];
//    }];
//    
//    if (zipFileDownloadQueue.operations.count != 0) {
//        [fileDownloadOperation addDependency:zipFileDownloadQueue.operations.lastObject] ;
//    } else {
//        [zipFileDownloadQueue addOperation:fileDownloadOperation] ;
//    }
    
// #5
//    NSInvocationOperation *fileDownloadOperation1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(startDownloadingZipFileAtUrl:) object:[NSURL URLWithString:URL_DOWNLOAD_ZIP_6KB]] ;
//    NSInvocationOperation *fileDownloadOperation2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(startDownloadingZipFileAtUrl:) object:[NSURL URLWithString:URL_DOWNLOAD_ZIP_686KB]] ;
//    NSInvocationOperation *fileDownloadOperation3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(startDownloadingZipFileAtUrl:) object:[NSURL URLWithString:URL_DOWNLOAD_ZIP_633KB]] ;
//    NSInvocationOperation *fileDownloadOperation4 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(startDownloadingZipFileAtUrl:) object:[NSURL URLWithString:URL_DOWNLOAD_ZIP_215KB]] ;
//    NSInvocationOperation *fileDownloadOperation5 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(startDownloadingZipFileAtUrl:) object:[NSURL URLWithString:URL_DOWNLOAD_ZIP_37KB]] ;
//    
//    [zipFileDownloadQueue addOperation:fileDownloadOperation1] ;
//    [zipFileDownloadQueue addOperation:fileDownloadOperation2] ;
//    [zipFileDownloadQueue addOperation:fileDownloadOperation3] ;
//    [zipFileDownloadQueue addOperation:fileDownloadOperation4] ;
//    [zipFileDownloadQueue addOperation:fileDownloadOperation5] ;
    
    

}

- (void)startDownloadingZipFileAtUrl:(NSURL *)url {
    NSLog(@"Downloading file : %@", [url lastPathComponent]) ;
  
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager] ;
    
    //for progress
    [sessionManager setDownloadTaskDidWriteDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionDownloadTask * _Nonnull downloadTask, int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        float progress = (((float)totalBytesWritten) / totalBytesExpectedToWrite) * 100;
        NSLog(@"File :%@ Progress: %f percent", [url lastPathComponent], progress) ;
    }] ;

    //For downloading
    NSURLSessionTask *downloadZipFile =
    [sessionManager downloadTaskWithRequest:[NSURLRequest requestWithURL:url]
                                   progress:nil
                                destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                                    return [DOCUMENT_DIRECTORY_URL URLByAppendingPathComponent:[response suggestedFilename]];
                                } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                                    NSLog(@"Downloaded file path : %@", filePath) ;
                                    
                                }] ;
    [downloadZipFile resume] ;
}

@end
