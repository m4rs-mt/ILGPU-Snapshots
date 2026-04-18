; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: WriteReadKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @WriteReadKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 4)
  %1 = getelementptr i32, ptr %0, i32 0
  store i32 10, ptr %1
  %2 = getelementptr i32, ptr %0, i32 1
  store i32 20, ptr %2
  %3 = getelementptr i32, ptr %0, i32 2
  store i32 30, ptr %3
  %4 = getelementptr i32, ptr %0, i32 3
  store i32 40, ptr %4
  %5 = getelementptr i32, ptr %0, i32 %p0
  %6 = load i32, ptr %5
  %7 = extractvalue %struct.0 %p1, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  store i32 %6, ptr %8
  ret void

}

