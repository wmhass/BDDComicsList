//
//  FBSnapshotTestCase+SwiftAdditions.h
//  BDDComicsList
//
//  Created by William Hass on 13/02/18.
//



#import <Foundation/Foundation.h>
#import <FBSnapshotTestCase/FBSnapshotTestCase.h>

@interface FBSnapshotTestCase (SwiftAdditions)

- (void) snapshotVerifyView:(UIView *)view withIdentifier:(NSString *)identifier;
- (void) snapshotVerifyLayer:(CALayer *)layer withIdentifier:(NSString *)identifier;

@end
