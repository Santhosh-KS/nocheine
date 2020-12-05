import MetalKit

class TRenderrer: NSObject {
  
  var device:MTLDevice! = nil
  var commandQueue:TCommandQueue! = nil
  var rpd:TRenderPipelineDescriptor! = nil
  var rps:TRenderPipelineState! = nil
  
  init(device:MTLDevice) {
    
    super.init()
    self.device = device
    setupCommandQueue(device: device)
    setupPipelineDescriptor(device: device)
    setupPipelineState(device: device)
//    commandQueue = TCommandQueue(device: device)
//    rpd = TRenderPipelineDescriptor(device:device)
//    rps = TRenderPipelineState(device: device, renderDescriptor: rpd)
  }
  
  func setupCommandQueue(device: MTLDevice) {
    commandQueue = TCommandQueue(device: device)
  }
  
  func setupPipelineDescriptor(device: MTLDevice) {
    rpd = TRenderPipelineDescriptor(device:device)
  }
  
  func setupPipelineState(device: MTLDevice) {
    rps = TRenderPipelineState(device: device, renderDescriptor: rpd)
  }
}

extension TRenderrer:MTKViewDelegate {
  func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
   // none
  }
  
  func draw(in view: MTKView) {
    guard let drawable = view.currentDrawable,
          let renderPassDescriptor  = view.currentRenderPassDescriptor else {
      return
    }
    _ = TCommandEncoder(buffer: TCommandBuffer(commandQueue: commandQueue),
                        pipleinState: rps,
                        descriptor: renderPassDescriptor, drawable: drawable)
  }
  
}
