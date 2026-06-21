; stage: AfterGlobalOpt  opt: O2
; module: MixedSpaceRefKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; shared

define void @MixedSpaceRefKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = icmp sge i32 %0, 32
  %2 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 32)
  %3 = getelementptr i32, ptr %2, i32 %0
  %4 = add i32 %0, 1
  %5 = mul i32 %4, 10
  %6 = extractvalue %struct.0 %p1, 1
  %7 = icmp sge i64 %6, -2147483648
  %8 = icmp sle i64 %6, 2147483647
  %9 = and i1 %7, %8
  %10 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %11 = icmp sge i32 %p0, 0
  %12 = trunc i64 %6 to i32
  %13 = icmp slt i32 %p0, %12
  %14 = and i1 %11, %13
  %15 = icmp eq i32 %p0, 0
  %16 = icmp eq i32 %12, 0
  %17 = and i1 %15, %16
  %18 = or i1 %14, %17
  %19 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %20 = extractvalue %struct.0 %p1, 0
  %21 = getelementptr i32, ptr %20, i32 %p0
  %22 = icmp sge i32 %0, 32
  %23 = srem i32 %0, 2
  %24 = icmp eq i32 %23, 0
  %25 = extractvalue %struct.0 %p1, 1
  %26 = icmp sge i64 %25, -2147483648
  %27 = icmp sle i64 %25, 2147483647
  %28 = and i1 %26, %27
  %29 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %30 = icmp sge i32 %p0, 0
  %31 = trunc i64 %25 to i32
  %32 = icmp slt i32 %p0, %31
  %33 = and i1 %30, %32
  %34 = icmp eq i32 %p0, 0
  %35 = icmp eq i32 %31, 0
  %36 = and i1 %34, %35
  %37 = or i1 %33, %36
  %38 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %39 = extractvalue %struct.0 %p1, 0
  %40 = getelementptr i32, ptr %39, i32 %p0
  %41 = addrspacecast ptr %40 to ptr<i32>
  %42 = getelementptr i32, ptr %2, i32 %0
  %43 = addrspacecast ptr %42 to ptr<i32>
  %44 = icmp sge i32 %0, 32
  %45 = extractvalue %struct.0 %p1, 1
  %46 = icmp sge i64 %45, -2147483648
  %47 = icmp sle i64 %45, 2147483647
  %48 = and i1 %46, %47
  %49 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %50 = icmp sge i32 %p0, 0
  %51 = trunc i64 %45 to i32
  %52 = icmp slt i32 %p0, %51
  %53 = and i1 %50, %52
  %54 = icmp eq i32 %p0, 0
  %55 = icmp eq i32 %51, 0
  %56 = and i1 %54, %55
  %57 = or i1 %53, %56
  %58 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %59 = extractvalue %struct.0 %p1, 0
  %60 = getelementptr i32, ptr %59, i32 %p0
  %61 = getelementptr i32, ptr %2, i32 %0
  br i1 %1, label %bb2, label %bb1

bb1:
  store i32 %5, ptr %3
  br label %bb2

bb2:
  call void @ilgpu.debug.assert(i1 %9, ptr %10)
  call void @ilgpu.debug.assert(i1 %18, ptr %19)
  store i32 %p0, ptr %21
  call void @ilgpu.barrier.group()
  br i1 %22, label %bb8, label %bb3

bb3:
  br i1 %24, label %bb6, label %bb4

bb4:
  call void @ilgpu.debug.assert(i1 %28, ptr %29)
  call void @ilgpu.debug.assert(i1 %37, ptr %38)
  br label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %62 = phi ptr<i32> [ %41, %bb5 ], [ %43, %bb6 ]
  %63 = load i32, ptr %62
  %64 = add i32 %63, 1
  store i32 %64, ptr %62
  br label %bb8

bb8:
  call void @ilgpu.barrier.group()
  br i1 %44, label %bb10, label %bb9

bb9:
  call void @ilgpu.debug.assert(i1 %48, ptr %49)
  call void @ilgpu.debug.assert(i1 %57, ptr %58)
  %65 = load i32, ptr %60
  %66 = load i32, ptr %61
  %67 = add i32 %65, %66
  store i32 %67, ptr %60
  br label %bb10

bb10:
  ret void

}

