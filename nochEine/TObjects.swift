import MetalKit

struct TObjects {
  
  var verticies:[TVertexWithColor]! = nil
  var indicies:[UInt16]! = nil
  var vertexBuffer:MTLBuffer! = nil
  var indiciesBuffer:MTLBuffer! = nil
  
  init(device dev:MTLDevice, descriptor des:TObjectDescriptor) {
    //setupVerticies(descriptor: des)
    setupVerticiesWithIndicies(descriptor: des)
    guard let b = dev.makeBuffer(bytes: verticies,
                               length: MemoryLayout<TVertexWithColor>.stride*verticies.count,
                               options: []) else {
      fatalError("Failed to create the Vertex Buffer!")
    }
    vertexBuffer = b
    
    guard let i = dev.makeBuffer(bytes: indicies,
                                 length: MemoryLayout<UInt16>.size*indicies.count,
                                 options: []) else {
      fatalError("Failed to create Indicies buffer")
    }
    indiciesBuffer = i
  }
  
  mutating func setupVerticiesWithIndicies(descriptor des:TObjectDescriptor) {
    switch des.type {
   case .triangle:
    self.verticies = [TVertexWithColor(position: SIMD3<Float>( 0,  des.size, 0),
                                       color: des.color.getColor(color: .red)),
                      TVertexWithColor(position: SIMD3<Float>(-des.size, -des.size, 0),
                                       color: des.color.getColor(color: .green)),
                      TVertexWithColor(position: SIMD3<Float>( des.size, -des.size, 0),
                                       color: des.color.getColor(color: .blue))]
    self.indicies = [0, 1, 2]
   case .square:
    self.verticies = [TVertexWithColor(position: SIMD3<Float>( des.size, des.size, 0),
                                       color: des.color.getColor(color: .blue)), // v0
                      TVertexWithColor(position: SIMD3<Float>(-des.size, des.size, 0),
                                       color: des.color.getColor(color: .green)), // v1
                      TVertexWithColor(position: SIMD3<Float>( -des.size, -des.size, 0),
                                       color: des.color.getColor(color: .red)), // v2
                      TVertexWithColor(position: SIMD3<Float>(des.size, -des.size, 0),
                                       color: des.color.getColor(color: .white)), // v3
                      
    ]
    self.indicies = [0, 1, 2,
                     0, 2, 3]
   }
    
  }
}
