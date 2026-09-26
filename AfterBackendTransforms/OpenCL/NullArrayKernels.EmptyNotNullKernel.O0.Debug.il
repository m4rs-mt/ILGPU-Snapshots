; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: EmptyNotNullKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local

define void @EmptyNotNullKernel(i32 %p0, ptr<i32> %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = icmp sgt i32 %p0, 1
  %1 = { ptr<i32> addrspace(local) @g0, i64 0 }  ; %struct.0
  %2 = icmp sge i64 %p3, -2147483648
  %3 = icmp sle i64 %p3, 2147483647
  %4 = and i1 %2, %3
  %5 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %6 = icmp sge i32 %p0, 0
  %7 = trunc i64 %p3 to i32
  %8 = icmp slt i32 %p0, %7
  %9 = and i1 %6, %8
  %10 = icmp eq i32 %p0, 0
  %11 = icmp eq i32 %7, 0
  %12 = and i1 %10, %11
  %13 = or i1 %9, %12
  %14 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %15 = getelementptr i32, ptr %p1, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %16 = phi %struct.0 [ null, %bb1 ], [ %1, %bb2 ]
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  call void @ilgpu.debug.assert(i1 %13, ptr %14)
  %17 = extractvalue %struct.0 %16, 0
  %18 = icmp eq ptr<i32> addrspace(local) %17, null
  %19 = extractvalue %struct.0 %16, 1
  %20 = trunc i64 %19 to i32
  br i1 %18, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %21 = phi i32 [ %20, %bb4 ], [ -1, %bb5 ]
  store i32 %21, ptr %15
  ret void

}

