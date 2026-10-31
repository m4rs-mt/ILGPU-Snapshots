; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: LocalNullCheckKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @LocalNullCheckKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  br label %bb1

bb1:
  %5 = load i32, ptr %2
  store i32 %5, ptr %0
  %6 = load i32, ptr %0
  %7 = icmp sle i32 %6, 15
  br i1 %7, label %bb3, label %bb2

bb2:
  br label %bb3

bb3:
  %8 = phi ptr<i32> addrspace(local) [ null, %bb1 ], [ %0, %bb2 ]
  %9 = icmp eq ptr<i32> addrspace(local) %8, null
  %10 = icmp eq ptr<i32> addrspace(local) %8, null
  br i1 %9, label %bb5, label %bb4

bb4:
  %11 = load i32, ptr %8
  %12 = add i32 %11, 100
  store i32 %12, ptr %8
  br label %bb5

bb5:
  %13 = load i32, ptr %0
  br i1 %10, label %bb7, label %bb6

bb6:
  br label %bb8

bb7:
  br label %bb8

bb8:
  %14 = phi i32 [ 2, %bb6 ], [ 1, %bb7 ]
  %15 = add i32 %13, %14
  store i32 %15, ptr %4
  ret void

}

