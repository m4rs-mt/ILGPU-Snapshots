; stage: AfterGlobalOpt  opt: O2
; module: ConditionalNullKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @ConditionalNullKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = and i32 %p0, 1
  %3 = icmp eq i32 %2, 0
  %4 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 3)
  %5 = select i1 %3, array<i32, 1> %4, array<i32, 1> null
  %6 = getelementptr i32, ptr %5, i32 0
  %7 = getelementptr i32, ptr null, i32 0
  %8 = icmp eq ptr<i32> %6, %7
  %9 = call i32 @ilgpu.array.length(array<i32, 1> %5)
  %10 = select i1 %8, i32 -1, i32 %9
  store i32 %10, ptr %1
  ret void

}

