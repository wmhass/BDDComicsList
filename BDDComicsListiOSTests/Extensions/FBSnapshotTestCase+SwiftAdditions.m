//
//  FBSnapshotTestCase+SwiftAdditions.m
//  BDDComicsList
//
//  Created by William Hass on 13/02/18.
//

#import "FBSnapshotTestCase+SwiftAdditions.h"

@implementation FBSnapshotTestCase (SwiftAdditions)

- (void) snapshotVerifyView:(UIView *)view withIdentifier:(NSString *)identifier
{
    FBSnapshotVerifyViewWithOptions(view, identifier, FBSnapshotTestCaseDefaultSuffixes(), 0)
}

- (void) snapshotVerifyLayer:(CALayer *)layer withIdentifier:(NSString *)identifier
{
    FBSnapshotVerifyLayerWithOptions(layer, identifier, FBSnapshotTestCaseDefaultSuffixes(), 0)
}

@end
