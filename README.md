SimpleSidebar
=============

Sidebar skeleton in Objective-C which can be reused as a building block 
in projects. 


### Delegates

```objc

- (void) sidebarShowing: (BOOL)animated;
- (void) sidebarDidShow;
- (void) sidebarClosing: (BOOL)animated;
- (void) sidebarDidClose;

```


### Example

```objc

// ViewController.h

#import "Sidebar.h"

@interface ViewController : UIViewController <SidebarDelegate>
{
	Sidebar *sidebar;

	BOOL sidebarShown;
}

// ViewController.m

#import "Sidebar.h"

- (void) viewDidLoad
{
	[super viewDidLoad];

	sidebar = [[Sidebar alloc] init];
	sidebar.width = 150;
    sidebar.height = self.view.frame.size.height;
    sidebar.x = 0;
    sidebar.y = 60;
    sidebar.animationDelay = 0;
    sidebar.animationDuration = .9;
    sidebar.animate = YES;
    sidebar.color = [UIColor blackColor];
    sidebar.delegate = self;
	
	// FLAG the sidebar
	sidebarShown = NO;
}

- (void)buttonClick:(UIButton *) showSidebarButton
{
	if(!sidebarShown)
	{
		[sidebar show];
	}
	else
	{
		[sidebar close];
	}
}

- (void) sidebarShowing: (BOOL)animated
{
    NSLog(@"Showing sidebar");
}

- (void) sidebarDidShow
{
    NSLog(@"Shown sidebar");
    sidebarShown = YES;
}

- (void) sidebarClosing: (BOOL)animated
{
    NSLog(@"Closing sidebar");
}

- (void) sidebarDidClose
{
	NSLog(@"Closed sidebar");
    sidebarShown = NO;
}

```
