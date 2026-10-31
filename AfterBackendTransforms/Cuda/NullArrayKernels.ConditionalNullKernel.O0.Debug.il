; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: ConditionalNullKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }
%struct.2 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local

define void @ConditionalNullKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = and i32 %p0, 1
  %1 = icmp eq i32 %0, 0
  %2 = { ptr<i32> addrspace(local) @g0, i64 3 }  ; %struct.2
  %3 = extractvalue %struct.1 %p1, 2
  %4 = icmp sge i64 %3, -2147483648
  %5 = icmp sle i64 %3, 2147483647
  %6 = and i1 %4, %5
  %7 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %8 = icmp sge i32 %p0, 0
  %9 = trunc i64 %3 to i32
  %10 = icmp slt i32 %p0, %9
  %11 = and i1 %8, %10
  %12 = icmp eq i32 %p0, 0
  %13 = icmp eq i32 %9, 0
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %16 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %17 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %18 = extractvalue %struct.0 %17, 0
  %19 = getelementptr i32, ptr %18, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %20 = phi %struct.2 [ null, %bb1 ], [ %2, %bb2 ]
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  %21 = extractvalue %struct.2 %20, 0
  %22 = icmp eq ptr<i32> addrspace(local) %21, null
  %23 = extractvalue %struct.2 %20, 1
  %24 = trunc i64 %23 to i32
  br i1 %22, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %25 = phi i32 [ %24, %bb4 ], [ -1, %bb5 ]
  store i32 %25, ptr %19
  ret void

}

