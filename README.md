RCHGestureGuide
===============

A tool to display gesture hints to your users on any area of user interface area of your application.

Allow the user to dismiss and remove guides for different areas of your applications and re-enable them on demand.

Easily customize the icons and animations.

## Usage

    - (void)viewDidAppear:(BOOL)animated
    {
      [super viewDidAppear:animated];
      [RCHGestureGuide showGestures:@[RCHGesturePinch, RCHGestureSwipe, RCHGestureSpread, RCHGestureRotate, RCHGestureTap] forKey:@"Home"];
    }

## Icons

The sample icons are from the free set at <MobileTuxedo.com>, you must not use these icons without contacting them for permission, always replace with your own icons for production.

If any designers out there want to create an icon set for me that can be shared with this tool freely please get in touch.

## Screenshot

![Showing Gestures](https://raw.github.com/robinhayward/RCHGestureGuide/master/screenshots/screenshot.png)

## Contact

[@robhayward](http://www.twitter.com/robhayward) 

<hello@robhayward.co.uk>
