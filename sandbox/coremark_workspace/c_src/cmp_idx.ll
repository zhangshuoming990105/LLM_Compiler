; ModuleID = 'cmp_idx.c'
source_filename = "cmp_idx.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.list_data_s = type { i16, i16 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @cmp_idx(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %6, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %40

9:                                                ; preds = %3
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.list_data_s, ptr %10, i32 0, i32 0
  %12 = load i16, ptr %11, align 2
  %13 = sext i16 %12 to i32
  %14 = and i32 %13, 65280
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.list_data_s, ptr %15, i32 0, i32 0
  %17 = load i16, ptr %16, align 2
  %18 = sext i16 %17 to i32
  %19 = ashr i32 %18, 8
  %20 = and i32 255, %19
  %21 = or i32 %14, %20
  %22 = trunc i32 %21 to i16
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.list_data_s, ptr %23, i32 0, i32 0
  store i16 %22, ptr %24, align 2
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds %struct.list_data_s, ptr %25, i32 0, i32 0
  %27 = load i16, ptr %26, align 2
  %28 = sext i16 %27 to i32
  %29 = and i32 %28, 65280
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.list_data_s, ptr %30, i32 0, i32 0
  %32 = load i16, ptr %31, align 2
  %33 = sext i16 %32 to i32
  %34 = ashr i32 %33, 8
  %35 = and i32 255, %34
  %36 = or i32 %29, %35
  %37 = trunc i32 %36 to i16
  %38 = load ptr, ptr %5, align 8
  %39 = getelementptr inbounds %struct.list_data_s, ptr %38, i32 0, i32 0
  store i16 %37, ptr %39, align 2
  br label %40

40:                                               ; preds = %9, %3
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.list_data_s, ptr %41, i32 0, i32 1
  %43 = load i16, ptr %42, align 2
  %44 = sext i16 %43 to i32
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds %struct.list_data_s, ptr %45, i32 0, i32 1
  %47 = load i16, ptr %46, align 2
  %48 = sext i16 %47 to i32
  %49 = sub nsw i32 %44, %48
  ret i32 %49
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
