//
//  QRScanViewController.m
//  btSimpleSideMenuDemo
//
//  Created by Jorge Kinejara on 8/1/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import "QRScanViewController.h"

@interface QRScanViewController ()

@end

@implementation QRScanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self callCamera];
    
    
    _addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewCode:)];
    
    _addButton.enabled = NO;
    
    self.navigationItem.rightBarButtonItem = _addButton;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)callCamera
{
    
    _highlightView = [[UIView alloc] init];
    _highlightView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _highlightView.layer.borderWidth = 3;
    [self.view addSubview:_highlightView];
    
    _codeLabel = [[UILabel alloc] init];
    _codeLabel.frame = CGRectMake(0,80, self.view.bounds.size.width, 40);
    _codeLabel.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
    _codeLabel.textColor = [UIColor whiteColor];
    _codeLabel.textAlignment = NSTextAlignmentCenter;
    _codeLabel.text = @"Scan a Bar Code ";
    
    [self.view addSubview:_codeLabel];
    
    _session = [[AVCaptureSession alloc] init];
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    
    _input = [AVCaptureDeviceInput deviceInputWithDevice:_device error:&error];
    if (_input) {
        [_session addInput:_input];
    } else {
        NSLog(@"Error: %@", error);
    }
    
    _output = [[AVCaptureMetadataOutput alloc] init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [_session addOutput:_output];
    
    _output.metadataObjectTypes = [_output availableMetadataObjectTypes];
    
    _prevLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    //_prevLayer.frame = self.view.bounds;
    _prevLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _prevLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    [self.view.layer addSublayer:_prevLayer];
    
    [_session startRunning];
    
    [self.view bringSubviewToFront:_highlightView];
    [self.view bringSubviewToFront:_codeLabel];
    
    
}


- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    CGRect highlightViewRect = CGRectZero;
    AVMetadataMachineReadableCodeObject *barCodeObject;
    NSString *detectionString = nil;
    NSArray *barCodeTypes = @[AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code,
                              AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code,
                              AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode];
    
    for (AVMetadataObject *metadata in metadataObjects) {
        for (NSString *type in barCodeTypes) {
            if ([metadata.type isEqualToString:type])
            {
                barCodeObject = (AVMetadataMachineReadableCodeObject *)[_prevLayer transformedMetadataObjectForMetadataObject:(AVMetadataMachineReadableCodeObject *)metadata];
                highlightViewRect = barCodeObject.bounds;
                detectionString = [(AVMetadataMachineReadableCodeObject *)metadata stringValue];
                break;
            }
        }
        
        if (detectionString != nil)
        {
            _codeLabel.text = detectionString;
            _addButton.enabled = true;
            
            break;
        }
        else
        {
            _codeLabel.text = @"Scan a bar code";
            _addButton.enabled = false;
        }
        
    }
    
    _highlightView.frame = highlightViewRect;
}

-(void)insertNewCode:(id)selector
{
    
    
}



@end
