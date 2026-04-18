; stage: AfterGlobalOpt  opt: O2
; module: LambdaConditionalKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @LambdaConditionalKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = call ptr<i32> addrspace(local) @ilgpu.gc_init(@g0)
  store i32 %p2, ptr %0
  %1 = load i32, ptr %0
  %2 = icmp sgt i32 %p0, %1
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  br i1 %2, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  %5 = load i32, ptr %0
  br label %bb3

bb3:
  %6 = phi i32 [ %p0, %bb1 ], [ %5, %bb2 ]
  store i32 %6, ptr %4
  ret void

}

