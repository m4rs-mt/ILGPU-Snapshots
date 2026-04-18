; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: AtomicAddKernel  [intptr: i64]

define void @AtomicAddKernel(i32 %p0, i32 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = icmp sge i64 %p4, -2147483648
  %1 = icmp sle i64 %p4, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  %4 = trunc i64 %p4 to i32
  %5 = icmp sgt i32 %4, 0
  %6 = icmp eq i32 %4, 0
  %7 = or i1 %5, %6
  %8 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %7, ptr %8)
  %9 = atomicrmw add ptr %p2, i32 %p1 seq_cst
  ret void

}

