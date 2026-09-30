; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: HelperNullCheckKernel  [intptr: i64]

define void @HelperNullCheckKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = getelementptr i32, ptr %p1, i32 %p0
  %2 = load i32, ptr %1
  store i32 %2, ptr %0
  %3 = load i32, ptr %0
  %4 = icmp sgt i32 %3, 15
  %5 = bitcast ptr %0 to ptr ; i32 -> void
  %6 = select i1 %4, ptr<void> addrspace(local) %5, ptr<void> addrspace(local) null
  %7 = bitcast ptr %6 to ptr ; void -> i32
  %8 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) %7, i32 -1)
  %9 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) null, i32 1000)
  %10 = icmp eq ptr<i32> addrspace(local) %7, null
  %11 = getelementptr i32, ptr %p1, i32 %p0
  %12 = icmp eq ptr<i32> addrspace(global) %11, null
  %13 = getelementptr i32, ptr %p1, i32 %p0
  %14 = add i32 %8, %9
  br i1 %10, label %bb2, label %bb1

bb1:
  %15 = load i32, ptr %7
  br label %bb3

bb2:
  br label %bb3

bb3:
  %16 = phi i32 [ %15, %bb1 ], [ -2, %bb2 ]
  %17 = add i32 %14, %16
  br i1 %12, label %bb5, label %bb4

bb4:
  %18 = load i32, ptr %11
  br label %bb6

bb5:
  br label %bb6

bb6:
  %19 = phi i32 [ %18, %bb4 ], [ 0, %bb5 ]
  %20 = add i32 %17, %19
  store i32 %20, ptr %13
  ret void

}

define i32 @ReadOrDefault(ptr<i32> addrspace(local) %p0, i32 %p1) {
entry:
  %0 = icmp eq ptr<i32> addrspace(local) %p0, null
  br i1 %0, label %bb2, label %bb1

bb1:
  %1 = load i32, ptr %p0
  br label %bb3

bb2:
  br label %bb3

bb3:
  %2 = phi i32 [ %1, %bb1 ], [ %p1, %bb2 ]
  ret i32 %2

}

