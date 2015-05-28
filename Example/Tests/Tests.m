//
//  CocoaPlusTests.m
//  CocoaPlusTests
//
//  Created by tkatzenbaer on 05/09/2015.
//  Copyright (c) 2014 tkatzenbaer. All rights reserved.
//

#define RecordSnapshots NO

SpecBegin(OPCircleButtonViewController)

it(@"loading view controller from storyboard", ^{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"CircleButton"];
    expect(vc.view).willNot.beNil();
    
    if (RecordSnapshots) {
        expect(vc.view).to.recordSnapshotNamed(@"default");
    } else {
        expect(vc.view).will.haveValidSnapshotNamed(@"default");
    }
});

SpecEnd
