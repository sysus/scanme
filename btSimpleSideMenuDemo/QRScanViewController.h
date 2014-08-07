//
//  QRScanViewController.h
//  btSimpleSideMenuDemo
//
//  Created by Jorge Kinejara on 8/1/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface QRScanViewController : UIViewController {

    AVCaptureSession *_session;
    AVCaptureDevice *_device;
    AVCaptureDeviceInput *_input;
    AVCaptureMetadataOutput *_output;
    AVCaptureVideoPreviewLayer *_prevLayer;
    UIBarButtonItem *_addButton;
    
    UIView *_highlightView;
    UILabel *_codeLabel;


}

@end
