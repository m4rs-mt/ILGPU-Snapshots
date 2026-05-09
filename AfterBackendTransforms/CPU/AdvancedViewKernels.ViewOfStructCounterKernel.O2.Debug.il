; stage: AfterBackendTransforms  backend: CPU  opt: O2
; module: ViewOfStructCounterKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i16, i8, i32 }
%view.struct = view %struct.1
%view.i8 = view i8

define void @ViewOfStructCounterKernel(i32 %p0, %struct.0 %p1, %view.struct %p2, i32 %p3) {
entry:
  %0 = extractvalue %struct.0 %p1, 1
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
  %16 = load i32, ptr %15
  %17 = icmp ne i32 %16, %p3
  %18 = call %view.i8 @ilgpu.view.cast(%view.struct %p2)
  %19 = call i64 @ilgpu.view.length(%view.i8 %18)
  %20 = sub i64 %19, 4
  %21 = call %view.i8 @ilgpu.view.sub(%view.i8 %18, i64 4, i64 %20)
  %22 = call %view.i32 @ilgpu.view.cast(%view.i8 %21)
  %23 = getelementptr i32, ptr %22, i32 0
  br i1 %17, label %bb2, label %bb1

bb1:
  %24 = atomicrmw add ptr %23, i32 1 seq_cst
  br label %bb2

bb2:
  ret void

}

