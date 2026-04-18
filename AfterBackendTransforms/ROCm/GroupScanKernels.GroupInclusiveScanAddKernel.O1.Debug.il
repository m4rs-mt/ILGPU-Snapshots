; stage: AfterBackendTransforms  backend: ROCm  opt: O1
; module: GroupInclusiveScanAddKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%view.i32 = view i32

@g0 = internal global i32 zeroinitializer ; shared

define void @GroupInclusiveScanAddKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 32)
  %1 = call i32 @ilgpu.subgroup.lane()
  %2 = getelementptr i32, ptr %0, i32 %1
  store i32 0, ptr %2
  call void @ilgpu.barrier.group()
  %3 = call i32 @ilgpu.subgroup.lane()
  %4 = icmp sge i32 %3, 1
  %5 = select i1 %4, i32 2, i32 1
  %6 = call i32 @ilgpu.shuffle.up(i32 %5, i32 2)
  %7 = icmp sge i32 %3, 2
  %8 = add i32 %5, %6
  %9 = select i1 %7, i32 %8, i32 %5
  %10 = call i32 @ilgpu.shuffle.up(i32 %9, i32 4)
  %11 = icmp sge i32 %3, 4
  %12 = add i32 %9, %10
  %13 = select i1 %11, i32 %12, i32 %9
  %14 = call i32 @ilgpu.shuffle.up(i32 %13, i32 8)
  %15 = icmp sge i32 %3, 8
  %16 = add i32 %13, %14
  %17 = select i1 %15, i32 %16, i32 %13
  %18 = call i32 @ilgpu.shuffle.up(i32 %17, i32 16)
  %19 = call i32 @ilgpu.subgroup.index()
  %20 = getelementptr i32, ptr %0, i32 %19
  store i32 32, ptr %20
  call void @ilgpu.barrier.group()
  %21 = getelementptr i32, ptr %0, i32 %1
  %22 = load i32, ptr %21
  %23 = call i32 @ilgpu.shuffle.up(i32 %22, i32 1)
  %24 = call i32 @ilgpu.subgroup.lane()
  %25 = icmp sge i32 %24, 1
  %26 = add i32 %22, %23
  %27 = select i1 %25, i32 %26, i32 %22
  %28 = call i32 @ilgpu.shuffle.up(i32 %27, i32 2)
  %29 = icmp sge i32 %24, 2
  %30 = add i32 %27, %28
  %31 = select i1 %29, i32 %30, i32 %27
  %32 = call i32 @ilgpu.shuffle.up(i32 %31, i32 4)
  %33 = icmp sge i32 %24, 4
  %34 = add i32 %31, %32
  %35 = select i1 %33, i32 %34, i32 %31
  %36 = call i32 @ilgpu.shuffle.up(i32 %35, i32 8)
  %37 = icmp sge i32 %24, 8
  %38 = add i32 %35, %36
  %39 = select i1 %37, i32 %38, i32 %35
  %40 = call i32 @ilgpu.shuffle.up(i32 %39, i32 16)
  %41 = icmp sge i32 %24, 16
  %42 = add i32 %39, %40
  %43 = select i1 %41, i32 %42, i32 %39
  %44 = call i32 @ilgpu.shuffle.up(i32 %43, i32 1)
  %45 = call i32 @ilgpu.subgroup.lane()
  %46 = icmp eq i32 %45, 0
  %47 = select i1 %46, i32 0, i32 %44
  %48 = call i32 @ilgpu.shuffle.idx(i32 %47, i32 %19)
  %49 = extractvalue %struct.0 %p1, 2
  %50 = icmp sge i64 %49, -2147483648
  %51 = icmp sle i64 %49, 2147483647
  %52 = and i1 %50, %51
  %53 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %52, ptr %53)
  %54 = icmp sge i32 %p0, 0
  %55 = trunc i64 %49 to i32
  %56 = icmp slt i32 %p0, %55
  %57 = and i1 %54, %56
  %58 = icmp eq i32 %p0, 0
  %59 = icmp eq i32 %55, 0
  %60 = and i1 %58, %59
  %61 = or i1 %57, %60
  %62 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %61, ptr %62)
  %63 = extractvalue %struct.0 %p1, 0
  %64 = getelementptr i32, ptr %63, i32 %p0
  %65 = icmp sge i32 %3, 16
  %66 = add i32 %17, %18
  %67 = select i1 %65, i32 %66, i32 %17
  %68 = add i32 %48, %67
  store i32 %68, ptr %64
  ret void

}

