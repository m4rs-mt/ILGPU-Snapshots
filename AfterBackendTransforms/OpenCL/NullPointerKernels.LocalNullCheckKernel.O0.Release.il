; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: LocalNullCheckKernel  [intptr: i64]

define void @LocalNullCheckKernel(i32 %p0, ptr<i32> %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = getelementptr i32, ptr %p1, i32 %p0
  %2 = getelementptr i32, ptr %p1, i32 %p0
  br label %bb1

bb1:
  %3 = load i32, ptr %1
  store i32 %3, ptr %0
  %4 = load i32, ptr %0
  %5 = icmp sle i32 %4, 15
  br i1 %5, label %bb3, label %bb2

bb2:
  br label %bb3

bb3:
  %6 = phi ptr<i32> addrspace(local) [ null, %bb1 ], [ %0, %bb2 ]
  %7 = icmp eq ptr<i32> addrspace(local) %6, null
  %8 = icmp eq ptr<i32> addrspace(local) %6, null
  br i1 %7, label %bb5, label %bb4

bb4:
  %9 = load i32, ptr %6
  %10 = add i32 %9, 100
  store i32 %10, ptr %6
  br label %bb5

bb5:
  %11 = load i32, ptr %0
  br i1 %8, label %bb7, label %bb6

bb6:
  br label %bb8

bb7:
  br label %bb8

bb8:
  %12 = phi i32 [ 2, %bb6 ], [ 1, %bb7 ]
  %13 = add i32 %11, %12
  store i32 %13, ptr %2
  ret void

}

