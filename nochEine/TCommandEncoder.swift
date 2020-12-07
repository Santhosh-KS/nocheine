import MetalKit

struct TCommandEncoder {
  init(commandBuffer b:TCommandBuffer,
       objects o:TObjects,
       pipleinState ps:TRenderPipelineState,
       descriptor d:MTLRenderPassDescriptor,
       drawable da:MTLDrawable ) {
    
    setup(buffer: b, objects: o, pipleinState: ps, descriptor: d, drawable: da)
  }
  
  mutating func setup(buffer b:TCommandBuffer,
                      objects o:TObjects,
       pipleinState ps:TRenderPipelineState,
       descriptor d:MTLRenderPassDescriptor,
       drawable da:MTLDrawable ) {
    
    guard let e = b.commandBuffer.makeRenderCommandEncoder(descriptor: d) else {
      fatalError("Failed to created CommandEncoder!")
    }
    e.setVertexBuffer(o.vertexBuffer, offset: 0, index: 0)
    e.setRenderPipelineState(ps.renderPipelineState)
    //e.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: o.verticies.count)
    e.drawIndexedPrimitives(type: .triangle, indexCount: o.indicies.count,
                            indexType: .uint16, indexBuffer: o.indiciesBuffer,
                            indexBufferOffset: 0)
    e.endEncoding()
    b.commandBuffer.present(da)
    b.commandBuffer.commit()
  }
}
