class AppDelegate
  #extend IB

  #outlet :window, NSWindow
  #outlet :chameleonNSView, UIKitView

  def applicationDidFinishLaunching(notification)
    buildWindow

    @chameleonApp = ChameleonAppDelegate.alloc.init
    @chameleonNSView.launchApplicationWithDelegate(@chameleonApp, afterDelay:1)
  end

  def buildWindow
    @window = NSWindow.alloc.initWithContentRect([[335, 272], [640, 480]],
      styleMask:NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
      backing:NSBackingStoreBuffered,
      defer:false)
    @window.title = NSBundle.mainBundle.infoDictionary['CFBundleName']

    @chameleonNSView = UIKitView.alloc.initWithFrame([[0, 0], [640, 480]])
    @window.contentView.addSubview(@chameleonNSView)

    @window.orderFrontRegardless
  end
end
