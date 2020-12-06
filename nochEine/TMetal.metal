#include <metal_stdlib>
using namespace metal;

struct VertexIn {
  float3 position;
  float4 color;
};

struct VertexOut {
  float4 position [[position]];
  float4 color;
};

[[host_name("vertexFunctionInUse")]]
vertex VertexOut vertex_function(const device VertexIn *verticies [[buffer(0)]],
                              uint vertexId [[vertex_id]])
{
  VertexOut v;
  v.position = float4(verticies[vertexId].position, 1);
  v.color = verticies[vertexId].color;
  return v;
}

[[host_name("fragmentFunctionInUse")]]
fragment float4 fragment_function(VertexOut vIn [[stage_in]])
{
  return vIn.color;
}

// step-2 V&F functions to draw triangle
[[host_name("vertexTriangleFunctionInUse")]]
vertex float4 vertex_triangle_function(const device float3 *verticies [[buffer(0)]],
                              uint vertexId [[vertex_id]])
{
  return float4(verticies[vertexId], 1);
}

[[host_name("fragmentTriangleFunctionInUse")]]
fragment float4 fragment_triangle_function()
{
  return float4(1);
}



// setp-1 V&F Functions
[[host_name("RGBVertexScreenUse")]]
vertex float4 basic_vertex_function()
{
  return float4(1);
}

[[host_name("RGBfragmentScreenUse")]]
fragment float4 basic_fragment_function()
{
  return float4(1);
}
