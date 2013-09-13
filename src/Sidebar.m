//
//  Sidebar.m
//

#import <UIKit/UIKit.h>
#import "Sidebar.h"

@implementation Sidebar

@synthesize x;
@synthesize y;
@synthesize width;
@synthesize height;
@synthesize animationDuration;
@synthesize animationDelay;
@synthesize color;
@synthesize animate;

-(id) init
{
    self = [super initWithFrame:CGRectMake(-width, y, width, height)];
    return self;
}

- (void) show
{
    [self sidebarShowing:animate];
    if(animate)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationDuration];
        [UIView setAnimationDelay:animationDelay];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.frame = CGRectMake(x, y, width, height);
        [self setBackgroundColor:color];
        [UIView commitAnimations];
    }
    else
    {
        self.frame = CGRectMake(x, y, width, height);
        [self setBackgroundColor:color];
    }
    self.frame = CGRectMake(x, y, width, height);
    [self setBackgroundColor:color];
    [self sidebarDidShow];

}

- (void) close
{
    [self sidebarClosing:animate];
    if(animate)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationDuration];
        [UIView setAnimationDelay:animationDelay];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.frame = CGRectMake(0, 0, 0, 0);
        [UIView commitAnimations];
    }
    else
    {
        self.frame = CGRectMake(0, 0, 0, 0);
    }
    
    [self sidebarDidClose];
}

- (void) sidebarShowing: (BOOL)animated
{
    [[self delegate] sidebarShowing:animate];
}

- (void) sidebarDidShow
{
    [[self delegate] sidebarDidShow];
}

- (void) sidebarClosing: (BOOL)animated
{
    [[self delegate] sidebarClosing:animate];
}

- (void) sidebarDidClose
{
    [[self delegate] sidebarDidClose];
}


@end
