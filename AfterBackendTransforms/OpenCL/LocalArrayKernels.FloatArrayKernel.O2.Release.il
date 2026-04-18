; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: FloatArrayKernel  [intptr: i64]

@g0 = internal global float zeroinitializer ; local

define void @FloatArrayKernel(i32 %p0, ptr<float> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  store float 1.5, ptr @g0
  %0 = getelementptr float, ptr @g0, i32 1
  store float 2.5, ptr %0
  %1 = getelementptr float, ptr @g0, i32 2
  store float 3.5, ptr %1
  %2 = getelementptr float, ptr @g0, i32 3
  store float 4.5, ptr %2
  %3 = getelementptr float, ptr @g0, i32 %p0
  %4 = load float, ptr %3
  %5 = getelementptr float, ptr %p1, i32 %p0
  store float %4, ptr %5
  ret void

}

