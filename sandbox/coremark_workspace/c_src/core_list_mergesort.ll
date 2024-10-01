; ModuleID = 'core_list_mergesort.c'
source_filename = "core_list_mergesort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.list_head_s = type { ptr, ptr }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @core_list_mergesort(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 1, ptr %11, align 4
  br label %16

16:                                               ; preds = %3, %127
  %17 = load ptr, ptr %4, align 8
  store ptr %17, ptr %7, align 8
  store ptr null, ptr %4, align 8
  store ptr null, ptr %10, align 8
  store i32 0, ptr %12, align 4
  br label %18

18:                                               ; preds = %118, %16
  %19 = load ptr, ptr %7, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %120

21:                                               ; preds = %18
  %22 = load i32, ptr %12, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %12, align 4
  %24 = load ptr, ptr %7, align 8
  store ptr %24, ptr %8, align 8
  store i32 0, ptr %13, align 4
  store i32 0, ptr %15, align 4
  br label %25

25:                                               ; preds = %39, %21
  %26 = load i32, ptr %15, align 4
  %27 = load i32, ptr %11, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %42

29:                                               ; preds = %25
  %30 = load i32, ptr %13, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %13, align 4
  %32 = load ptr, ptr %8, align 8
  %33 = getelementptr inbounds %struct.list_head_s, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  store ptr %34, ptr %8, align 8
  %35 = load ptr, ptr %8, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %38, label %37

37:                                               ; preds = %29
  br label %42

38:                                               ; preds = %29
  br label %39

39:                                               ; preds = %38
  %40 = load i32, ptr %15, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %15, align 4
  br label %25, !llvm.loop !6

42:                                               ; preds = %37, %25
  %43 = load i32, ptr %11, align 4
  store i32 %43, ptr %14, align 4
  br label %44

44:                                               ; preds = %116, %42
  %45 = load i32, ptr %13, align 4
  %46 = icmp sgt i32 %45, 0
  br i1 %46, label %55, label %47

47:                                               ; preds = %44
  %48 = load i32, ptr %14, align 4
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %50, label %53

50:                                               ; preds = %47
  %51 = load ptr, ptr %8, align 8
  %52 = icmp ne ptr %51, null
  br label %53

53:                                               ; preds = %50, %47
  %54 = phi i1 [ false, %47 ], [ %52, %50 ]
  br label %55

55:                                               ; preds = %53, %44
  %56 = phi i1 [ true, %44 ], [ %54, %53 ]
  br i1 %56, label %57, label %118

57:                                               ; preds = %55
  %58 = load i32, ptr %13, align 4
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %67

60:                                               ; preds = %57
  %61 = load ptr, ptr %8, align 8
  store ptr %61, ptr %9, align 8
  %62 = load ptr, ptr %8, align 8
  %63 = getelementptr inbounds %struct.list_head_s, ptr %62, i32 0, i32 0
  %64 = load ptr, ptr %63, align 8
  store ptr %64, ptr %8, align 8
  %65 = load i32, ptr %14, align 4
  %66 = add nsw i32 %65, -1
  store i32 %66, ptr %14, align 4
  br label %107

67:                                               ; preds = %57
  %68 = load i32, ptr %14, align 4
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %73, label %70

70:                                               ; preds = %67
  %71 = load ptr, ptr %8, align 8
  %72 = icmp ne ptr %71, null
  br i1 %72, label %80, label %73

73:                                               ; preds = %70, %67
  %74 = load ptr, ptr %7, align 8
  store ptr %74, ptr %9, align 8
  %75 = load ptr, ptr %7, align 8
  %76 = getelementptr inbounds %struct.list_head_s, ptr %75, i32 0, i32 0
  %77 = load ptr, ptr %76, align 8
  store ptr %77, ptr %7, align 8
  %78 = load i32, ptr %13, align 4
  %79 = add nsw i32 %78, -1
  store i32 %79, ptr %13, align 4
  br label %106

80:                                               ; preds = %70
  %81 = load ptr, ptr %5, align 8
  %82 = load ptr, ptr %7, align 8
  %83 = getelementptr inbounds %struct.list_head_s, ptr %82, i32 0, i32 1
  %84 = load ptr, ptr %83, align 8
  %85 = load ptr, ptr %8, align 8
  %86 = getelementptr inbounds %struct.list_head_s, ptr %85, i32 0, i32 1
  %87 = load ptr, ptr %86, align 8
  %88 = load ptr, ptr %6, align 8
  %89 = call i32 %81(ptr noundef %84, ptr noundef %87, ptr noundef %88)
  %90 = icmp sle i32 %89, 0
  br i1 %90, label %91, label %98

91:                                               ; preds = %80
  %92 = load ptr, ptr %7, align 8
  store ptr %92, ptr %9, align 8
  %93 = load ptr, ptr %7, align 8
  %94 = getelementptr inbounds %struct.list_head_s, ptr %93, i32 0, i32 0
  %95 = load ptr, ptr %94, align 8
  store ptr %95, ptr %7, align 8
  %96 = load i32, ptr %13, align 4
  %97 = add nsw i32 %96, -1
  store i32 %97, ptr %13, align 4
  br label %105

98:                                               ; preds = %80
  %99 = load ptr, ptr %8, align 8
  store ptr %99, ptr %9, align 8
  %100 = load ptr, ptr %8, align 8
  %101 = getelementptr inbounds %struct.list_head_s, ptr %100, i32 0, i32 0
  %102 = load ptr, ptr %101, align 8
  store ptr %102, ptr %8, align 8
  %103 = load i32, ptr %14, align 4
  %104 = add nsw i32 %103, -1
  store i32 %104, ptr %14, align 4
  br label %105

105:                                              ; preds = %98, %91
  br label %106

106:                                              ; preds = %105, %73
  br label %107

107:                                              ; preds = %106, %60
  %108 = load ptr, ptr %10, align 8
  %109 = icmp ne ptr %108, null
  br i1 %109, label %110, label %114

110:                                              ; preds = %107
  %111 = load ptr, ptr %9, align 8
  %112 = load ptr, ptr %10, align 8
  %113 = getelementptr inbounds %struct.list_head_s, ptr %112, i32 0, i32 0
  store ptr %111, ptr %113, align 8
  br label %116

114:                                              ; preds = %107
  %115 = load ptr, ptr %9, align 8
  store ptr %115, ptr %4, align 8
  br label %116

116:                                              ; preds = %114, %110
  %117 = load ptr, ptr %9, align 8
  store ptr %117, ptr %10, align 8
  br label %44, !llvm.loop !8

118:                                              ; preds = %55
  %119 = load ptr, ptr %8, align 8
  store ptr %119, ptr %7, align 8
  br label %18, !llvm.loop !9

120:                                              ; preds = %18
  %121 = load ptr, ptr %10, align 8
  %122 = getelementptr inbounds %struct.list_head_s, ptr %121, i32 0, i32 0
  store ptr null, ptr %122, align 8
  %123 = load i32, ptr %12, align 4
  %124 = icmp sle i32 %123, 1
  br i1 %124, label %125, label %127

125:                                              ; preds = %120
  %126 = load ptr, ptr %4, align 8
  ret ptr %126

127:                                              ; preds = %120
  %128 = load i32, ptr %11, align 4
  %129 = mul nsw i32 %128, 2
  store i32 %129, ptr %11, align 4
  br label %16
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
