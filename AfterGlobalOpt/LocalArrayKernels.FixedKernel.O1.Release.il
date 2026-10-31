; stage: AfterGlobalOpt  opt: O1
; module: FixedKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @FixedKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 4)
  %1 = call i32 @ilgpu.array.length(array<i32, 1> %0)
  %2 = icmp ne i32 %1, 0
  %3 = getelementptr i32, ptr %0, i32 0
  %4 = select i1 %2, ptr<i32> %3, ptr<i32> null
  %5 = and i32 %p0, 3
  %6 = getelementptr i32, ptr %4, i32 %5
  %7 = mul i32 %p0, 10
  store i32 %7, ptr %6
  %8 = and i32 %p0, 3
  %9 = getelementptr i32, ptr %0, i32 %8
  %10 = load i32, ptr %9
  %11 = extractvalue %struct.0 %p1, 0
  %12 = getelementptr i32, ptr %11, i32 %p0
  store i32 %10, ptr %12
  ret void

}

