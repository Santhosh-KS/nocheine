import MetalKit

struct TVertexDescriptor {
  var descriptor:MTLVertexDescriptor! = nil
  
  init() {
    let d = MTLVertexDescriptor()
    d.attributes[0].bufferIndex = 0
    d.attributes[0].format = .float3
    d.attributes[0].offset = 0
    
    d.attributes[1].bufferIndex = 0
    d.attributes[1].format = .float4
    d.attributes[1].offset = MemoryLayout<SIMD3<Float>>.size
    
    d.layouts[0].stride = MemoryLayout<TVertexWithColor>.stride
    descriptor = d
  }
  
}
