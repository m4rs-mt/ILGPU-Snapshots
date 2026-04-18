; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: TupleCreateKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%struct.2 = type { ptr<float> addrspace(global), i64 }
%struct.3 = type { ptr<float> addrspace(global), i64, i64, i8 }

define void @TupleCreateKernel(i32 %p0, %struct.1 %p1, %struct.3 %p2) {
entry:
  %0 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = shl i32 %p0, 1
  store i32 %3, ptr %2
  %4 = extractvalue %struct.3 %p2, 0 [Span: 2]
  %5 = extractvalue %struct.2 %4, 0
  %6 = getelementptr float, ptr %5, i32 %p0
  %7 = sitofp i32 %p0 to float
  %8 = fmul float %7, 3.0
  store float %8, ptr %6
  ret void

}

