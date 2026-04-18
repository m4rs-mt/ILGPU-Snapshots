; stage: AfterGlobalOpt  opt: O1
; module: LengthKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @LengthKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = call array<i32, 1> @ilgpu.array.new(ptr @g0, i32 4)
  %3 = call i32 @ilgpu.array.length(array<i32, 1> %2)
  store i32 %3, ptr %1
  ret void

}

