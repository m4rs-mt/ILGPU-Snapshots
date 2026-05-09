; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: MatrixMultiplyTiledKernel  [intptr: i64]

%struct.0 = type { i64, i32 }
%view.float = view float
%struct.1 = type { %view.float, i64, i64, i32 }
%struct.2 = type { i64, i64 }

@g0 = internal global float zeroinitializer ; shared
@g1 = internal global float zeroinitializer ; shared

define void @MatrixMultiplyTiledKernel(%struct.0 %p0, %struct.1 %p1, %struct.1 %p2, %struct.1 %p3, i32 %p4) {
entry:
  %0 = extractvalue %struct.1 %p1, 1 [Span: 2]
  %1 = extractvalue %struct.2 %0, 1
  %2 = trunc i64 %1 to i32
  %3 = extractvalue %struct.0 %p0, 0
  %4 = sext i32 %p4 to i64
  %5 = sdiv i64 %3, %4
  %6 = trunc i64 %5 to i32
  %7 = shl i32 %6, 1
  %8 = extractvalue %struct.0 %p0, 1
  %9 = ashr i32 %8, 1
  %10 = add i32 %7, %9
  %11 = extractvalue %struct.1 %p3, 1 [Span: 2]
  %12 = extractvalue %struct.2 %11, 0
  %13 = trunc i64 %12 to i32
  %14 = icmp sge i32 %10, %13
  %15 = extractvalue %struct.0 %p0, 0
  %16 = sext i32 %p4 to i64
  %17 = srem i64 %15, %16
  %18 = trunc i64 %17 to i32
  %19 = shl i32 %18, 1
  %20 = extractvalue %struct.0 %p0, 1
  %21 = srem i32 %20, 2
  %22 = add i32 %19, %21
  %23 = extractvalue %struct.1 %p3, 1 [Span: 2]
  %24 = extractvalue %struct.2 %23, 1
  %25 = trunc i64 %24 to i32
  %26 = icmp sge i32 %22, %25
  %27 = or i1 %14, %26
  %28 = extractvalue %struct.1 %p3, 0
  %29 = extractvalue %struct.1 %p3, 3
  %30 = mul i32 %22, %29
  %31 = add i32 %10, %30
  %32 = getelementptr float, ptr %28, i32 %31
  %33 = extractvalue %struct.1 %p1, 0
  %34 = extractvalue %struct.1 %p1, 3
  %35 = call %view.float @ilgpu.view.new(ptr @g0, i64 4)
  %36 = shl i32 %21, 1
  %37 = add i32 %9, %36
  %38 = getelementptr float, ptr %35, i32 %37
  %39 = extractvalue %struct.1 %p2, 0
  %40 = extractvalue %struct.1 %p2, 3
  %41 = mul i32 %22, %40
  %42 = call %view.float @ilgpu.view.new(ptr @g1, i64 4)
  %43 = shl i32 %21, 1
  %44 = add i32 %9, %43
  %45 = getelementptr float, ptr %42, i32 %44
  %46 = getelementptr float, ptr %35, i32 %9
  %47 = shl i32 %21, 1
  %48 = getelementptr float, ptr %42, i32 %47
  %49 = add i32 %9, 2
  %50 = getelementptr float, ptr %35, i32 %49
  %51 = shl i32 %21, 1
  %52 = add i32 %51, 1
  %53 = getelementptr float, ptr %42, i32 %52
  br label %bb1

bb1:
  br label %bb2

bb2:
  %54 = phi i32 [ 0, %bb1 ], [ %56, %bb7 ]
  %55 = phi float [ 0.0, %bb1 ], [ %74, %bb7 ]
  %56 = add i32 %54, 2
  %57 = icmp slt i32 %54, %2
  %58 = add i32 %21, %54
  %59 = mul i32 %58, %34
  %60 = add i32 %10, %59
  %61 = getelementptr float, ptr %33, i32 %60
  %62 = add i32 %9, %54
  %63 = add i32 %62, %41
  %64 = getelementptr float, ptr %39, i32 %63
  br i1 %57, label %bb6, label %bb3

bb3:
  br i1 %27, label %bb5, label %bb4

bb4:
  store float %55, ptr %32
  br label %bb5

bb5:
  ret void

bb6:
  %65 = load float, ptr %61
  store float %65, ptr %38
  %66 = load float, ptr %64
  store float %66, ptr %45
  call void @ilgpu.barrier.group()
  %67 = load float, ptr %46
  %68 = load float, ptr %48
  %69 = load float, ptr %50
  %70 = fmul float %67, %68
  %71 = fadd float %55, %70
  br label %bb7

bb7:
  %72 = load float, ptr %53
  call void @ilgpu.barrier.group()
  %73 = fmul float %69, %72
  %74 = fadd float %71, %73
  br label %bb2

}

