class ChameleonAppDelegate
  def applicationDidFinishLaunching(application)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    @window.backgroundColor = UIColor.whiteColor
    @window.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight

    @appleView = UIImageView.alloc.initWithImage(UIImage.imageNamed("apple.png"))
    @window.addSubview(@appleView)

    @sillyButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @sillyButton.setTitle("Click Me!", forState:UIControlStateNormal)
    @sillyButton.setTitleColor(UIColor.whiteColor, forState:UIControlStateNormal)
    @sillyButton.addTarget(self, action:'moveTheApple:', forControlEvents:UIControlEventTouchUpInside)
    @sillyButton.frame = CGRectMake(22,300,200,50)
    @window.addSubview(@sillyButton)

    @window.makeKeyAndVisible
  end

  def moveTheApple(sender)
    UIView.beginAnimations("moveTheApple", context:nil)
    UIView.setAnimationDuration(3)
    UIView.setAnimationBeginsFromCurrentState(true)

    if CGAffineTransformIsIdentity(@appleView.transform) then
      @appleView.transform = CGAffineTransformMakeScale(0.5, 0.5)
      @appleView.center = @window.convertPoint(@window.center, toView:@appleView.superview)
    else
      @appleView.transform = CGAffineTransformIdentity
      @appleView.frame = CGRectMake(0,0,256,256)
    end

    UIView.commitAnimations
  end
end
