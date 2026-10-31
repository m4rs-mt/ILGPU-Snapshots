; stage: AfterGlobalOpt  opt: O2
; module: LocalLessKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i32, i32, i32, i32 }

define void @LocalLessKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = extractvalue %struct.0 %p1, 1
  %2 = icmp sge i64 %1, -2147483648
  %3 = icmp sle i64 %1, 2147483647
  %4 = and i1 %2, %3
  %5 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  %6 = icmp sge i32 %p0, 0
  %7 = trunc i64 %1 to i32
  %8 = icmp slt i32 %p0, %7
  %9 = and i1 %6, %8
  %10 = icmp eq i32 %p0, 0
  %11 = icmp eq i32 %7, 0
  %12 = and i1 %10, %11
  %13 = or i1 %9, %12
  %14 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %13, ptr %14)
  %15 = extractvalue %struct.0 %p1, 0
  %16 = getelementptr i32, ptr %15, i32 %p0
  %17 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %18 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %19 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 2
  %20 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 3
  %21 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %22 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %23 = getelementptr i32, ptr %22, i32 4
  %24 = extractvalue %struct.0 %p1, 1
  %25 = icmp sge i64 %24, -2147483648
  %26 = icmp sle i64 %24, 2147483647
  %27 = and i1 %25, %26
  %28 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %29 = icmp sge i32 %p0, 0
  %30 = trunc i64 %24 to i32
  %31 = icmp slt i32 %p0, %30
  %32 = and i1 %29, %31
  %33 = icmp eq i32 %p0, 0
  %34 = icmp eq i32 %30, 0
  %35 = and i1 %33, %34
  %36 = or i1 %32, %35
  %37 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %38 = extractvalue %struct.0 %p1, 0
  %39 = getelementptr i32, ptr %38, i32 %p0
  br label %bb1

bb1:
  %40 = load i32, ptr %16
  store i32 %40, ptr %17
  store i32 2, ptr %18
  store i32 3, ptr %19
  store i32 4, ptr %20
  br label %bb2

bb2:
  %41 = phi ptr<i32> addrspace(local) [ %21, %bb1 ], [ %43, %bb4 ]
  %42 = phi i32 [ 0, %bb1 ], [ %46, %bb4 ]
  %43 = getelementptr i32, ptr %41, i32 1
  %44 = icmp ult ptr<i32> addrspace(local) %41, %23
  br i1 %44, label %bb4, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %27, ptr %28)
  call void @ilgpu.debug.assert(i1 %36, ptr %37)
  store i32 %42, ptr %39
  ret void

bb4:
  %45 = load i32, ptr %41
  %46 = add i32 %42, %45
  br label %bb2

}

