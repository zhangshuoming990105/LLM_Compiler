; ModuleID = 'core_init_state.c'
source_filename = "core_init_state.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@intpat = internal global [4 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3], align 16
@floatpat = internal global [4 x ptr] [ptr @.str.4, ptr @.str.5, ptr @.str.6, ptr @.str.7], align 16
@scipat = internal global [4 x ptr] [ptr @.str.8, ptr @.str.9, ptr @.str.10, ptr @.str.11], align 16
@errpat = internal global [4 x ptr] [ptr @.str.12, ptr @.str.13, ptr @.str.14, ptr @.str.15], align 16
@.str = private unnamed_addr constant [5 x i8] c"5012\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"1234\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"-874\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"+122\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"35.54400\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c".1234500\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"-110.700\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"+0.64400\00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"5.500e+3\00", align 1
@.str.9 = private unnamed_addr constant [9 x i8] c"-.123e-2\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"-87e+832\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"+0.6e-12\00", align 1
@.str.12 = private unnamed_addr constant [9 x i8] c"T0.3e-1F\00", align 1
@.str.13 = private unnamed_addr constant [9 x i8] c"-T.T++Tq\00", align 1
@.str.14 = private unnamed_addr constant [9 x i8] c"1T3.4e4z\00", align 1
@.str.15 = private unnamed_addr constant [9 x i8] c"34.0e-T^\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @core_init_state(i32 noundef %0, i16 noundef signext %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i16, align 2
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store i16 %1, ptr %5, align 2
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store ptr null, ptr %10, align 8
  %11 = load i32, ptr %4, align 4
  %12 = add i32 %11, -1
  store i32 %12, ptr %4, align 4
  store i32 0, ptr %8, align 4
  br label %13

13:                                               ; preds = %95, %3
  %14 = load i32, ptr %7, align 4
  %15 = load i32, ptr %8, align 4
  %16 = add i32 %14, %15
  %17 = add i32 %16, 1
  %18 = load i32, ptr %4, align 4
  %19 = icmp ult i32 %17, %18
  br i1 %19, label %20, label %96

20:                                               ; preds = %13
  %21 = load i32, ptr %8, align 4
  %22 = icmp ugt i32 %21, 0
  br i1 %22, label %23, label %56

23:                                               ; preds = %20
  store i32 0, ptr %9, align 4
  br label %24

24:                                               ; preds = %41, %23
  %25 = load i32, ptr %9, align 4
  %26 = load i32, ptr %8, align 4
  %27 = icmp ult i32 %25, %26
  br i1 %27, label %28, label %44

28:                                               ; preds = %24
  %29 = load ptr, ptr %10, align 8
  %30 = load i32, ptr %9, align 4
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i8, ptr %29, i64 %31
  %33 = load i8, ptr %32, align 1
  %34 = load ptr, ptr %6, align 8
  %35 = load i32, ptr %7, align 4
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i8, ptr %34, i64 %36
  %38 = load i32, ptr %9, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i8, ptr %37, i64 %39
  store i8 %33, ptr %40, align 1
  br label %41

41:                                               ; preds = %28
  %42 = load i32, ptr %9, align 4
  %43 = add i32 %42, 1
  store i32 %43, ptr %9, align 4
  br label %24, !llvm.loop !6

44:                                               ; preds = %24
  %45 = load ptr, ptr %6, align 8
  %46 = load i32, ptr %7, align 4
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i8, ptr %45, i64 %47
  %49 = load i32, ptr %9, align 4
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i8, ptr %48, i64 %50
  store i8 44, ptr %51, align 1
  %52 = load i32, ptr %8, align 4
  %53 = add i32 %52, 1
  %54 = load i32, ptr %7, align 4
  %55 = add i32 %54, %53
  store i32 %55, ptr %7, align 4
  br label %56

56:                                               ; preds = %44, %20
  %57 = load i16, ptr %5, align 2
  %58 = add i16 %57, 1
  store i16 %58, ptr %5, align 2
  %59 = load i16, ptr %5, align 2
  %60 = sext i16 %59 to i32
  %61 = and i32 %60, 7
  switch i32 %61, label %94 [
    i32 0, label %62
    i32 1, label %62
    i32 2, label %62
    i32 3, label %70
    i32 4, label %70
    i32 5, label %78
    i32 6, label %78
    i32 7, label %86
  ]

62:                                               ; preds = %56, %56, %56
  %63 = load i16, ptr %5, align 2
  %64 = sext i16 %63 to i32
  %65 = ashr i32 %64, 3
  %66 = and i32 %65, 3
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [4 x ptr], ptr @intpat, i64 0, i64 %67
  %69 = load ptr, ptr %68, align 8
  store ptr %69, ptr %10, align 8
  store i32 4, ptr %8, align 4
  br label %95

70:                                               ; preds = %56, %56
  %71 = load i16, ptr %5, align 2
  %72 = sext i16 %71 to i32
  %73 = ashr i32 %72, 3
  %74 = and i32 %73, 3
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [4 x ptr], ptr @floatpat, i64 0, i64 %75
  %77 = load ptr, ptr %76, align 8
  store ptr %77, ptr %10, align 8
  store i32 8, ptr %8, align 4
  br label %95

78:                                               ; preds = %56, %56
  %79 = load i16, ptr %5, align 2
  %80 = sext i16 %79 to i32
  %81 = ashr i32 %80, 3
  %82 = and i32 %81, 3
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [4 x ptr], ptr @scipat, i64 0, i64 %83
  %85 = load ptr, ptr %84, align 8
  store ptr %85, ptr %10, align 8
  store i32 8, ptr %8, align 4
  br label %95

86:                                               ; preds = %56
  %87 = load i16, ptr %5, align 2
  %88 = sext i16 %87 to i32
  %89 = ashr i32 %88, 3
  %90 = and i32 %89, 3
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [4 x ptr], ptr @errpat, i64 0, i64 %91
  %93 = load ptr, ptr %92, align 8
  store ptr %93, ptr %10, align 8
  store i32 8, ptr %8, align 4
  br label %95

94:                                               ; preds = %56
  br label %95

95:                                               ; preds = %94, %86, %78, %70, %62
  br label %13, !llvm.loop !8

96:                                               ; preds = %13
  %97 = load i32, ptr %4, align 4
  %98 = add i32 %97, 1
  store i32 %98, ptr %4, align 4
  br label %99

99:                                               ; preds = %103, %96
  %100 = load i32, ptr %7, align 4
  %101 = load i32, ptr %4, align 4
  %102 = icmp ult i32 %100, %101
  br i1 %102, label %103, label %110

103:                                              ; preds = %99
  %104 = load ptr, ptr %6, align 8
  %105 = load i32, ptr %7, align 4
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i8, ptr %104, i64 %106
  store i8 0, ptr %107, align 1
  %108 = load i32, ptr %7, align 4
  %109 = add i32 %108, 1
  store i32 %109, ptr %7, align 4
  br label %99, !llvm.loop !9

110:                                              ; preds = %99
  ret void
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
