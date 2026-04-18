; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: AccumulateKernel  [intptr: i64]

@g0 = internal global i32 zeroinitializer ; local

define void @AccumulateKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = getelementptr i32, ptr @g0, i32 1
  %1 = getelementptr i32, ptr @g0, i32 2
  %2 = getelementptr i32, ptr %p1, i32 %p0
  br label %bb1

bb1:
  store i32 1, ptr @g0
  store i32 2, ptr %0
  store i32 3, ptr %1
  br label %bb2

bb2:
  %3 = phi i32 [ 0, %bb1 ], [ %5, %bb4 ]
  %4 = phi i32 [ 0, %bb1 ], [ %9, %bb4 ]
  %5 = add i32 %3, 1
  %6 = icmp slt i32 %3, 3
  %7 = getelementptr i32, ptr @g0, i32 %3
  br i1 %6, label %bb4, label %bb3

bb3:
  store i32 %4, ptr %2
  ret void

bb4:
  %8 = load i32, ptr %7
  %9 = add i32 %4, %8
  br label %bb2

}

