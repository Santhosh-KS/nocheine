import MetalKit

class TRenderrer: NSObject {
  
  var device:MTLDevice! = nil
  var commandQueue:TCommandQueue! = nil
  var rpd:TRenderPipelineDescriptor! = nil
  var rps:TRenderPipelineState! = nil
  
  init(device:MTLDevice) {
    
    super.init()
    self.device = device

    commandQueue = TCommandQueue(device: device)
    rpd = TRenderPipelineDescriptor(device:device)
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
    _ = TCommandEncoder(commandBuffer: TCommandBuffer(commandQueue: commandQueue),
                        objects: TObjects(device: device, objectType: .triangle),
                        pipleinState: rps,
                        descriptor: renderPassDescriptor, drawable: drawable)
  }
  
}
