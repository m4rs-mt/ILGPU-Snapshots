; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: FixedKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @FixedKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 4)
  %1 = getelementptr i32, ptr %0, i32 0
  %2 = addrspacecast ptr %1 to ptr<i32>
  %3 = and i32 %p0, 3
  %4 = getelementptr i32, ptr %2, i32 %3
  %5 = mul i32 %p0, 10
  store i32 %5, ptr %4
  %6 = and i32 %p0, 3
  %7 = getelementptr i32, ptr %0, i32 %6
  %8 = load i32, ptr %7
  %9 = extractvalue %struct.0 %p1, 0
  %10 = getelementptr i32, ptr %9, i32 %p0
  store i32 %8, ptr %10
  ret void

}

