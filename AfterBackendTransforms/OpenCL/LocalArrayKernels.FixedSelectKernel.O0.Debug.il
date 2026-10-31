; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: FixedSelectKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local
@g1 = internal global i32 zeroinitializer ; local

define void @FixedSelectKernel(i32 %p0, ptr<i32> %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = and i32 %p0, 1
  %1 = icmp eq i32 %0, 0
  %2 = { ptr<i32> addrspace(local) @g0, i64 2 }  ; %struct.0
  %3 = { ptr<i32> addrspace(local) @g1, i64 4 }  ; %struct.0
  %4 = icmp sge i64 %p3, -2147483648
  %5 = icmp sle i64 %p3, 2147483647
  %6 = and i1 %4, %5
  %7 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %8 = icmp sge i32 %p0, 0
  %9 = trunc i64 %p3 to i32
  %10 = icmp slt i32 %p0, %9
  %11 = and i1 %8, %10
  %12 = icmp eq i32 %p0, 0
  %13 = icmp eq i32 %9, 0
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %16 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %17 = addrspacecast ptr %p1 to ptr<i32> addrspace(global)
  %18 = getelementptr i32, ptr %17, i32 %p0
  %19 = icmp sge i64 %p3, -2147483648
  %20 = icmp sle i64 %p3, 2147483647
  %21 = and i1 %19, %20
  %22 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %23 = add i32 %p0, 4
  %24 = icmp sge i32 %23, 0
  %25 = trunc i64 %p3 to i32
  %26 = icmp slt i32 %23, %25
  %27 = and i1 %24, %26
  %28 = icmp eq i32 %23, 0
  %29 = icmp eq i32 %25, 0
  %30 = and i1 %28, %29
  %31 = or i1 %27, %30
  %32 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %33 = getelementptr i32, ptr %17, i32 %23
  br i1 %1, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %34 = phi %struct.0 [ %2, %bb1 ], [ %3, %bb2 ]
  %35 = extractvalue %struct.0 %34, 1
  %36 = trunc i64 %35 to i32
  %37 = icmp ne i32 %36, 0
  %38 = extractvalue %struct.0 %34, 0
  %39 = extractvalue %struct.0 %34, 1
  %40 = trunc i64 %39 to i32
  %41 = extractvalue %struct.0 %34, 1
  %42 = trunc i64 %41 to i32
  %43 = icmp ne i32 %42, 0
  %44 = extractvalue %struct.0 %34, 0
  %45 = extractvalue %struct.0 %34, 1
  %46 = trunc i64 %45 to i32
  br i1 %37, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %47 = phi ptr<i32> addrspace(local) [ %38, %bb5 ], [ null, %bb4 ]
  br label %bb7

bb7:
  %48 = phi i32 [ 0, %bb6 ], [ %49, %bb15 ]
  %49 = add i32 %48, 1
  %50 = icmp slt i32 %48, %40
  %51 = getelementptr i32, ptr %47, i32 %48
  %52 = add i32 %p0, %48
  br i1 %50, label %bb15, label %bb8

bb8:
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  br i1 %43, label %bb10, label %bb9

bb9:
  br label %bb11

bb10:
  br label %bb11

bb11:
  %53 = phi ptr<i32> addrspace(local) [ %44, %bb10 ], [ null, %bb9 ]
  %54 = bitcast ptr %53 to ptr ; i32 -> i8
  br label %bb12

bb12:
  %55 = phi i32 [ 0, %bb11 ], [ %57, %bb14 ]
  %56 = phi i32 [ 0, %bb11 ], [ %63, %bb14 ]
  %57 = add i32 %55, 1
  %58 = icmp slt i32 %55, %46
  %59 = shl i32 %55, 2
  %60 = getelementptr i8, ptr %54, i32 %59
  br i1 %58, label %bb14, label %bb13

bb13:
  store i32 %56, ptr %18
  call void @ilgpu.debug.assert(i1 %21, ptr %22)
  call void @ilgpu.debug.assert(i1 %31, ptr %32)
  store i32 -7, ptr %33
  ret void

bb14:
  %61 = load i8, ptr %60
  %62 = zext i8 %61 to i32
  %63 = add i32 %56, %62
  br label %bb12

bb15:
  store i32 %52, ptr %51
  br label %bb7

}

