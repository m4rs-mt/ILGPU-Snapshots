; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: FixedSelectKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local
@g1 = internal global i32 zeroinitializer ; local

define void @FixedSelectKernel(i32 %p0, ptr<i32> %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = and i32 %p0, 1
  %1 = icmp eq i32 %0, 0
  %2 = { ptr<i32> addrspace(local) @g0, i64 2 }  ; %struct.0
  %3 = { ptr<i32> addrspace(local) @g1, i64 4 }  ; %struct.0
  %4 = addrspacecast ptr %p1 to ptr<i32> addrspace(global)
  %5 = getelementptr i32, ptr %4, i32 %p0
  %6 = add i32 %p0, 4
  %7 = getelementptr i32, ptr %4, i32 %6
  br i1 %1, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %8 = phi %struct.0 [ %2, %bb1 ], [ %3, %bb2 ]
  %9 = extractvalue %struct.0 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = icmp ne i32 %10, 0
  %12 = extractvalue %struct.0 %8, 0
  %13 = extractvalue %struct.0 %8, 1
  %14 = trunc i64 %13 to i32
  %15 = extractvalue %struct.0 %8, 1
  %16 = trunc i64 %15 to i32
  %17 = icmp ne i32 %16, 0
  %18 = extractvalue %struct.0 %8, 0
  %19 = extractvalue %struct.0 %8, 1
  %20 = trunc i64 %19 to i32
  br i1 %11, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %21 = phi ptr<i32> addrspace(local) [ %12, %bb5 ], [ null, %bb4 ]
  br label %bb7

bb7:
  %22 = phi i32 [ 0, %bb6 ], [ %23, %bb15 ]
  %23 = add i32 %22, 1
  %24 = icmp slt i32 %22, %14
  %25 = getelementptr i32, ptr %21, i32 %22
  %26 = add i32 %p0, %22
  br i1 %24, label %bb15, label %bb8

bb8:
  br i1 %17, label %bb10, label %bb9

bb9:
  br label %bb11

bb10:
  br label %bb11

bb11:
  %27 = phi ptr<i32> addrspace(local) [ %18, %bb10 ], [ null, %bb9 ]
  %28 = bitcast ptr %27 to ptr ; i32 -> i8
  br label %bb12

bb12:
  %29 = phi i32 [ 0, %bb11 ], [ %31, %bb14 ]
  %30 = phi i32 [ 0, %bb11 ], [ %37, %bb14 ]
  %31 = add i32 %29, 1
  %32 = icmp slt i32 %29, %20
  %33 = shl i32 %29, 2
  %34 = getelementptr i8, ptr %28, i32 %33
  br i1 %32, label %bb14, label %bb13

bb13:
  store i32 %30, ptr %5
  store i32 -7, ptr %7
  ret void

bb14:
  %35 = load i8, ptr %34
  %36 = zext i8 %35 to i32
  %37 = add i32 %30, %36
  br label %bb12

bb15:
  store i32 %26, ptr %25
  br label %bb7

}

