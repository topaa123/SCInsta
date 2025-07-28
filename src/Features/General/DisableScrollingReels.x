#import "../../InstagramHeaders.h"
#import "../../Manager.h"

%hook IGUnifiedVideoCollectionView
- (void)didMoveToWindow {
    %orig;

    if ([SCIManager getBoolPref:@"disable_scrolling_reels"]) {
        NSLog(@"[SCInsta] Disabling scrolling reels");
        
        self.scrollEnabled = false;
    }
}

- (void)setScrollEnabled:(BOOL)arg1 {
    if ([SCIManager getBoolPref:@"disable_scrolling_reels"]) {
        NSLog(@"[SCInsta] Disabling scrolling reels");
        
        return %orig(NO);
    }

    return %orig;
}
%end