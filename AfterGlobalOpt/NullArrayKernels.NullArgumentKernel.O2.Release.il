; stage: AfterGlobalOpt  opt: O2
; module: NullArgumentKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local
@g1 = internal global i32 zeroinitializer ; local

define void @NullArgumentKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 0)
  %3 = call i32 @ilgpu.array.length(array<i32, 1> %2)
  %4 = mul i32 %3, 10
  %5 = add i32 %4, -100
  %6 = call array<i32, 1> @ilgpu.array.new(ptr @g1, i32 3)
  %7 = call i32 @ilgpu.array.length(array<i32, 1> %6)
  %8 = add i32 %5, %7
  %9 = add i32 %8, 1000
  store i32 %9, ptr %1
  ret void

}

