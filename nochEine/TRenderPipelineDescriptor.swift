import MetalKit

struct TRenderPipelineDescriptor {
  public var descriptor:MTLRenderPipelineDescriptor! = nil
  
  init(device d:MTLDevice,
       vertexDescriptor vd:TVertexDescriptor,
       vertexFunctionName vFn:String = "vertexFunctionInUse",
       fragmentFunctionName fFn:String = "fragmentFunctionInUse") {
    
    setup(device: d, vertexDescriptor : vd, vertexFunctionName: vFn, fragmentFunctionName: fFn)
  }
  
  mutating func  setup(device:MTLDevice,
                       vertexDescriptor vd:TVertexDescriptor,
                       vertexFunctionName vFn:String,
                       fragmentFunctionName fFn:String ) {
    
    let lib = TLibrary(device: device,
                       vertexFunctionName: vFn,
                       fragmentFunctionName: fFn)
    
    descriptor = MTLRenderPipelineDescriptor()
    descriptor.vertexFunction = lib.vertexFunction
    descriptor.fragmentFunction = lib.fragmentFunction
    descriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
    descriptor.vertexDescriptor = vd.descriptor
  }
  
}
