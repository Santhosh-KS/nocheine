import MetalKit

struct TCommandEncoder {
  init(buffer b:TCommandBuffer,
       pipleinState ps:TRenderPipelineState,
       descriptor d:MTLRenderPassDescriptor,
       drawable da:MTLDrawable ) {
    
    setup(buffer: b, pipleinState: ps, descriptor: d, drawable: da)
  }
  
  mutating func setup(buffer b:TCommandBuffer,
       pipleinState ps:TRenderPipelineState,
       descriptor d:MTLRenderPassDescriptor,
       drawable da:MTLDrawable ) {
    
    guard let e = b.commandBuffer.makeRenderCommandEncoder(descriptor: d) else {
      fatalError("Failed to created CommandEncoder!")
    }
    e.setRenderPipelineState(ps.renderPipelineState)
    e.endEncoding()
    b.commandBuffer.present(da)
    b.commandBuffer.commit()
  }
}
