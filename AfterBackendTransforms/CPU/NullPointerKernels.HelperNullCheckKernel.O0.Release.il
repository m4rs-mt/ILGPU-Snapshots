; stage: AfterBackendTransforms  backend: CPU  opt: O0
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
  %7 = extractvalue %struct.0 %p1, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  %9 = icmp eq ptr<i32> %8, null
  %10 = extractvalue %struct.0 %p1, 0
  %11 = getelementptr i32, ptr %10, i32 %p0
  br i1 %5, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %12 = phi ptr<void> addrspace(local) [ null, %bb1 ], [ %6, %bb2 ]
  %13 = bitcast ptr %12 to ptr ; void -> i32
  %14 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) %13, i32 -1)
  %15 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) null, i32 1000)
  %16 = icmp eq ptr<i32> addrspace(local) %13, null
  %17 = add i32 %14, %15
  br i1 %16, label %bb5, label %bb4

bb4:
  %18 = load i32, ptr %13
  br label %bb6

bb5:
  br label %bb6

bb6:
  %19 = phi i32 [ %18, %bb4 ], [ -2, %bb5 ]
  %20 = add i32 %17, %19
  br i1 %9, label %bb8, label %bb7

bb7:
  %21 = load i32, ptr %8
  br label %bb9

bb8:
  br label %bb9

bb9:
  %22 = phi i32 [ %21, %bb7 ], [ 0, %bb8 ]
  %23 = add i32 %20, %22
  store i32 %23, ptr %11
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

