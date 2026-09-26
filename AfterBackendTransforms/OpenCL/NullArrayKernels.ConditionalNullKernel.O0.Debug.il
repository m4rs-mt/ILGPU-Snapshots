; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: ConditionalNullKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local

define void @ConditionalNullKernel(i32 %p0, ptr<i32> %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = and i32 %p0, 1
  %1 = icmp eq i32 %0, 0
  %2 = { ptr<i32> addrspace(local) @g0, i64 3 }  ; %struct.0
  %3 = icmp sge i64 %p3, -2147483648
  %4 = icmp sle i64 %p3, 2147483647
  %5 = and i1 %3, %4
  %6 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %7 = icmp sge i32 %p0, 0
  %8 = trunc i64 %p3 to i32
  %9 = icmp slt i32 %p0, %8
  %10 = and i1 %7, %9
  %11 = icmp eq i32 %p0, 0
  %12 = icmp eq i32 %8, 0
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %16 = getelementptr i32, ptr %p1, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %17 = phi %struct.0 [ null, %bb1 ], [ %2, %bb2 ]
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  %18 = extractvalue %struct.0 %17, 0
  %19 = icmp eq ptr<i32> addrspace(local) %18, null
  %20 = extractvalue %struct.0 %17, 1
  %21 = trunc i64 %20 to i32
  br i1 %19, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %22 = phi i32 [ %21, %bb4 ], [ -1, %bb5 ]
  store i32 %22, ptr %16
  ret void

}

