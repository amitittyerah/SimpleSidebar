//
//  Sidebar.h
//

#import <UIKit/UIKit.h>

@protocol SidebarDelegate <NSObject>
@required
- (void) sidebarShowing: (BOOL)animated;
- (void) sidebarDidShow;
- (void) sidebarClosing: (BOOL)animated;
- (void) sidebarDidClose;
@end

@interface Sidebar : UIView
{

}

@property (retain) id delegate;
@property (nonatomic) double width;
@property (nonatomic) double height;
@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic) double animationDuration;
@property (nonatomic) double animationDelay;
@property (nonatomic) UIColor *color;
@property (nonatomic) BOOL animate;


- (void) show;
- (void) close;

@end
