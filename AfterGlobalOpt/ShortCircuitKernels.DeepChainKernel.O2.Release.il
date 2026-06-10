; stage: AfterGlobalOpt  opt: O2
; module: DeepChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DeepChainKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = and i32 %p2, 1
  %1 = icmp eq i32 %0, 0
  %2 = icmp ne i32 %0, 0
  %3 = and i32 %p2, 2
  %4 = icmp eq i32 %3, 0
  %5 = and i1 %2, %4
  %6 = or i1 %1, %5
  %7 = icmp ne i32 %0, 0
  %8 = icmp ne i32 %3, 0
  %9 = and i1 %7, %8
  %10 = and i32 %p2, 4
  %11 = icmp eq i32 %10, 0
  %12 = and i1 %9, %11
  %13 = or i1 %6, %12
  %14 = icmp ne i32 %0, 0
  %15 = icmp ne i32 %3, 0
  %16 = and i1 %14, %15
  %17 = icmp ne i32 %10, 0
  %18 = and i1 %16, %17
  %19 = and i32 %p2, 8
  %20 = icmp eq i32 %19, 0
  %21 = and i1 %18, %20
  %22 = or i1 %13, %21
  %23 = icmp ne i32 %0, 0
  %24 = icmp ne i32 %3, 0
  %25 = and i1 %23, %24
  %26 = icmp ne i32 %10, 0
  %27 = and i1 %25, %26
  %28 = icmp ne i32 %19, 0
  %29 = and i1 %27, %28
  %30 = and i32 %p2, 16
  %31 = icmp eq i32 %30, 0
  %32 = and i1 %29, %31
  %33 = or i1 %22, %32
  %34 = icmp ne i32 %0, 0
  %35 = icmp ne i32 %3, 0
  %36 = and i1 %34, %35
  %37 = icmp ne i32 %10, 0
  %38 = and i1 %36, %37
  %39 = icmp ne i32 %19, 0
  %40 = and i1 %38, %39
  %41 = icmp ne i32 %30, 0
  %42 = and i1 %40, %41
  %43 = and i32 %p2, 32
  %44 = icmp eq i32 %43, 0
  %45 = and i1 %42, %44
  %46 = or i1 %33, %45
  %47 = icmp ne i32 %0, 0
  %48 = icmp ne i32 %3, 0
  %49 = and i1 %47, %48
  %50 = icmp ne i32 %10, 0
  %51 = and i1 %49, %50
  %52 = icmp ne i32 %19, 0
  %53 = and i1 %51, %52
  %54 = icmp ne i32 %30, 0
  %55 = and i1 %53, %54
  %56 = icmp ne i32 %43, 0
  %57 = and i1 %55, %56
  %58 = and i32 %p2, 64
  %59 = icmp eq i32 %58, 0
  %60 = and i1 %57, %59
  %61 = or i1 %46, %60
  %62 = icmp ne i32 %0, 0
  %63 = icmp ne i32 %3, 0
  %64 = and i1 %62, %63
  %65 = icmp ne i32 %10, 0
  %66 = and i1 %64, %65
  %67 = icmp ne i32 %19, 0
  %68 = and i1 %66, %67
  %69 = icmp ne i32 %30, 0
  %70 = and i1 %68, %69
  %71 = icmp ne i32 %43, 0
  %72 = and i1 %70, %71
  %73 = icmp ne i32 %58, 0
  %74 = and i1 %72, %73
  %75 = and i32 %p2, 128
  %76 = icmp eq i32 %75, 0
  %77 = and i1 %74, %76
  %78 = or i1 %61, %77
  %79 = icmp ne i32 %0, 0
  %80 = icmp ne i32 %3, 0
  %81 = and i1 %79, %80
  %82 = icmp ne i32 %10, 0
  %83 = and i1 %81, %82
  %84 = icmp ne i32 %19, 0
  %85 = and i1 %83, %84
  %86 = icmp ne i32 %30, 0
  %87 = and i1 %85, %86
  %88 = icmp ne i32 %43, 0
  %89 = and i1 %87, %88
  %90 = icmp ne i32 %58, 0
  %91 = and i1 %89, %90
  %92 = icmp ne i32 %75, 0
  %93 = and i1 %91, %92
  %94 = and i32 %p2, 256
  %95 = icmp eq i32 %94, 0
  %96 = and i1 %93, %95
  %97 = or i1 %78, %96
  %98 = and i32 %p2, 512
  %99 = icmp ule i32 %98, 0
  %100 = or i1 %97, %99
  %101 = extractvalue %struct.0 %p1, 0
  %102 = getelementptr i32, ptr %101, i32 %p0
  %103 = extractvalue %struct.0 %p1, 0
  %104 = getelementptr i32, ptr %103, i32 %p0
  br i1 %100, label %bb2, label %bb1

bb1:
  store i32 1, ptr %102
  br label %bb3

bb2:
  store i32 0, ptr %104
  br label %bb3

bb3:
  ret void

}

