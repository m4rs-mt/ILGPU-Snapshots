; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: LocalNullCheckKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }

define void @LocalNullCheckKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %2 = extractvalue %struct.0 %1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  %4 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %5 = extractvalue %struct.0 %4, 0
  %6 = getelementptr i32, ptr %5, i32 %p0
  br label %bb1

bb1:
  %7 = load i32, ptr %3
  store i32 %7, ptr %0
  %8 = load i32, ptr %0
  %9 = icmp sle i32 %8, 15
  br i1 %9, label %bb3, label %bb2

bb2:
  br label %bb3

bb3:
  %10 = phi ptr<i32> addrspace(local) [ null, %bb1 ], [ %0, %bb2 ]
  %11 = icmp eq ptr<i32> addrspace(local) %10, null
  %12 = icmp eq ptr<i32> addrspace(local) %10, null
  br i1 %11, label %bb5, label %bb4

bb4:
  %13 = load i32, ptr %10
  %14 = add i32 %13, 100
  store i32 %14, ptr %10
  br label %bb5

bb5:
  %15 = load i32, ptr %0
  br i1 %12, label %bb7, label %bb6

bb6:
  br label %bb8

bb7:
  br label %bb8

bb8:
  %16 = phi i32 [ 2, %bb6 ], [ 1, %bb7 ]
  %17 = add i32 %15, %16
  store i32 %17, ptr %6
  ret void

}

