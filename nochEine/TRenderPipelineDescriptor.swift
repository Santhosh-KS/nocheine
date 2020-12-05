import MetalKit

struct TRenderPipelineDescriptor {
  public var descriptor:MTLRenderPipelineDescriptor! = nil
  
  init(device:MTLDevice,
       vertexFunctionName vFn:String = "vertexFunctionInUse",
       fragmentFunctionName fFn:String = "fragmentFunctionInUse") {
    
    setup(device: device, vertexFunctionName: vFn, fragmentFunctionName: fFn)
  }
  
  mutating func  setup(device:MTLDevice,
  vertexFunctionName vFn:String,
  fragmentFunctionName fFn:String ) {
    
    let lib = TLibrary(device: device,
                       vertexFunctionName: vFn,
                       fragmentFunctionName: fFn)
    
    descriptor = MTLRenderPipelineDescriptor()
    descriptor.vertexFunction = lib.vertexFunction
    descriptor.fragmentFunction = lib.fragmentFunction
    descriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
  }
  
}
