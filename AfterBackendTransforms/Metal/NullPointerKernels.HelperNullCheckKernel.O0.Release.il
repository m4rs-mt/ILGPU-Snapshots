; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: HelperNullCheckKernel  [intptr: i64]

define void @HelperNullCheckKernel(i32 %p0, ptr<i32> %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = getelementptr i32, ptr %p1, i32 %p0
  %2 = load i32, ptr %1
  store i32 %2, ptr %0
  %3 = load i32, ptr %0
  %4 = icmp sgt i32 %3, 15
  %5 = bitcast ptr %0 to ptr ; i32 -> void
  %6 = getelementptr i32, ptr %p1, i32 %p0
  %7 = icmp eq ptr<i32> %6, null
  %8 = getelementptr i32, ptr %p1, i32 %p0
  br i1 %4, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %9 = phi ptr<void> addrspace(local) [ null, %bb1 ], [ %5, %bb2 ]
  %10 = bitcast ptr %9 to ptr ; void -> i32
  %11 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) %10, i32 -1)
  %12 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) null, i32 1000)
  %13 = icmp eq ptr<i32> addrspace(local) %10, null
  %14 = add i32 %11, %12
  br i1 %13, label %bb5, label %bb4

bb4:
  %15 = load i32, ptr %10
  br label %bb6

bb5:
  br label %bb6

bb6:
  %16 = phi i32 [ %15, %bb4 ], [ -2, %bb5 ]
  %17 = add i32 %14, %16
  br i1 %7, label %bb8, label %bb7

bb7:
  %18 = load i32, ptr %6
  br label %bb9

bb8:
  br label %bb9

bb9:
  %19 = phi i32 [ %18, %bb7 ], [ 0, %bb8 ]
  %20 = add i32 %17, %19
  store i32 %20, ptr %8
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

