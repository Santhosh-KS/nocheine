import MetalKit

enum TObjectType {
  case triangle, square
}

struct TObjects {
  
  var verticies:[TVertex]! = nil
  var vertexBuffer:MTLBuffer! = nil
  
  init(device d:MTLDevice, objectType ot:TObjectType) {
    setupVerticies(objectType: ot)
    guard let b = d.makeBuffer(bytes: verticies,
                               length: MemoryLayout<TVertex>.stride*verticies.count,
                               options: []) else {
      fatalError("Failed to create the Buffer!")
    }
    vertexBuffer = b
  }

  mutating func setupVerticies(objectType t:TObjectType) {
    switch t {
      case .triangle:
        self.verticies = [TVertex(position: SIMD3<Float>(0, 1, 0)),
                          TVertex(position: SIMD3<Float>(-1, -1, 0)),
                          TVertex(position: SIMD3<Float>(1, -1, 0))
        ]
      case .square:
        // TODO: correct verteicies for square.
        self.verticies = [TVertex(position: SIMD3<Float>(0, 1, 0)),
                          TVertex(position: SIMD3<Float>(-1, -1, 0)),
                          TVertex(position: SIMD3<Float>(1, -1, 0))]
    }
   
  }
}
