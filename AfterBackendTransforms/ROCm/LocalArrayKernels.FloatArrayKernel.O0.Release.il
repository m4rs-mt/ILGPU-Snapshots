; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: FloatArrayKernel  [intptr: i64]

%struct.0 = type { ptr<float> addrspace(global), i64 }
%struct.1 = type { ptr<float> addrspace(global), i64, i64, i8 }

@g0 = internal global float zeroinitializer ; local

define void @FloatArrayKernel(i32 %p0, %struct.1 %p1) {
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
  %5 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %6 = extractvalue %struct.0 %5, 0
  %7 = getelementptr float, ptr %6, i32 %p0
  store float %4, ptr %7
  ret void

}

