; stage: AfterBackendTransforms  backend: Cuda  opt: O1
; module: AccumulateKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @AccumulateKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = getelementptr i32, ptr @g0, i32 1
  %1 = getelementptr i32, ptr @g0, i32 2
  %2 = extractvalue %struct.0 %p1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  br label %bb1

bb1:
  store i32 1, ptr @g0
  store i32 2, ptr %0
  store i32 3, ptr %1
  br label %bb2

bb2:
  %4 = phi i32 [ 0, %bb1 ], [ %6, %bb4 ]
  %5 = phi i32 [ 0, %bb1 ], [ %10, %bb4 ]
  %6 = add i32 %4, 1
  %7 = icmp slt i32 %4, 3
  %8 = getelementptr i32, ptr @g0, i32 %4
  br i1 %7, label %bb4, label %bb3

bb3:
  store i32 %5, ptr %3
  ret void

bb4:
  %9 = load i32, ptr %8
  %10 = add i32 %5, %9
  br label %bb2

}

