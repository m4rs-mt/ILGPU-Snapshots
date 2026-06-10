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
  %3 = extractvalue %struct.0 %p1, 1
  %4 = icmp sge i64 %3, -2147483648
  %5 = icmp sle i64 %3, 2147483647
  %6 = and i1 %4, %5
  %7 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  %8 = icmp sge i32 %p0, 0
  %9 = trunc i64 %3 to i32
  %10 = icmp slt i32 %p0, %9
  %11 = and i1 %8, %10
  %12 = icmp eq i32 %p0, 0
  %13 = icmp eq i32 %9, 0
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %16 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  %17 = icmp sgt i32 %p0, 0
  %18 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %19 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %20 = icmp sgt i32 %p0, 0
  %21 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %22 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %23 = extractvalue %struct.0 %p1, 0
  %24 = getelementptr i32, ptr %23, i32 %p0
  br i1 %17, label %bb2, label %bb1

bb1:
  %25 = load i32, ptr %18
  br label %bb4

bb2:
  br label %bb3

bb3:
  br label %bb4

bb4:
  %26 = phi i32 [ %25, %bb1 ], [ %p0, %bb3 ]
  %27 = load i32, ptr %19
  %28 = add i32 %26, %27
  br i1 %20, label %bb6, label %bb5

bb5:
  %29 = load i32, ptr %21
  br label %bb8

bb6:
  br label %bb7

bb7:
  br label %bb8

bb8:
  %30 = phi i32 [ %29, %bb5 ], [ %p0, %bb7 ]
  %31 = load i32, ptr %22
  %32 = mul i32 %30, %31
  %33 = add i32 %28, %32
  store i32 %33, ptr %24
  ret void

}

