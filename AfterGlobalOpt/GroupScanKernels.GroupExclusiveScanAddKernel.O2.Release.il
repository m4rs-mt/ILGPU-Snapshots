; stage: AfterGlobalOpt  opt: O2
; module: GroupExclusiveScanAddKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @GroupExclusiveScanAddKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.scan.Exclusive.Add(i32 1, i32 0)
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  store i32 %0, ptr %2
  ret void

}

