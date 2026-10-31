; stage: AfterBackendTransforms  backend: ROCm  opt: O1
; module: EmptyNotNullKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%struct.1 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local

define void @EmptyNotNullKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 2
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
  %14 = extractvalue %struct.0 %p1, 0
  %15 = getelementptr i32, ptr %14, i32 %p0
  %16 = icmp sgt i32 %p0, 1
  %17 = { ptr<i32> addrspace(local) @g0, i64 0 }  ; %struct.1
  %18 = select i1 %16, %struct.1 %17, %struct.1 null
  %19 = extractvalue %struct.1 %18, 0
  %20 = icmp eq ptr<i32> addrspace(local) %19, null
  %21 = extractvalue %struct.1 %18, 1
  %22 = trunc i64 %21 to i32
  %23 = select i1 %20, i32 -1, i32 %22
  store i32 %23, ptr %15
  ret void

}

