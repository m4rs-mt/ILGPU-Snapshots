; stage: AfterGlobalOpt  opt: O2
; module: IndexComputeKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @IndexComputeKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 4)
  %1 = getelementptr i32, ptr %0, i32 0
  store i32 100, ptr %1
  %2 = getelementptr i32, ptr %0, i32 1
  store i32 200, ptr %2
  %3 = getelementptr i32, ptr %0, i32 2
  store i32 300, ptr %3
  %4 = getelementptr i32, ptr %0, i32 3
  store i32 400, ptr %4
  %5 = getelementptr i32, ptr %0, i32 %p0
  %6 = load i32, ptr %5
  %7 = extractvalue %struct.0 %p1, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  store i32 %6, ptr %8
  ret void

}

