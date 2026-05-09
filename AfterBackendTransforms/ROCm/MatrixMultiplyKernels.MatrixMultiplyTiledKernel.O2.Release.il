; stage: AfterBackendTransforms  backend: ROCm  opt: O2
; module: MatrixMultiplyTiledKernel  [intptr: i64]

%struct.0 = type { i64, i32 }
%struct.1 = type { ptr<float> addrspace(global), i64, i64, i64, i32 }
%struct.2 = type { i64, i64 }

@g0 = internal global float zeroinitializer ; shared
@g1 = internal global float zeroinitializer ; shared

define void @MatrixMultiplyTiledKernel(%struct.0 %p0, %struct.1 %p1, %struct.1 %p2, %struct.1 %p3, i32 %p4) {
entry:
  %0 = extractvalue %struct.1 %p1, 2 [Span: 2]
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
  %11 = extractvalue %struct.1 %p3, 2 [Span: 2]
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
  %23 = extractvalue %struct.1 %p3, 2 [Span: 2]
  %24 = extractvalue %struct.2 %23, 1
  %25 = trunc i64 %24 to i32
  %26 = icmp sge i32 %22, %25
  %27 = or i1 %14, %26
  %28 = extractvalue %struct.1 %p3, 0
  %29 = extractvalue %struct.1 %p3, 4
  %30 = mul i32 %22, %29
  %31 = add i32 %10, %30
  %32 = getelementptr float, ptr %28, i32 %31
  %33 = extractvalue %struct.1 %p1, 0
  %34 = extractvalue %struct.1 %p1, 4
  %35 = shl i32 %21, 1
  %36 = add i32 %9, %35
  %37 = getelementptr float, ptr @g0, i32 %36
  %38 = extractvalue %struct.1 %p2, 0
  %39 = extractvalue %struct.1 %p2, 4
  %40 = mul i32 %22, %39
  %41 = shl i32 %21, 1
  %42 = add i32 %9, %41
  %43 = getelementptr float, ptr @g1, i32 %42
  %44 = getelementptr float, ptr @g0, i32 %9
  %45 = shl i32 %21, 1
  %46 = getelementptr float, ptr @g1, i32 %45
  %47 = add i32 %9, 2
  %48 = getelementptr float, ptr @g0, i32 %47
  %49 = shl i32 %21, 1
  %50 = add i32 %49, 1
  %51 = getelementptr float, ptr @g1, i32 %50
  br label %bb1

bb1:
  br label %bb2

bb2:
  %52 = phi i32 [ 0, %bb1 ], [ %54, %bb7 ]
  %53 = phi float [ 0.0, %bb1 ], [ %72, %bb7 ]
  %54 = add i32 %52, 2
  %55 = icmp slt i32 %52, %2
  %56 = add i32 %21, %52
  %57 = mul i32 %56, %34
  %58 = add i32 %10, %57
  %59 = getelementptr float, ptr %33, i32 %58
  %60 = add i32 %9, %52
  %61 = add i32 %60, %40
  %62 = getelementptr float, ptr %38, i32 %61
  br i1 %55, label %bb6, label %bb3

bb3:
  br i1 %27, label %bb5, label %bb4

bb4:
  store float %53, ptr %32
  br label %bb5

bb5:
  ret void

bb6:
  %63 = load float, ptr %59
  store float %63, ptr %37
  %64 = load float, ptr %62
  store float %64, ptr %43
  call void @ilgpu.barrier.group()
  %65 = load float, ptr %44
  %66 = load float, ptr %46
  %67 = load float, ptr %48
  %68 = fmul float %65, %66
  %69 = fadd float %53, %68
  br label %bb7

bb7:
  %70 = load float, ptr %51
  call void @ilgpu.barrier.group()
  %71 = fmul float %67, %70
  %72 = fadd float %69, %71
  br label %bb2

}

