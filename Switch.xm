#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface ColorFilterGreenRedSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSGreenRedFilterEnabled();
extern "C" void _AXSGreenRedFilterSetEnabled(BOOL);

@implementation ColorFilterGreenRedSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSGreenRedFilterEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSGreenRedFilterSetEnabled(newState == FSSwitchStateOn);
}

@end
