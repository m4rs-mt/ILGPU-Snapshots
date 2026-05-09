; stage: AfterBackendTransforms  backend: Cuda  opt: O2
; module: ViewOfStructCounterKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%struct.1 = type { i16, i8, i32 }
%struct.2 = type { ptr<%struct.1> addrspace(global), i64 }

define void @ViewOfStructCounterKernel(i32 %p0, %struct.0 %p1, %struct.2 %p2, i32 %p3) {
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
  %16 = load i32, ptr %15
  %17 = icmp ne i32 %16, %p3
  %18 = extractvalue %struct.2 %p2, 0
  %19 = bitcast ptr %18 to ptr ; %struct.1 -> i8
  %20 = getelementptr i8, ptr %19, i64 4
  %21 = bitcast ptr %20 to ptr ; i8 -> i32
  br i1 %17, label %bb2, label %bb1

bb1:
  %22 = atomicrmw add ptr %21, i32 1 seq_cst
  br label %bb2

bb2:
  ret void

}

