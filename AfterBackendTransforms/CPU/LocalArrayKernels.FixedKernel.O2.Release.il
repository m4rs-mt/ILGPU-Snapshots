; stage: AfterBackendTransforms  backend: CPU  opt: O2
; module: FixedKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @FixedKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 4)
  %1 = getelementptr i32, ptr %0, i32 0
  %2 = and i32 %p0, 3
  %3 = getelementptr i32, ptr %1, i32 %2
  %4 = mul i32 %p0, 10
  store i32 %4, ptr %3
  %5 = and i32 %p0, 3
  %6 = getelementptr i32, ptr %0, i32 %5
  %7 = load i32, ptr %6
  %8 = extractvalue %struct.0 %p1, 0
  %9 = getelementptr i32, ptr %8, i32 %p0
  store i32 %7, ptr %9
  ret void

}

