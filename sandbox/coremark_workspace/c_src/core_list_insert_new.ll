; ModuleID = 'core_list_insert_new.c'
source_filename = "core_list_insert_new.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.list_head_s = type { ptr, ptr }
%struct.list_data_s = type { i16, i16 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @core_list_insert_new(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  store ptr %0, ptr %8, align 8
  store ptr %1, ptr %9, align 8
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store ptr %5, ptr %13, align 8
  %15 = load ptr, ptr %10, align 8
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.list_head_s, ptr %16, i64 1
  %18 = load ptr, ptr %12, align 8
  %19 = icmp uge ptr %17, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %6
  store ptr null, ptr %7, align 8
  br label %54

21:                                               ; preds = %6
  %22 = load ptr, ptr %11, align 8
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds %struct.list_data_s, ptr %23, i64 1
  %25 = load ptr, ptr %13, align 8
  %26 = icmp uge ptr %24, %25
  br i1 %26, label %27, label %28

27:                                               ; preds = %21
  store ptr null, ptr %7, align 8
  br label %54

28:                                               ; preds = %21
  %29 = load ptr, ptr %10, align 8
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %14, align 8
  %31 = load ptr, ptr %10, align 8
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.list_head_s, ptr %32, i32 1
  store ptr %33, ptr %31, align 8
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds %struct.list_head_s, ptr %34, i32 0, i32 0
  %36 = load ptr, ptr %35, align 8
  %37 = load ptr, ptr %14, align 8
  %38 = getelementptr inbounds %struct.list_head_s, ptr %37, i32 0, i32 0
  store ptr %36, ptr %38, align 8
  %39 = load ptr, ptr %14, align 8
  %40 = load ptr, ptr %8, align 8
  %41 = getelementptr inbounds %struct.list_head_s, ptr %40, i32 0, i32 0
  store ptr %39, ptr %41, align 8
  %42 = load ptr, ptr %11, align 8
  %43 = load ptr, ptr %42, align 8
  %44 = load ptr, ptr %14, align 8
  %45 = getelementptr inbounds %struct.list_head_s, ptr %44, i32 0, i32 1
  store ptr %43, ptr %45, align 8
  %46 = load ptr, ptr %11, align 8
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr inbounds %struct.list_data_s, ptr %47, i32 1
  store ptr %48, ptr %46, align 8
  %49 = load ptr, ptr %14, align 8
  %50 = getelementptr inbounds %struct.list_head_s, ptr %49, i32 0, i32 1
  %51 = load ptr, ptr %50, align 8
  %52 = load ptr, ptr %9, align 8
  call void @copy_info(ptr noundef %51, ptr noundef %52)
  %53 = load ptr, ptr %14, align 8
  store ptr %53, ptr %7, align 8
  br label %54

54:                                               ; preds = %28, %27, %20
  %55 = load ptr, ptr %7, align 8
  ret ptr %55
}

declare void @copy_info(ptr noundef, ptr noundef) #1

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
