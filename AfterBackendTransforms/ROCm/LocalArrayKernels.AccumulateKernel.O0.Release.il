; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: AccumulateKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @AccumulateKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = getelementptr i32, ptr @g0, i32 1
  %1 = getelementptr i32, ptr @g0, i32 2
  %2 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %3 = extractvalue %struct.0 %2, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  br label %bb1

bb1:
  store i32 1, ptr @g0
  store i32 2, ptr %0
  store i32 3, ptr %1
  br label %bb2

bb2:
  %5 = phi i32 [ 0, %bb1 ], [ %7, %bb4 ]
  %6 = phi i32 [ 0, %bb1 ], [ %11, %bb4 ]
  %7 = add i32 %5, 1
  %8 = icmp slt i32 %5, 3
  %9 = getelementptr i32, ptr @g0, i32 %5
  br i1 %8, label %bb4, label %bb3

bb3:
  store i32 %6, ptr %4
  ret void

bb4:
  %10 = load i32, ptr %9
  %11 = add i32 %6, %10
  br label %bb2

}

