; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: LessThanKernel  [intptr: i64]

%struct.0 = type { ptr<i16> addrspace(global), i64 }
%struct.1 = type { ptr<i16> addrspace(global), i64, i64, i8 }
%struct.2 = type { ptr<i32> addrspace(global), i64 }
%struct.3 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @LessThanKernel(i32 %p0, %struct.1 %p1, %struct.1 %p2, %struct.3 %p3) {
entry:
  %0 = extractvalue %struct.3 %p3, 2
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  %5 = icmp sge i32 %p0, 0
  %6 = trunc i64 %0 to i32
  %7 = icmp slt i32 %p0, %6
  %8 = and i1 %5, %7
  %9 = icmp eq i32 %p0, 0
  %10 = icmp eq i32 %6, 0
  %11 = and i1 %9, %10
  %12 = or i1 %8, %11
  %13 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %12, ptr %13)
  %14 = extractvalue %struct.1 %p1, 2
  %15 = icmp sge i64 %14, -2147483648
  %16 = icmp sle i64 %14, 2147483647
  %17 = and i1 %15, %16
  %18 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %17, ptr %18)
  %19 = icmp sge i32 %p0, 0
  %20 = trunc i64 %14 to i32
  %21 = icmp slt i32 %p0, %20
  %22 = and i1 %19, %21
  %23 = icmp eq i32 %p0, 0
  %24 = icmp eq i32 %20, 0
  %25 = and i1 %23, %24
  %26 = or i1 %22, %25
  %27 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %26, ptr %27)
  %28 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %29 = extractvalue %struct.0 %28, 0
  %30 = getelementptr i16, ptr %29, i32 %p0
  %31 = load i16, ptr %30
  %32 = extractvalue %struct.1 %p2, 2
  %33 = icmp sge i64 %32, -2147483648
  %34 = icmp sle i64 %32, 2147483647
  %35 = and i1 %33, %34
  %36 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %35, ptr %36)
  %37 = icmp sge i32 %p0, 0
  %38 = trunc i64 %32 to i32
  %39 = icmp slt i32 %p0, %38
  %40 = and i1 %37, %39
  %41 = icmp eq i32 %p0, 0
  %42 = icmp eq i32 %38, 0
  %43 = and i1 %41, %42
  %44 = or i1 %40, %43
  %45 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %44, ptr %45)
  %46 = extractvalue %struct.1 %p2, 0 [Span: 2]
  %47 = extractvalue %struct.0 %46, 0
  %48 = getelementptr i16, ptr %47, i32 %p0
  %49 = load i16, ptr %48
  %50 = icmp slt i16 %31, %49
  %51 = extractvalue %struct.3 %p3, 0 [Span: 2]
  %52 = extractvalue %struct.2 %51, 0
  %53 = getelementptr i32, ptr %52, i32 %p0
  br i1 %50, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %54 = phi i32 [ 0, %bb1 ], [ 1, %bb2 ]
  store i32 %54, ptr %53
  ret void

}

