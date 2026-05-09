; stage: AfterGlobalOpt  opt: O1
; module: ViewOfStructCounterKernel  [intptr: i64]

%struct.0 = type { i16, i8, i32 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }
%view.struct = view %struct.0
%view.i8 = view i8

define void @ViewOfStructCounterKernel(i32 %p0, %struct.1 %p1, %view.struct %p2, i32 %p3) {
entry:
  %0 = extractvalue %struct.1 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = load i32, ptr %1
  %3 = icmp ne i32 %2, %p3
  %4 = call %view.i8 @ilgpu.view.cast(%view.struct %p2)
  %5 = call i64 @ilgpu.view.length(%view.i8 %4)
  %6 = sub i64 %5, 4
  %7 = call %view.i8 @ilgpu.view.sub(%view.i8 %4, i64 4, i64 %6)
  %8 = call %view.i32 @ilgpu.view.cast(%view.i8 %7)
  %9 = getelementptr i32, ptr %8, i32 0
  br i1 %3, label %bb2, label %bb1

bb1:
  %10 = atomicrmw add ptr %9, i32 1 seq_cst
  br label %bb2

bb2:
  ret void

}

