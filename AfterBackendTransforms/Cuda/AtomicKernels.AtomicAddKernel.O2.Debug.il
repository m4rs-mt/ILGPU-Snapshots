; stage: AfterBackendTransforms  backend: Cuda  opt: O2
; module: AtomicAddKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @AtomicAddKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 2
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  %5 = trunc i64 %0 to i32
  %6 = icmp sgt i32 %5, 0
  %7 = icmp eq i32 %5, 0
  %8 = or i1 %6, %7
  %9 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %8, ptr %9)
  %10 = extractvalue %struct.0 %p1, 0
  %11 = atomicrmw add ptr %10, i32 %p2 seq_cst
  ret void

}

