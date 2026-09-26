; stage: AfterBackendTransforms  backend: CPU  opt: O0
; module: EmptyNotNullKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @EmptyNotNullKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = icmp sgt i32 %p0, 1
  %1 = call %view.i32 @ilgpu.view.new(ptr @g0, i64 0)
  %2 = extractvalue %struct.0 %p1, 1
  %3 = icmp sge i64 %2, -2147483648
  %4 = icmp sle i64 %2, 2147483647
  %5 = and i1 %3, %4
  %6 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %7 = icmp sge i32 %p0, 0
  %8 = trunc i64 %2 to i32
  %9 = icmp slt i32 %p0, %8
  %10 = and i1 %7, %9
  %11 = icmp eq i32 %p0, 0
  %12 = icmp eq i32 %8, 0
  %13 = and i1 %11, %12
  %14 = or i1 %10, %13
  %15 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %16 = extractvalue %struct.0 %p1, 0
  %17 = getelementptr i32, ptr %16, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %18 = phi %view.i32 [ null, %bb1 ], [ %1, %bb2 ]
  call void @ilgpu.debug.assert(i1 %5, ptr %6)
  call void @ilgpu.debug.assert(i1 %14, ptr %15)
  %19 = getelementptr i32, ptr %18, i32 0
  %20 = icmp eq ptr<i32> addrspace(local) %19, null
  %21 = call i64 @ilgpu.view.length(%view.i32 %18)
  br i1 %20, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %22 = phi i32 [ %21, %bb4 ], [ -1, %bb5 ]
  store i32 %22, ptr %17
  ret void

}

