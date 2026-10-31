; stage: AfterGlobalOpt  opt: O1
; module: EmptyNotNullKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @EmptyNotNullKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = icmp sgt i32 %p0, 1
  %3 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %4 = select i1 %2, array<i32, 1> %3, array<i32, 1> null
  %5 = getelementptr i32, ptr %4, i32 0
  %6 = getelementptr i32, ptr null, i32 0
  %7 = icmp eq ptr<i32> %5, %6
  %8 = call i32 @ilgpu.array.length(array<i32, 1> %4)
  %9 = select i1 %7, i32 -1, i32 %8
  store i32 %9, ptr %1
  ret void

}

