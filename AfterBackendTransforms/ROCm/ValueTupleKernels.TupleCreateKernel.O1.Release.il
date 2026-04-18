; stage: AfterBackendTransforms  backend: ROCm  opt: O1
; module: TupleCreateKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%struct.1 = type { ptr<float> addrspace(global), i64, i64, i8 }

define void @TupleCreateKernel(i32 %p0, %struct.0 %p1, %struct.1 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = shl i32 %p0, 1
  store i32 %2, ptr %1
  %3 = extractvalue %struct.1 %p2, 0
  %4 = getelementptr float, ptr %3, i32 %p0
  %5 = sitofp i32 %p0 to float
  %6 = fmul float %5, 3.0
  store float %6, ptr %4
  ret void

}

