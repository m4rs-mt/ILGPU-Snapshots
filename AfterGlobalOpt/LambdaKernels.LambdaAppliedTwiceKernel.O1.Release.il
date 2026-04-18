; stage: AfterGlobalOpt  opt: O1
; module: LambdaAppliedTwiceKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @LambdaAppliedTwiceKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = call ptr<i32> addrspace(local) @ilgpu.gc_init(@g0)
  store i32 %p2, ptr %0
  %1 = load i32, ptr %0
  %2 = load i32, ptr %0
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  %5 = add i32 %p0, %1
  %6 = add i32 %p0, 1
  %7 = add i32 %6, %2
  %8 = add i32 %5, %7
  store i32 %8, ptr %4
  ret void

}

