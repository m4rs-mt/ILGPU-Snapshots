; stage: AfterGlobalOpt  opt: O1
; module: MatrixMultiplyTiledKernel  [intptr: i64]

%struct.0 = type { i64, i32 }
%struct.1 = type { i64, i64 }
%view.float = view float
%struct.2 = type { %view.float, i64, i64, i32 }

@g0 = internal global float zeroinitializer ; shared
@g1 = internal global float zeroinitializer ; shared

define void @MatrixMultiplyTiledKernel(%struct.0 %p0, %struct.2 %p1, %struct.2 %p2, %struct.2 %p3, i32 %p4) {
entry:
  %0 = extractvalue %struct.2 %p1, 1 [Span: 2]
  %1 = extractvalue %struct.1 %0, 1
  %2 = trunc i64 %1 to i32
  %3 = extractvalue %struct.0 %p0, 0
  %4 = sext i32 %p4 to i64
  %5 = extractvalue %struct.0 %p0, 1
  %6 = ashr i32 %5, 1
  %7 = extractvalue %struct.2 %p3, 1 [Span: 2]
  %8 = extractvalue %struct.1 %7, 0
  %9 = trunc i64 %8 to i32
  %10 = extractvalue %struct.0 %p0, 0
  %11 = sext i32 %p4 to i64
  %12 = extractvalue %struct.0 %p0, 1
  %13 = srem i32 %12, 2
  %14 = extractvalue %struct.2 %p3, 1 [Span: 2]
  %15 = extractvalue %struct.1 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = extractvalue %struct.2 %p3, 0
  %18 = extractvalue %struct.2 %p3, 3
  %19 = extractvalue %struct.2 %p1, 0
  %20 = extractvalue %struct.2 %p1, 3
  %21 = call %view.float @ilgpu.view.new(ptr @g0, i64 4)
  %22 = shl i32 %13, 1
  %23 = add i32 %6, %22
  %24 = getelementptr float, ptr %21, i32 %23
  %25 = extractvalue %struct.2 %p2, 0
  %26 = extractvalue %struct.2 %p2, 3
  %27 = call %view.float @ilgpu.view.new(ptr @g1, i64 4)
  %28 = shl i32 %13, 1
  %29 = add i32 %6, %28
  %30 = getelementptr float, ptr %27, i32 %29
  %31 = getelementptr float, ptr %21, i32 %6
  %32 = shl i32 %13, 1
  %33 = getelementptr float, ptr %27, i32 %32
  %34 = add i32 %6, 2
  %35 = getelementptr float, ptr %21, i32 %34
  %36 = shl i32 %13, 1
  %37 = add i32 %36, 1
  %38 = getelementptr float, ptr %27, i32 %37
  br label %bb1

bb1:
  br label %bb2

bb2:
  %39 = phi i32 [ 0, %bb1 ], [ %41, %bb11 ]
  %40 = phi float [ 0.0, %bb1 ], [ %75, %bb11 ]
  %41 = add i32 %39, 2
  %42 = icmp slt i32 %39, %2
  %43 = sdiv i64 %3, %4
  %44 = trunc i64 %43 to i32
  %45 = shl i32 %44, 1
  %46 = add i32 %45, %6
  %47 = icmp sge i32 %46, %9
  %48 = srem i64 %10, %11
  %49 = trunc i64 %48 to i32
  %50 = shl i32 %49, 1
  %51 = add i32 %50, %13
  %52 = icmp slt i32 %51, %16
  %53 = mul i32 %51, %18
  %54 = add i32 %46, %53
  %55 = getelementptr float, ptr %17, i32 %54
  %56 = add i32 %13, %39
  %57 = mul i32 %56, %20
  %58 = add i32 %46, %57
  %59 = getelementptr float, ptr %19, i32 %58
  %60 = add i32 %6, %39
  %61 = mul i32 %51, %26
  %62 = add i32 %60, %61
  %63 = getelementptr float, ptr %25, i32 %62
  br i1 %42, label %bb10, label %bb3

bb3:
  br i1 %47, label %bb6, label %bb4

bb4:
  br label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %64 = phi i1 [ %52, %bb5 ], [ false, %bb6 ]
  %65 = xor i1 %64, -1
  br i1 %65, label %bb9, label %bb8

bb8:
  store float %40, ptr %55
  br label %bb9

bb9:
  ret void

bb10:
  %66 = load float, ptr %59
  store float %66, ptr %24
  %67 = load float, ptr %63
  store float %67, ptr %30
  call void @ilgpu.barrier.group()
  %68 = load float, ptr %31
  %69 = load float, ptr %33
  %70 = load float, ptr %35
  %71 = fmul float %68, %69
  %72 = fadd float %40, %71
  br label %bb11

bb11:
  %73 = load float, ptr %38
  call void @ilgpu.barrier.group()
  %74 = fmul float %70, %73
  %75 = fadd float %72, %74
  br label %bb2

}

