; stage: AfterGlobalOpt  opt: O0
; module: InterleaveFieldsKernel  [intptr: i64]

%struct.0 = type { i32, i32, i32, i32 }
%struct.1 = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%view.struct = view %struct.1
%struct.2 = type { %view.struct, i64, i8 }

define void @InterleaveFieldsKernel(i32 %p0, %struct.2 %p1) {
entry:
  %0 = alloca %struct.2, i32 1
  store %struct.2 %p1, ptr %0
  %1 = call %view.struct @get_BaseView(ptr<%struct.2> addrspace(local) %0)
  %2 = call i32 @ComputeLinearIndex(ptr<%struct.2> addrspace(local) %0, i32 %p0)
  %3 = alloca i32, i32 1
  store i32 %p0, ptr %3
  %4 = call i32 @get_X(ptr<i32> addrspace(local) %3)
  %5 = getelementptr %struct.1, ptr %1, i32 %2
  %6 = getelementptr inbounds %struct.1, ptr %5, i32 0, i32 0
  %7 = bitcast ptr %6 to ptr ; %struct.0 -> i32
  store i32 %4, ptr %7
  %8 = call %view.struct @get_BaseView(ptr<%struct.2> addrspace(local) %0)
  %9 = call i32 @ComputeLinearIndex(ptr<%struct.2> addrspace(local) %0, i32 %p0)
  %10 = alloca i32, i32 1
  store i32 0, ptr %10
  call void @.ctor(ptr<i32> addrspace(local) %10, i32 1)
  %11 = load i32, ptr %10
  %12 = alloca i32, i32 1
  store i32 %p0, ptr %12
  %13 = alloca i32, i32 1
  store i32 %11, ptr %13
  %14 = alloca i32, i32 1
  %15 = call i32 @get_X(ptr<i32> addrspace(local) %12)
  %16 = call i32 @get_X(ptr<i32> addrspace(local) %13)
  store i32 0, ptr %14
  %17 = add i32 %15, %16
  call void @.ctor(ptr<i32> addrspace(local) %14, i32 %17)
  %18 = load i32, ptr %14
  %19 = alloca i32, i32 1
  store i32 %18, ptr %19
  %20 = call i32 @get_X(ptr<i32> addrspace(local) %19)
  %21 = getelementptr %struct.1, ptr %8, i32 %9
  %22 = getelementptr inbounds %struct.1, ptr %21, i32 0, i32 0
  %23 = bitcast ptr %22 to ptr ; %struct.0 -> i32
  %24 = getelementptr i32, ptr %23, i32 1
  store i32 %20, ptr %24
  %25 = call %view.struct @get_BaseView(ptr<%struct.2> addrspace(local) %0)
  %26 = call i32 @ComputeLinearIndex(ptr<%struct.2> addrspace(local) %0, i32 %p0)
  %27 = alloca i32, i32 1
  store i32 0, ptr %27
  call void @.ctor(ptr<i32> addrspace(local) %27, i32 2)
  %28 = load i32, ptr %27
  %29 = alloca i32, i32 1
  store i32 %p0, ptr %29
  %30 = alloca i32, i32 1
  store i32 %28, ptr %30
  %31 = alloca i32, i32 1
  %32 = call i32 @get_X(ptr<i32> addrspace(local) %29)
  %33 = call i32 @get_X(ptr<i32> addrspace(local) %30)
  store i32 0, ptr %31
  %34 = add i32 %32, %33
  call void @.ctor(ptr<i32> addrspace(local) %31, i32 %34)
  %35 = load i32, ptr %31
  %36 = alloca i32, i32 1
  store i32 %35, ptr %36
  %37 = call i32 @get_X(ptr<i32> addrspace(local) %36)
  %38 = getelementptr %struct.1, ptr %25, i32 %26
  %39 = getelementptr inbounds %struct.1, ptr %38, i32 0, i32 0
  %40 = bitcast ptr %39 to ptr ; %struct.0 -> i32
  %41 = getelementptr i32, ptr %40, i32 2
  store i32 %37, ptr %41
  %42 = call %view.struct @get_BaseView(ptr<%struct.2> addrspace(local) %0)
  %43 = call i32 @ComputeLinearIndex(ptr<%struct.2> addrspace(local) %0, i32 %p0)
  %44 = alloca i32, i32 1
  store i32 0, ptr %44
  call void @.ctor(ptr<i32> addrspace(local) %44, i32 3)
  %45 = load i32, ptr %44
  %46 = alloca i32, i32 1
  store i32 %p0, ptr %46
  %47 = alloca i32, i32 1
  store i32 %45, ptr %47
  %48 = alloca i32, i32 1
  %49 = call i32 @get_X(ptr<i32> addrspace(local) %46)
  %50 = call i32 @get_X(ptr<i32> addrspace(local) %47)
  store i32 0, ptr %48
  %51 = add i32 %49, %50
  call void @.ctor(ptr<i32> addrspace(local) %48, i32 %51)
  %52 = load i32, ptr %48
  %53 = alloca i32, i32 1
  store i32 %52, ptr %53
  %54 = call i32 @get_X(ptr<i32> addrspace(local) %53)
  %55 = getelementptr %struct.1, ptr %42, i32 %43
  %56 = getelementptr inbounds %struct.1, ptr %55, i32 0, i32 0
  %57 = bitcast ptr %56 to ptr ; %struct.0 -> i32
  %58 = getelementptr i32, ptr %57, i32 3
  store i32 %54, ptr %58
  %59 = call %view.struct @get_BaseView(ptr<%struct.2> addrspace(local) %0)
  %60 = call i32 @ComputeLinearIndex(ptr<%struct.2> addrspace(local) %0, i32 %p0)
  %61 = alloca i32, i32 1
  store i32 0, ptr %61
  call void @.ctor(ptr<i32> addrspace(local) %61, i32 4)
  %62 = load i32, ptr %61
  %63 = alloca i32, i32 1
  store i32 %p0, ptr %63
  %64 = alloca i32, i32 1
  store i32 %62, ptr %64
  %65 = alloca i32, i32 1
  %66 = call i32 @get_X(ptr<i32> addrspace(local) %63)
  %67 = call i32 @get_X(ptr<i32> addrspace(local) %64)
  store i32 0, ptr %65
  %68 = add i32 %66, %67
  call void @.ctor(ptr<i32> addrspace(local) %65, i32 %68)
  %69 = load i32, ptr %65
  %70 = alloca i32, i32 1
  store i32 %69, ptr %70
  %71 = call i32 @get_X(ptr<i32> addrspace(local) %70)
  %72 = getelementptr %struct.1, ptr %59, i32 %60
  %73 = getelementptr inbounds %struct.1, ptr %72, i32 0, i32 4
  %74 = bitcast ptr %73 to ptr ; %struct.0 -> i32
  store i32 %71, ptr %74
  %75 = call %view.struct @get_BaseView(ptr<%struct.2> addrspace(local) %0)
  %76 = call i32 @ComputeLinearIndex(ptr<%struct.2> addrspace(local) %0, i32 %p0)
  %77 = alloca i32, i32 1
  store i32 0, ptr %77
  call void @.ctor(ptr<i32> addrspace(local) %77, i32 5)
  %78 = load i32, ptr %77
  %79 = alloca i32, i32 1
  store i32 %p0, ptr %79
  %80 = alloca i32, i32 1
  store i32 %78, ptr %80
  %81 = alloca i32, i32 1
  %82 = call i32 @get_X(ptr<i32> addrspace(local) %79)
  %83 = call i32 @get_X(ptr<i32> addrspace(local) %80)
  store i32 0, ptr %81
  %84 = add i32 %82, %83
  call void @.ctor(ptr<i32> addrspace(local) %81, i32 %84)
  %85 = load i32, ptr %81
  %86 = alloca i32, i32 1
  store i32 %85, ptr %86
  %87 = call i32 @get_X(ptr<i32> addrspace(local) %86)
  %88 = getelementptr %struct.1, ptr %75, i32 %76
  %89 = getelementptr inbounds %struct.1, ptr %88, i32 0, i32 4
  %90 = bitcast ptr %89 to ptr ; %struct.0 -> i32
  %91 = getelementptr i32, ptr %90, i32 1
  store i32 %87, ptr %91
  %92 = call %view.struct @get_BaseView(ptr<%struct.2> addrspace(local) %0)
  %93 = call i32 @ComputeLinearIndex(ptr<%struct.2> addrspace(local) %0, i32 %p0)
  %94 = alloca i32, i32 1
  store i32 0, ptr %94
  call void @.ctor(ptr<i32> addrspace(local) %94, i32 6)
  %95 = load i32, ptr %94
  %96 = alloca i32, i32 1
  store i32 %p0, ptr %96
  %97 = alloca i32, i32 1
  store i32 %95, ptr %97
  %98 = alloca i32, i32 1
  %99 = call i32 @get_X(ptr<i32> addrspace(local) %96)
  %100 = call i32 @get_X(ptr<i32> addrspace(local) %97)
  store i32 0, ptr %98
  %101 = add i32 %99, %100
  call void @.ctor(ptr<i32> addrspace(local) %98, i32 %101)
  %102 = load i32, ptr %98
  %103 = alloca i32, i32 1
  store i32 %102, ptr %103
  %104 = call i32 @get_X(ptr<i32> addrspace(local) %103)
  %105 = getelementptr %struct.1, ptr %92, i32 %93
  %106 = getelementptr inbounds %struct.1, ptr %105, i32 0, i32 4
  %107 = bitcast ptr %106 to ptr ; %struct.0 -> i32
  %108 = getelementptr i32, ptr %107, i32 2
  store i32 %104, ptr %108
  %109 = call %view.struct @get_BaseView(ptr<%struct.2> addrspace(local) %0)
  %110 = call i32 @ComputeLinearIndex(ptr<%struct.2> addrspace(local) %0, i32 %p0)
  %111 = alloca i32, i32 1
  store i32 0, ptr %111
  call void @.ctor(ptr<i32> addrspace(local) %111, i32 7)
  %112 = load i32, ptr %111
  %113 = alloca i32, i32 1
  store i32 %p0, ptr %113
  %114 = alloca i32, i32 1
  store i32 %112, ptr %114
  %115 = alloca i32, i32 1
  %116 = call i32 @get_X(ptr<i32> addrspace(local) %113)
  %117 = call i32 @get_X(ptr<i32> addrspace(local) %114)
  store i32 0, ptr %115
  %118 = add i32 %116, %117
  call void @.ctor(ptr<i32> addrspace(local) %115, i32 %118)
  %119 = load i32, ptr %115
  %120 = alloca i32, i32 1
  store i32 %119, ptr %120
  %121 = call i32 @get_X(ptr<i32> addrspace(local) %120)
  %122 = getelementptr %struct.1, ptr %109, i32 %110
  %123 = getelementptr inbounds %struct.1, ptr %122, i32 0, i32 4
  %124 = bitcast ptr %123 to ptr ; %struct.0 -> i32
  %125 = getelementptr i32, ptr %124, i32 3
  store i32 %121, ptr %125
  ret void

}

define void @.ctor(ptr<i32> addrspace(local) %p0, i32 %p1) {
entry:
  store i32 %p1, ptr %p0
  ret void

}

define i32 @ComputeLinearIndex(ptr<%struct.2> addrspace(local) %p0, i32 %p1) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = alloca i64, i32 1
  store i64 0, ptr %2
  %3 = call i64 @get_Extent(ptr<%struct.2> addrspace(local) %p0)
  store i64 %3, ptr %2
  %4 = call i32 @ToIntIndex(ptr<i64> addrspace(local) %2)
  %5 = call i32 @ComputeElementIndexChecked(i8 %1, i32 %p1, i32 %4)
  ret i32 %5

}

define i32 @ComputeElementIndexChecked(i8 %p0, i32 %p1, i32 %p2) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p1, ptr %0
  %1 = call i32 @get_X(ptr<i32> addrspace(local) %0)
  ret i32 %1

}

define i32 @get_X(ptr<i32> addrspace(local) %p0) {
entry:
  %0 = load i32, ptr %p0
  ret i32 %0

}

define i32 @ToIntIndex(ptr<i64> addrspace(local) %p0) {
entry:
  %0 = load i64, ptr %p0
  %1 = load i64, ptr %p0
  %2 = trunc i64 %1 to i32
  ret i32 %2

}

define i64 @get_Extent(ptr<%struct.2> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define %view.struct @get_BaseView(ptr<%struct.2> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 0
  %1 = load %view.struct, ptr %0
  ret %view.struct %1

}

