; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: HelperNullCheckKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }

define void @HelperNullCheckKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %2 = extractvalue %struct.0 %1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  %4 = load i32, ptr %3
  store i32 %4, ptr %0
  %5 = load i32, ptr %0
  %6 = icmp sgt i32 %5, 15
  %7 = bitcast ptr %0 to ptr ; i32 -> void
  %8 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %9 = extractvalue %struct.0 %8, 0
  %10 = getelementptr i32, ptr %9, i32 %p0
  %11 = icmp eq ptr<i32> %10, null
  %12 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %13 = extractvalue %struct.0 %12, 0
  %14 = getelementptr i32, ptr %13, i32 %p0
  br i1 %6, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %15 = phi ptr<void> addrspace(local) [ null, %bb1 ], [ %7, %bb2 ]
  %16 = bitcast ptr %15 to ptr ; void -> i32
  %17 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) %16, i32 -1)
  %18 = call i32 @ReadOrDefault(ptr<i32> addrspace(local) null, i32 1000)
  %19 = icmp eq ptr<i32> addrspace(local) %16, null
  %20 = add i32 %17, %18
  br i1 %19, label %bb5, label %bb4

bb4:
  %21 = load i32, ptr %16
  br label %bb6

bb5:
  br label %bb6

bb6:
  %22 = phi i32 [ %21, %bb4 ], [ -2, %bb5 ]
  %23 = add i32 %20, %22
  br i1 %11, label %bb8, label %bb7

bb7:
  %24 = load i32, ptr %10
  br label %bb9

bb8:
  br label %bb9

bb9:
  %25 = phi i32 [ %24, %bb7 ], [ 0, %bb8 ]
  %26 = add i32 %23, %25
  store i32 %26, ptr %14
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

