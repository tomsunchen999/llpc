#version 450 core

layout(location = 0) out int i1;

void main()
{
    i1 = gl_VertexIndex + gl_InstanceIndex;
}
// BEGIN_SHADERTEST
/*
; RUN: amdllpc -spvgen-dir=%spvgendir% -v %gfxip %s | FileCheck -check-prefix=SHADERTEST %s
; SHADERTEST-LABEL: {{^// LLPC}} pipeline before-patching results
; SHADERTEST_DAG: call i32 @lgc.special.user.data.BaseInstance(i32 268435460)
; SHADERTEST_DAG: call i32 @lgc.shader.input.VertexId(i32 15)
; SHADERTEST_DAG: call i32 @lgc.special.user.data.BaseVertex(i32 268435459)
; SHADERTEST: AMDLLPC SUCCESS
*/
// END_SHADERTEST
