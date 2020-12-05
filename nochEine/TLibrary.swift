import MetalKit

struct TLibrary {
  
  var vertexFunctionDescriptor:MTLFunctionDescriptor!
  var fragmentFunctionDescriptor:MTLFunctionDescriptor!
  var library:MTLLibrary!
  var vertexFunction:MTLFunction!
  var fragmentFunction:MTLFunction!
  
  init(device d:MTLDevice, vertexFunctionName vFn:String,
       fragmentFunctionName fFn:String) {
    setup(device: d, vertexFunctionName: vFn, fragmentFunctionName: fFn)
  }
  
  mutating func setup(device d:MTLDevice, vertexFunctionName vFn:String,
       fragmentFunctionName fFn:String) {
    
    d.makeDefaultLibrary()
    guard let lib = d.makeDefaultLibrary() else {
      fatalError("Failed to create a Library!")
    }
    library = lib
    vertexFunctionDescriptor = MTLFunctionDescriptor()
    vertexFunctionDescriptor.name = vFn
    fragmentFunctionDescriptor = MTLFunctionDescriptor()
    fragmentFunctionDescriptor.name = fFn

    do {
      vertexFunction = try library.makeFunction(descriptor: vertexFunctionDescriptor)
      fragmentFunction = try library.makeFunction(descriptor: fragmentFunctionDescriptor)
    } catch let error as NSError {
      fatalError("Failed to create a MTLFunction : \(error)")
    }
    
  }
}
