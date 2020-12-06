import MetalKit

enum TObjectType {
  case triangle, square
}

enum TColorType {
  case color, none
}

struct TObjects {
  
  var verticies:[TVertexWithColor]! = nil
  var vertexBuffer:MTLBuffer! = nil
  
  init(device d:MTLDevice, objectType ot:TObjectType, colorType ct:TColorType = .color) {
    //setupVerticies(objectType: ot, colorType: ct)
    setupVerticies(objectType: ot)
    guard let b = d.makeBuffer(bytes: verticies,
                               length: MemoryLayout<TVertexWithColor>.stride*verticies.count,
                               options: []) else {
      fatalError("Failed to create the Buffer!")
    }
    vertexBuffer = b
  }
  
  mutating func setupVerticies(objectType t:TObjectType) {
   switch t {
   case .triangle:
     self.verticies = [TVertexWithColor(position: SIMD3<Float>( 0,  1, 0),
     color: SIMD4<Float>(1,0,0,1)),
     TVertexWithColor(position: SIMD3<Float>(-1, -1, 0),
     color: SIMD4<Float>(0,1,0,1)),
     TVertexWithColor(position: SIMD3<Float>( 1, -1, 0),
     color: SIMD4<Float>(0,0,1,1))
     ]
   case .square:
     self.verticies = [TVertexWithColor(position: SIMD3<Float>( 0,  1, 0),
     color: SIMD4<Float>(1,0,0,1)),
     TVertexWithColor(position: SIMD3<Float>(-1, -1, 0),
     color: SIMD4<Float>(0,1,0,1)),
     TVertexWithColor(position: SIMD3<Float>( 1, -1, 0),
     color: SIMD4<Float>(0,0,1,1))
     ]
   }
 }
/*
  mutating func setupVerticies(objectType t:TObjectType,
                               colorType ct:TColorType) {
    switch ct {
      case .none:
        switch t {
          case .triangle:
            self.verticies = [TVertexWithColor(position: SIMD3<Float>(0, 1, 0),
                                      color: SIMD4<Float>(1,1,1,1)),
                              TVertexWithColor(position: SIMD3<Float>(-1, -1, 0),
                                      color: SIMD4<Float>(1,1,1,1)),
                              TVertexWithColor(position: SIMD3<Float>(1, -1, 0),
                                      color: SIMD4<Float>(1,1,1,1))
            ]
          case .square:
            // TODO: correct verteicies for square.
            self.verticies = [TVertexWithColor(position: SIMD3<Float>(0, 1, 0),
                                               color: SIMD4<Float>(1,1,1,1)),
                              TVertexWithColor(position: SIMD3<Float>(-1, -1, 0),
                                               color: SIMD4<Float>(1,1,1,1)),
                              TVertexWithColor(position: SIMD3<Float>(1, -1, 0),
                                               color: SIMD4<Float>(1,1,1,1))
            ]
        }
      case .color:
        switch t {
          case .triangle:
            self.verticies = [TVertexWithColor(position: SIMD3<Float>( 0,  1, 0),
            color: SIMD4<Float>(1,0,0,1)),
            TVertexWithColor(position: SIMD3<Float>(-1, -1, 0),
            color: SIMD4<Float>(0,1,0,1)),
            TVertexWithColor(position: SIMD3<Float>( 1, -1, 0),
            color: SIMD4<Float>(0,0,1,1))
            ]
          case .square:
            self.verticies = [TVertexWithColor(position: SIMD3<Float>( 0,  1, 0),
                                               color: SIMD4<Float>(1,0,0,1)),
                              TVertexWithColor(position: SIMD3<Float>(-1, -1, 0),
                                               color: SIMD4<Float>(0,1,0,1)),
                              TVertexWithColor(position: SIMD3<Float>( 1, -1, 0),
                                               color: SIMD4<Float>(0,0,1,1))
            ]
        }
    }
  }
 */
}
