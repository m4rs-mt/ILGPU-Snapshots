; stage: AfterGlobalOpt  opt: O2
; module: HelperNullCheckKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @HelperNullCheckKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = load i32, ptr %2
  store i32 %3, ptr %0
  %4 = load i32, ptr %0
  %5 = icmp sgt i32 %4, 15
  %6 = bitcast ptr %0 to ptr ; i32 -> void
  %7 = select i1 %5, ptr<void> addrspace(local) %6, ptr<void> addrspace(local) null
  %8 = bitcast ptr %7 to ptr ; void -> i32
  %9 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) %8, i32 -1)
  %10 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) null, i32 1000)
  %11 = icmp eq ptr<i32> addrspace(local) %8, null
  %12 = extractvalue %struct.0 %p1, 0
  %13 = getelementptr i32, ptr %12, i32 %p0
  %14 = icmp eq ptr<i32> addrspace(global) %13, null
  %15 = extractvalue %struct.0 %p1, 0
  %16 = getelementptr i32, ptr %15, i32 %p0
  %17 = add i32 %9, %10
  br i1 %11, label %bb2, label %bb1

bb1:
  %18 = load i32, ptr %8
  br label %bb3

bb2:
  br label %bb3

bb3:
  %19 = phi i32 [ %18, %bb1 ], [ -2, %bb2 ]
  %20 = add i32 %17, %19
  br i1 %14, label %bb5, label %bb4

bb4:
  %21 = load i32, ptr %13
  br label %bb6

bb5:
  br label %bb6

bb6:
  %22 = phi i32 [ %21, %bb4 ], [ 0, %bb5 ]
  %23 = add i32 %20, %22
  store i32 %23, ptr %16
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

