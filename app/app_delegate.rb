class BigAppleAppDelegate
  extend IB

  outlet :window, NSWindow
  outlet :chameleonNSView, UIKitView

  def applicationDidFinishLaunching(notification)
    @chameleonApp = ChameleonAppDelegate.alloc.init
    @chameleonNSView.launchApplicationWithDelegate(@chameleonApp, afterDelay:1)
  end

  def dealloc
    @chameleonApp.release
    super
  end
end
