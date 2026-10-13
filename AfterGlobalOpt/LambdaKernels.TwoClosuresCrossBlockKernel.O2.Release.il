; stage: AfterGlobalOpt  opt: O2
; module: TwoClosuresCrossBlockKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i32, i32 }

@g0 = internal global %struct.1 zeroinitializer ; local

define void @TwoClosuresCrossBlockKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = call ptr<%struct.1> addrspace(local) @ilgpu.gc_init(@g0)
  %1 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  store i32 %p2, ptr %1
  %2 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  store i32 %p3, ptr %2
  %3 = icmp sgt i32 %p0, 0
  %4 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %5 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %6 = icmp sgt i32 %p0, 0
  %7 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %8 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %9 = extractvalue %struct.0 %p1, 0
  %10 = getelementptr i32, ptr %9, i32 %p0
  br i1 %3, label %bb2, label %bb1

bb1:
  %11 = load i32, ptr %4
  br label %bb4

bb2:
  br label %bb3

bb3:
  br label %bb4

bb4:
  %12 = phi i32 [ %11, %bb1 ], [ %p0, %bb3 ]
  %13 = load i32, ptr %5
  %14 = add i32 %12, %13
  br i1 %6, label %bb6, label %bb5

bb5:
  %15 = load i32, ptr %7
  br label %bb8

bb6:
  br label %bb7

bb7:
  br label %bb8

bb8:
  %16 = phi i32 [ %15, %bb5 ], [ %p0, %bb7 ]
  %17 = load i32, ptr %8
  %18 = mul i32 %16, %17
  %19 = add i32 %14, %18
  store i32 %19, ptr %10
  ret void

}

