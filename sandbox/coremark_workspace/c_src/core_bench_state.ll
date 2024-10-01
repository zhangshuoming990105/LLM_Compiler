; ModuleID = 'core_bench_state.c'
source_filename = "core_bench_state.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i16 @core_bench_state(i32 noundef %0, ptr noundef %1, i16 noundef signext %2, i16 noundef signext %3, i16 noundef signext %4, i16 noundef zeroext %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  %13 = alloca [8 x i32], align 16
  %14 = alloca [8 x i32], align 16
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store ptr %1, ptr %8, align 8
  store i16 %2, ptr %9, align 2
  store i16 %3, ptr %10, align 2
  store i16 %4, ptr %11, align 2
  store i16 %5, ptr %12, align 2
  %19 = load ptr, ptr %8, align 8
  store ptr %19, ptr %15, align 8
  store i32 0, ptr %16, align 4
  br label %20

20:                                               ; preds = %30, %6
  %21 = load i32, ptr %16, align 4
  %22 = icmp ult i32 %21, 8
  br i1 %22, label %23, label %33

23:                                               ; preds = %20
  %24 = load i32, ptr %16, align 4
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds [8 x i32], ptr %14, i64 0, i64 %25
  store i32 0, ptr %26, align 4
  %27 = load i32, ptr %16, align 4
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds [8 x i32], ptr %13, i64 0, i64 %28
  store i32 0, ptr %29, align 4
  br label %30

30:                                               ; preds = %23
  %31 = load i32, ptr %16, align 4
  %32 = add i32 %31, 1
  store i32 %32, ptr %16, align 4
  br label %20, !llvm.loop !6

33:                                               ; preds = %20
  br label %34

34:                                               ; preds = %39, %33
  %35 = load ptr, ptr %15, align 8
  %36 = load i8, ptr %35, align 1
  %37 = zext i8 %36 to i32
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %47

39:                                               ; preds = %34
  %40 = getelementptr inbounds [8 x i32], ptr %14, i64 0, i64 0
  %41 = call i32 @core_state_transition(ptr noundef %15, ptr noundef %40)
  store i32 %41, ptr %17, align 4
  %42 = load i32, ptr %17, align 4
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds [8 x i32], ptr %13, i64 0, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = add i32 %45, 1
  store i32 %46, ptr %44, align 4
  br label %34, !llvm.loop !8

47:                                               ; preds = %34
  %48 = load ptr, ptr %8, align 8
  store ptr %48, ptr %15, align 8
  br label %49

49:                                               ; preds = %70, %47
  %50 = load ptr, ptr %15, align 8
  %51 = load ptr, ptr %8, align 8
  %52 = load i32, ptr %7, align 4
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i8, ptr %51, i64 %53
  %55 = icmp ult ptr %50, %54
  br i1 %55, label %56, label %76

56:                                               ; preds = %49
  %57 = load ptr, ptr %15, align 8
  %58 = load i8, ptr %57, align 1
  %59 = zext i8 %58 to i32
  %60 = icmp ne i32 %59, 44
  br i1 %60, label %61, label %70

61:                                               ; preds = %56
  %62 = load i16, ptr %9, align 2
  %63 = trunc i16 %62 to i8
  %64 = zext i8 %63 to i32
  %65 = load ptr, ptr %15, align 8
  %66 = load i8, ptr %65, align 1
  %67 = zext i8 %66 to i32
  %68 = xor i32 %67, %64
  %69 = trunc i32 %68 to i8
  store i8 %69, ptr %65, align 1
  br label %70

70:                                               ; preds = %61, %56
  %71 = load i16, ptr %11, align 2
  %72 = sext i16 %71 to i32
  %73 = load ptr, ptr %15, align 8
  %74 = sext i32 %72 to i64
  %75 = getelementptr inbounds i8, ptr %73, i64 %74
  store ptr %75, ptr %15, align 8
  br label %49, !llvm.loop !9

76:                                               ; preds = %49
  %77 = load ptr, ptr %8, align 8
  store ptr %77, ptr %15, align 8
  br label %78

78:                                               ; preds = %83, %76
  %79 = load ptr, ptr %15, align 8
  %80 = load i8, ptr %79, align 1
  %81 = zext i8 %80 to i32
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %83, label %91

83:                                               ; preds = %78
  %84 = getelementptr inbounds [8 x i32], ptr %14, i64 0, i64 0
  %85 = call i32 @core_state_transition(ptr noundef %15, ptr noundef %84)
  store i32 %85, ptr %18, align 4
  %86 = load i32, ptr %18, align 4
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds [8 x i32], ptr %13, i64 0, i64 %87
  %89 = load i32, ptr %88, align 4
  %90 = add i32 %89, 1
  store i32 %90, ptr %88, align 4
  br label %78, !llvm.loop !10

91:                                               ; preds = %78
  %92 = load ptr, ptr %8, align 8
  store ptr %92, ptr %15, align 8
  br label %93

93:                                               ; preds = %114, %91
  %94 = load ptr, ptr %15, align 8
  %95 = load ptr, ptr %8, align 8
  %96 = load i32, ptr %7, align 4
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds i8, ptr %95, i64 %97
  %99 = icmp ult ptr %94, %98
  br i1 %99, label %100, label %120

100:                                              ; preds = %93
  %101 = load ptr, ptr %15, align 8
  %102 = load i8, ptr %101, align 1
  %103 = zext i8 %102 to i32
  %104 = icmp ne i32 %103, 44
  br i1 %104, label %105, label %114

105:                                              ; preds = %100
  %106 = load i16, ptr %10, align 2
  %107 = trunc i16 %106 to i8
  %108 = zext i8 %107 to i32
  %109 = load ptr, ptr %15, align 8
  %110 = load i8, ptr %109, align 1
  %111 = zext i8 %110 to i32
  %112 = xor i32 %111, %108
  %113 = trunc i32 %112 to i8
  store i8 %113, ptr %109, align 1
  br label %114

114:                                              ; preds = %105, %100
  %115 = load i16, ptr %11, align 2
  %116 = sext i16 %115 to i32
  %117 = load ptr, ptr %15, align 8
  %118 = sext i32 %116 to i64
  %119 = getelementptr inbounds i8, ptr %117, i64 %118
  store ptr %119, ptr %15, align 8
  br label %93, !llvm.loop !11

120:                                              ; preds = %93
  store i32 0, ptr %16, align 4
  br label %121

121:                                              ; preds = %137, %120
  %122 = load i32, ptr %16, align 4
  %123 = icmp ult i32 %122, 8
  br i1 %123, label %124, label %140

124:                                              ; preds = %121
  %125 = load i32, ptr %16, align 4
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds [8 x i32], ptr %13, i64 0, i64 %126
  %128 = load i32, ptr %127, align 4
  %129 = load i16, ptr %12, align 2
  %130 = call zeroext i16 @crcu32(i32 noundef %128, i16 noundef zeroext %129)
  store i16 %130, ptr %12, align 2
  %131 = load i32, ptr %16, align 4
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds [8 x i32], ptr %14, i64 0, i64 %132
  %134 = load i32, ptr %133, align 4
  %135 = load i16, ptr %12, align 2
  %136 = call zeroext i16 @crcu32(i32 noundef %134, i16 noundef zeroext %135)
  store i16 %136, ptr %12, align 2
  br label %137

137:                                              ; preds = %124
  %138 = load i32, ptr %16, align 4
  %139 = add i32 %138, 1
  store i32 %139, ptr %16, align 4
  br label %121, !llvm.loop !12

140:                                              ; preds = %121
  %141 = load i16, ptr %12, align 2
  ret i16 %141
}

declare i32 @core_state_transition(ptr noundef, ptr noundef) #1

declare zeroext i16 @crcu32(i32 noundef, i16 noundef zeroext) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
