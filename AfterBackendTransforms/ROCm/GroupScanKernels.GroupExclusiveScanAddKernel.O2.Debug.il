; stage: AfterBackendTransforms  backend: ROCm  opt: O2
; module: GroupExclusiveScanAddKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%view.i32 = view i32

@g0 = internal global i32 zeroinitializer ; shared

define void @GroupExclusiveScanAddKernel(i32 %p0, %struct.0 %p1) {
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
  %19 = icmp sge i32 %3, 16
  %20 = add i32 %17, %18
  %21 = select i1 %19, i32 %20, i32 %17
  %22 = call i32 @ilgpu.shuffle.up(i32 %21, i32 1)
  %23 = call i32 @ilgpu.subgroup.index()
  %24 = getelementptr i32, ptr %0, i32 %23
  store i32 32, ptr %24
  call void @ilgpu.barrier.group()
  %25 = getelementptr i32, ptr %0, i32 %1
  %26 = load i32, ptr %25
  %27 = call i32 @ilgpu.shuffle.up(i32 %26, i32 1)
  %28 = call i32 @ilgpu.subgroup.lane()
  %29 = icmp sge i32 %28, 1
  %30 = add i32 %26, %27
  %31 = select i1 %29, i32 %30, i32 %26
  %32 = call i32 @ilgpu.shuffle.up(i32 %31, i32 2)
  %33 = icmp sge i32 %28, 2
  %34 = add i32 %31, %32
  %35 = select i1 %33, i32 %34, i32 %31
  %36 = call i32 @ilgpu.shuffle.up(i32 %35, i32 4)
  %37 = icmp sge i32 %28, 4
  %38 = add i32 %35, %36
  %39 = select i1 %37, i32 %38, i32 %35
  %40 = call i32 @ilgpu.shuffle.up(i32 %39, i32 8)
  %41 = icmp sge i32 %28, 8
  %42 = add i32 %39, %40
  %43 = select i1 %41, i32 %42, i32 %39
  %44 = call i32 @ilgpu.shuffle.up(i32 %43, i32 16)
  %45 = icmp sge i32 %28, 16
  %46 = add i32 %43, %44
  %47 = select i1 %45, i32 %46, i32 %43
  %48 = call i32 @ilgpu.shuffle.up(i32 %47, i32 1)
  %49 = call i32 @ilgpu.subgroup.lane()
  %50 = icmp eq i32 %49, 0
  %51 = select i1 %50, i32 0, i32 %48
  %52 = call i32 @ilgpu.shuffle.idx(i32 %51, i32 %23)
  %53 = extractvalue %struct.0 %p1, 2
  %54 = icmp sge i64 %53, -2147483648
  %55 = icmp sle i64 %53, 2147483647
  %56 = and i1 %54, %55
  %57 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %56, ptr %57)
  %58 = icmp sge i32 %p0, 0
  %59 = trunc i64 %53 to i32
  %60 = icmp slt i32 %p0, %59
  %61 = and i1 %58, %60
  %62 = icmp eq i32 %p0, 0
  %63 = icmp eq i32 %59, 0
  %64 = and i1 %62, %63
  %65 = or i1 %61, %64
  %66 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %65, ptr %66)
  %67 = extractvalue %struct.0 %p1, 0
  %68 = getelementptr i32, ptr %67, i32 %p0
  %69 = call i32 @ilgpu.subgroup.lane()
  %70 = icmp eq i32 %69, 0
  %71 = select i1 %70, i32 0, i32 %22
  %72 = add i32 %52, %71
  store i32 %72, ptr %68
  ret void

}

