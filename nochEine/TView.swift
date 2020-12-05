import MetalKit

class TView: MTKView {
  
  var renderrer:TRenderrer! = nil
  
  required init(coder: NSCoder) {
    
    super.init(coder: coder)
    self.colorPixelFormat = .bgra8Unorm
    self.clearColor = MTLClearColor(red: 0.1, green: 0.7, blue: 0.3, alpha: 1.0)
    guard let device = MTLCreateSystemDefaultDevice() else {
      fatalError("Failed to create MTLDevice!")
    }
    self.device = device
    renderrer = TRenderrer(device: device)
    self.delegate = renderrer
    
  }
}
