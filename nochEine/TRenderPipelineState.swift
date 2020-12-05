import MetalKit

struct TRenderPipelineState {
  
  var renderPipelineState:MTLRenderPipelineState! = nil

  init(device d:MTLDevice,
       renderDescriptor rpd:TRenderPipelineDescriptor) {
    setup(device: d, renderDescriptor: rpd)
  }
  
  mutating func setup(device d: MTLDevice, renderDescriptor rpd:TRenderPipelineDescriptor) {
    do {
      renderPipelineState = try d.makeRenderPipelineState(descriptor: rpd.descriptor)
    } catch let error as NSError {
      fatalError("Failed to create RenderPipelineState : \(error)")
    }
  }
}
