; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: ConditionalNullKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local

define void @ConditionalNullKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = icmp sge i64 %p3, -2147483648
  %1 = icmp sle i64 %p3, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  %4 = icmp sge i32 %p0, 0
  %5 = trunc i64 %p3 to i32
  %6 = icmp slt i32 %p0, %5
  %7 = and i1 %4, %6
  %8 = icmp eq i32 %p0, 0
  %9 = icmp eq i32 %5, 0
  %10 = and i1 %8, %9
  %11 = or i1 %7, %10
  %12 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  %13 = getelementptr i32, ptr %p1, i32 %p0
  %14 = and i32 %p0, 1
  %15 = icmp eq i32 %14, 0
  %16 = { ptr<i32> addrspace(local) @g0, i64 3 }  ; %struct.0
  %17 = select i1 %15, %struct.0 %16, %struct.0 null
  %18 = extractvalue %struct.0 %17, 0
  %19 = icmp eq ptr<i32> addrspace(local) %18, null
  %20 = extractvalue %struct.0 %17, 1
  %21 = trunc i64 %20 to i32
  %22 = select i1 %19, i32 -1, i32 %21
  store i32 %22, ptr %13
  ret void

}

