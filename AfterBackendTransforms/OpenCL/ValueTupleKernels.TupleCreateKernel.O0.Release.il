; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: TupleCreateKernel  [intptr: i64]

define void @TupleCreateKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<float> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = getelementptr i32, ptr %p1, i32 %p0
  %1 = shl i32 %p0, 1
  store i32 %1, ptr %0
  %2 = getelementptr float, ptr %p5, i32 %p0
  %3 = sitofp i32 %p0 to float
  %4 = fmul float %3, 3.0
  store float %4, ptr %2
  ret void

}

