//
//  RCHGestureGuideView.m
//  RCHGestureGuide
//
//  Created by Rob Hayward on 04/06/2013.
//  Copyright (c) 2013 Robin Hayward. All rights reserved.
//

#import "RCHGestureGuideView.h"

@implementation RCHGestureGuideView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
      self.userInteractionEnabled = YES;
      self.backgroundColor = [UIColor clearColor];
      self.alpha = 0;
      self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  switch (_backdropType)
  {
    case RCHGestureGuideBackdropBlack:
    {
      [[UIColor colorWithWhite:0 alpha:0.8] set];
      CGContextFillRect(context, self.bounds);
      break;
    }
    case RCHGestureGuideBackdropGradient:
    {
      size_t locationsCount = 2;
      CGFloat locations[2] = {0.0f, 1.0f};
      CGFloat colors[8] = {0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.8f};
      CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
      CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, locationsCount);
      CGColorSpaceRelease(colorSpace);
      
      CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
      float radius = MIN(self.bounds.size.width * 0.8, self.bounds.size.height * 0.8);
      if ([self iPad])
      {
        radius = MIN(self.bounds.size.width * 0.7, self.bounds.size.height * 0.7);
      }
      CGContextDrawRadialGradient (context, gradient, center, 0, center, radius, kCGGradientDrawsAfterEndLocation);
      CGGradientRelease(gradient);
      
      break;
    }
    case RCHGestureGuideBackdropNone:
      break;
  }
}

- (BOOL)iPad
{
  NSString *model = [[UIDevice currentDevice] model];
  if ([model isEqualToString:@"iPad"]) {
    return YES;
  }
  return NO;
}

@end
