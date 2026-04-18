; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: FloatArrayKernel  [intptr: i64]

%view.float = view float
%struct.0 = type { %view.float, i64, i8 }

@g0 = internal global float zeroinitializer ; local

define void @FloatArrayKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call %view.float @ilgpu.view.new(ptr @g0, i64 4)
  %1 = getelementptr float, ptr %0, i32 0
  store float 1.5, ptr %1
  %2 = getelementptr float, ptr %0, i32 1
  store float 2.5, ptr %2
  %3 = getelementptr float, ptr %0, i32 2
  store float 3.5, ptr %3
  %4 = getelementptr float, ptr %0, i32 3
  store float 4.5, ptr %4
  %5 = getelementptr float, ptr %0, i32 %p0
  %6 = load float, ptr %5
  %7 = extractvalue %struct.0 %p1, 0
  %8 = getelementptr float, ptr %7, i32 %p0
  store float %6, ptr %8
  ret void

}

