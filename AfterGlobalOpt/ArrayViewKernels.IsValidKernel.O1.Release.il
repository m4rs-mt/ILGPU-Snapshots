; stage: AfterGlobalOpt  opt: O1
; module: IsValidKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @IsValidKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2) {
entry:
  %0 = extractvalue %struct.0 %p2, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = extractvalue %struct.0 %p1, 0
  %3 = call i64 @ilgpu.view.length(%view.i32 %2)
  %4 = icmp sgt i64 %3, 0
  %5 = select i1 %4, i32 1, i32 0
  store i32 %5, ptr %1
  ret void

}

