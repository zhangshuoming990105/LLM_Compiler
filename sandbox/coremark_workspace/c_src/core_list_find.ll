; ModuleID = 'core_list_find.c'
source_filename = "core_list_find.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.list_data_s = type { i16, i16 }
%struct.list_head_s = type { ptr, ptr }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @core_list_find(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds %struct.list_data_s, ptr %6, i32 0, i32 1
  %8 = load i16, ptr %7, align 2
  %9 = sext i16 %8 to i32
  %10 = icmp sge i32 %9, 0
  br i1 %10, label %11, label %35

11:                                               ; preds = %2
  br label %12

12:                                               ; preds = %29, %11
  %13 = load ptr, ptr %4, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %27

15:                                               ; preds = %12
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.list_head_s, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.list_data_s, ptr %18, i32 0, i32 1
  %20 = load i16, ptr %19, align 2
  %21 = sext i16 %20 to i32
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds %struct.list_data_s, ptr %22, i32 0, i32 1
  %24 = load i16, ptr %23, align 2
  %25 = sext i16 %24 to i32
  %26 = icmp ne i32 %21, %25
  br label %27

27:                                               ; preds = %15, %12
  %28 = phi i1 [ false, %12 ], [ %26, %15 ]
  br i1 %28, label %29, label %33

29:                                               ; preds = %27
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.list_head_s, ptr %30, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr %4, align 8
  br label %12, !llvm.loop !6

33:                                               ; preds = %27
  %34 = load ptr, ptr %4, align 8
  store ptr %34, ptr %3, align 8
  br label %60

35:                                               ; preds = %2
  br label %36

36:                                               ; preds = %54, %35
  %37 = load ptr, ptr %4, align 8
  %38 = icmp ne ptr %37, null
  br i1 %38, label %39, label %52

39:                                               ; preds = %36
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.list_head_s, ptr %40, i32 0, i32 1
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %struct.list_data_s, ptr %42, i32 0, i32 0
  %44 = load i16, ptr %43, align 2
  %45 = sext i16 %44 to i32
  %46 = and i32 %45, 255
  %47 = load ptr, ptr %5, align 8
  %48 = getelementptr inbounds %struct.list_data_s, ptr %47, i32 0, i32 0
  %49 = load i16, ptr %48, align 2
  %50 = sext i16 %49 to i32
  %51 = icmp ne i32 %46, %50
  br label %52

52:                                               ; preds = %39, %36
  %53 = phi i1 [ false, %36 ], [ %51, %39 ]
  br i1 %53, label %54, label %58

54:                                               ; preds = %52
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds %struct.list_head_s, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  store ptr %57, ptr %4, align 8
  br label %36, !llvm.loop !8

58:                                               ; preds = %52
  %59 = load ptr, ptr %4, align 8
  store ptr %59, ptr %3, align 8
  br label %60

60:                                               ; preds = %58, %33
  %61 = load ptr, ptr %3, align 8
  ret ptr %61
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
