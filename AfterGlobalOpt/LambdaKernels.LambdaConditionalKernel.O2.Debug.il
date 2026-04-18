; stage: AfterGlobalOpt  opt: O2
; module: LambdaConditionalKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @LambdaConditionalKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = call ptr<i32> addrspace(local) @ilgpu.gc_init(@g0)
  store i32 %p2, ptr %0
  %1 = extractvalue %struct.0 %p1, 1
  %2 = icmp sge i64 %1, -2147483648
  %3 = icmp sle i64 %1, 2147483647
  %4 = and i1 %2, %3
  %5 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %4, ptr %5)
  %6 = icmp sge i32 %p0, 0
  %7 = trunc i64 %1 to i32
  %8 = icmp slt i32 %p0, %7
  %9 = and i1 %6, %8
  %10 = icmp eq i32 %p0, 0
  %11 = icmp eq i32 %7, 0
  %12 = and i1 %10, %11
  %13 = or i1 %9, %12
  %14 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %13, ptr %14)
  %15 = load i32, ptr %0
  %16 = icmp sgt i32 %p0, %15
  %17 = extractvalue %struct.0 %p1, 0
  %18 = getelementptr i32, ptr %17, i32 %p0
  br i1 %16, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  %19 = load i32, ptr %0
  br label %bb3

bb3:
  %20 = phi i32 [ %p0, %bb1 ], [ %19, %bb2 ]
  store i32 %20, ptr %18
  ret void

}

