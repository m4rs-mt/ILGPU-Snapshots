; stage: AfterGlobalOpt  opt: O1
; module: PointerToPointerKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @PointerToPointerKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = alloca i32, i32 1
  store i32 0, ptr %1
  %2 = alloca ptr<i32> addrspace(local), i32 1
  store ptr<i32> addrspace(local) null, ptr %2
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
  %17 = extractvalue %struct.0 %p1, 0
  %18 = getelementptr i32, ptr %17, i32 %p0
  %19 = load i32, ptr %18
  store i32 %19, ptr %0
  store i32 7, ptr %1
  store ptr<i32> addrspace(local) %0, ptr %2
  %20 = and i32 %p0, 1
  %21 = icmp ule i32 %20, 0
  %22 = bitcast ptr %2 to ptr ; ptr<i32> addrspace(local) -> ptr<void> addrspace(local)
  %23 = bitcast ptr %1 to ptr ; i32 -> void
  %24 = bitcast ptr %2 to ptr ; ptr<i32> addrspace(local) -> ptr<void> addrspace(local)
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
  br i1 %21, label %bb2, label %bb1

bb1:
  store ptr<void> addrspace(local) %23, ptr %22
  br label %bb2

bb2:
  %41 = load ptr<void> addrspace(local), ptr %24
  %42 = bitcast ptr %41 to ptr ; void -> i32
  %43 = load i32, ptr %42
  %44 = bitcast ptr %41 to ptr ; void -> i32
  %45 = add i32 %43, 1
  store i32 %45, ptr %44
  call void @ilgpu.debug.assert(i1 %28, ptr %29)
  call void @ilgpu.debug.assert(i1 %37, ptr %38)
  %46 = load i32, ptr %0
  %47 = load i32, ptr %1
  %48 = load ptr<i32> addrspace(local), ptr %2
  %49 = load i32, ptr %48
  %50 = mul i32 %47, 10
  %51 = add i32 %46, %50
  %52 = mul i32 %49, 100
  %53 = add i32 %51, %52
  store i32 %53, ptr %40
  ret void

}

