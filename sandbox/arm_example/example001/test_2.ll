; ModuleID = 'test.ll'
source_filename = "test.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind ssp willreturn memory(none) uwtable(sync)
define noundef i32 @_Z5quantii(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %spec.select = tail call i32 @llvm.abs.i32(i32 %0, i1 true)
  %3 = sdiv i32 %spec.select, %1
  %4 = mul nsw i32 %3, %1
  %5 = sub nsw i32 %spec.select, %4
  %6 = sdiv i32 %1, 2
  %7 = icmp sgt i32 %5, %6
  %8 = zext i1 %7 to i32
  %.015 = add nsw i32 %3, %8
  %9 = mul nsw i32 %.015, %1
  %10 = sub nsw i32 0, %9
  %11 = icmp slt i32 %0, 0
  %.1 = select i1 %11, i32 %10, i32 %9
  ret i32 %.1
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #1

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind ssp willreturn memory(none) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+jsconv,+lse,+neon,+pauth,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 18.1.5"}
