import MetalKit



struct TObjects {
  
  var verticies:[TVertexWithColor]! = nil
  var vertexBuffer:MTLBuffer! = nil
  
  init(device dev:MTLDevice, descriptor des:TObjectDescriptor) {
    //setupVerticies(objectType: ot, colorType: ct)
    setupVerticies(descriptor: des)
    guard let b = dev.makeBuffer(bytes: verticies,
                               length: MemoryLayout<TVertexWithColor>.stride*verticies.count,
                               options: []) else {
      fatalError("Failed to create the Buffer!")
    }
    vertexBuffer = b
  }
  
  mutating func setupVerticies(descriptor des:TObjectDescriptor) {
    switch des.type {
   case .triangle:
    self.verticies = [TVertexWithColor(position: SIMD3<Float>( 0,  des.size, 0),
                                       color: des.color.getColor(color: .red)),
                      TVertexWithColor(position: SIMD3<Float>(-des.size, -des.size, 0),
                                       color: des.color.getColor(color: .green)),
                      TVertexWithColor(position: SIMD3<Float>( des.size, -des.size, 0),
                                       color: des.color.getColor(color: .blue))]
   case .square:
    self.verticies = [TVertexWithColor(position: SIMD3<Float>( des.size, des.size, 0),
                                       color: des.color.getColor(color: .blue)), // v0
                      TVertexWithColor(position: SIMD3<Float>(-des.size, des.size, 0),
                                       color: des.color.getColor(color: .green)), // v1
                      TVertexWithColor(position: SIMD3<Float>( -des.size, -des.size, 0),
                                       color: des.color.getColor(color: .red)), // v2
                      
                      TVertexWithColor(position: SIMD3<Float>( des.size, des.size, 0),
                                       color: des.color.getColor(color: .green)), // v0
                      TVertexWithColor(position: SIMD3<Float>( -des.size, -des.size, 0),
                                       color: des.color.getColor(color: .blue)), // v2
                      TVertexWithColor(position: SIMD3<Float>(des.size, -des.size, 0),
                                       color: des.color.getColor(color: .red)), // v3
    ]
   }
 }
}
