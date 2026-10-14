; stage: AfterGlobalOpt  opt: O2
; module: LocalRefHelperKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @LocalRefHelperKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = mul i32 %p0, 10
  store i32 %1, ptr %0
  call void @Increment(ptr<i32> addrspace(local) %0)
  %2 = extractvalue %struct.0 %p1, 1
  %3 = icmp sge i64 %2, -2147483648
  %4 = icmp sle i64 %2, 2147483647
  %5 = and i1 %3, %4
  %6 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  %7 = icmp sge i32 %p0, 0
  %8 = trunc i64 %2 to i32
  %9 = icmp slt i32 %p0, %8
  %10 = and i1 %7, %9
  %11 = icmp eq i32 %p0, 0
  %12 = icmp eq i32 %8, 0
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  %16 = load i32, ptr %0
  %17 = extractvalue %struct.0 %p1, 0
  %18 = getelementptr i32, ptr %17, i32 %p0
  store i32 %16, ptr %18
  ret void

}

define void @Increment(ptr<i32> addrspace(local) %p0) {
entry:
  %0 = load i32, ptr %p0
  %1 = add i32 %0, 1
  store i32 %1, ptr %p0
  ret void

}

