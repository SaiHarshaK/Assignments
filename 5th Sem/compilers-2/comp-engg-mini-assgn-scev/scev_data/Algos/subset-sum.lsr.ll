; ModuleID = 'subset-sum.memopt.ll'
source_filename = "subset-sum.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%*d\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@_ZL11total_nodes = internal global i32 0, align 4
@__const.main.weights = private unnamed_addr constant [8 x i32] [i32 15, i32 22, i32 14, i32 26, i32 32, i32 9, i32 16, i32 8], align 16
@.str.2 = private unnamed_addr constant [20 x i8] c"Nodes generated %dn\00", align 1

; Function Attrs: noinline sspstrong uwtable
define dso_local void @_Z11printSubsetPii(i32* %0, i32 %1) #0 {
  %3 = sext i32 %1 to i64
  br label %4

4:                                                ; preds = %10, %2
  %indvars.iv = phi i64 [ %indvars.iv.next, %10 ], [ 0, %2 ]
  %5 = icmp slt i64 %indvars.iv, %3
  br i1 %5, label %6, label %11

6:                                                ; preds = %4
  %7 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %8 = load i32, i32* %7, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 5, i32 %8)
  br label %10

10:                                               ; preds = %6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %4

11:                                               ; preds = %4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @_Z10comparatorPKvS0_(i8* %0, i8* %1) #2 {
  %3 = bitcast i8* %0 to i32*
  %4 = bitcast i8* %1 to i32*
  %5 = load i32, i32* %3, align 4
  %6 = load i32, i32* %4, align 4
  %7 = icmp sgt i32 %5, %6
  %8 = zext i1 %7 to i32
  ret i32 %8
}

; Function Attrs: noinline sspstrong uwtable
define dso_local void @_Z10subset_sumPiS_iiiii(i32* %0, i32* %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) #0 {
  %8 = load i32, i32* @_ZL11total_nodes, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* @_ZL11total_nodes, align 4
  %10 = icmp eq i32 %6, %4
  br i1 %10, label %11, label %33

11:                                               ; preds = %7
  call void @_Z11printSubsetPii(i32* %1, i32 %3)
  %12 = add nsw i32 %5, 1
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %32

14:                                               ; preds = %11
  %15 = sext i32 %5 to i64
  %16 = getelementptr inbounds i32, i32* %0, i64 %15
  %17 = load i32, i32* %16, align 4
  %18 = sub nsw i32 %4, %17
  %19 = add nsw i32 %5, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32* %0, i64 %20
  %22 = load i32, i32* %21, align 4
  %23 = add nsw i32 %18, %22
  %24 = icmp sle i32 %23, %6
  br i1 %24, label %25, label %32

25:                                               ; preds = %14
  %26 = sub nsw i32 %3, 1
  %27 = sext i32 %5 to i64
  %28 = getelementptr inbounds i32, i32* %0, i64 %27
  %29 = load i32, i32* %28, align 4
  %30 = sub nsw i32 %4, %29
  %31 = add nsw i32 %5, 1
  call void @_Z10subset_sumPiS_iiiii(i32* %0, i32* %1, i32 %2, i32 %26, i32 %30, i32 %31, i32 %6)
  br label %32

32:                                               ; preds = %25, %14, %11
  br label %66

33:                                               ; preds = %7
  %34 = icmp slt i32 %5, %2
  br i1 %34, label %35, label %65

35:                                               ; preds = %33
  %36 = sext i32 %5 to i64
  %37 = getelementptr inbounds i32, i32* %0, i64 %36
  %38 = load i32, i32* %37, align 4
  %39 = add nsw i32 %4, %38
  %40 = icmp sle i32 %39, %6
  br i1 %40, label %41, label %65

41:                                               ; preds = %35
  %42 = sext i32 %5 to i64
  %43 = sext i32 %2 to i64
  br label %44

44:                                               ; preds = %63, %41
  %indvars.iv = phi i64 [ %indvars.iv.next, %63 ], [ %42, %41 ]
  %45 = icmp slt i64 %indvars.iv, %43
  br i1 %45, label %46, label %64

46:                                               ; preds = %44
  %47 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %48 = load i32, i32* %47, align 4
  %49 = sext i32 %3 to i64
  %50 = getelementptr inbounds i32, i32* %1, i64 %49
  store i32 %48, i32* %50, align 4
  %51 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %52 = load i32, i32* %51, align 4
  %53 = add nsw i32 %4, %52
  %54 = icmp sle i32 %53, %6
  br i1 %54, label %55, label %62

55:                                               ; preds = %46
  %56 = add nsw i32 %3, 1
  %57 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %58 = load i32, i32* %57, align 4
  %59 = add nsw i32 %4, %58
  %60 = add nsw i64 %indvars.iv, 1
  %61 = trunc i64 %60 to i32
  call void @_Z10subset_sumPiS_iiiii(i32* %0, i32* %1, i32 %2, i32 %56, i32 %59, i32 %61, i32 %6)
  br label %62

62:                                               ; preds = %55, %46
  br label %63

63:                                               ; preds = %62
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  br label %44

64:                                               ; preds = %44
  br label %65

65:                                               ; preds = %64, %35, %33
  br label %66

66:                                               ; preds = %65, %32
  ret void
}

; Function Attrs: noinline sspstrong uwtable
define dso_local void @_Z15generateSubsetsPiii(i32* %0, i32 %1, i32 %2) #0 {
  %4 = sext i32 %1 to i64
  %5 = mul i64 %4, 4
  %6 = call noalias i8* @malloc(i64 %5) #6
  %7 = bitcast i32* %0 to i8*
  %8 = sext i32 %1 to i64
  call void @qsort(i8* %7, i64 %8, i64 4, i32 (i8*, i8*)* @_Z10comparatorPKvS0_)
  %9 = sext i32 %1 to i64
  br label %10

10:                                               ; preds = %16, %3
  %indvars.iv = phi i64 [ %indvars.iv.next, %16 ], [ 0, %3 ]
  %.01 = phi i32 [ 0, %3 ], [ %15, %16 ]
  %11 = icmp slt i64 %indvars.iv, %9
  br i1 %11, label %12, label %17

12:                                               ; preds = %10
  %13 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %14 = load i32, i32* %13, align 4
  %15 = add nsw i32 %.01, %14
  br label %16

16:                                               ; preds = %12
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %10

17:                                               ; preds = %10
  %.01.lcssa = phi i32 [ %.01, %10 ]
  %18 = bitcast i8* %6 to i32*
  %19 = getelementptr inbounds i32, i32* %0, i64 0
  %20 = load i32, i32* %19, align 4
  %21 = icmp sle i32 %20, %2
  br i1 %21, label %22, label %25

22:                                               ; preds = %17
  %23 = icmp sge i32 %.01.lcssa, %2
  br i1 %23, label %24, label %25

24:                                               ; preds = %22
  call void @_Z10subset_sumPiS_iiiii(i32* %0, i32* %18, i32 %1, i32 0, i32 0, i32 0, i32 %2)
  br label %25

25:                                               ; preds = %24, %22, %17
  %26 = bitcast i32* %18 to i8*
  call void @free(i8* %26) #6
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #1

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local i32 @main() #4 {
  %1 = alloca [8 x i32], align 16
  %2 = bitcast [8 x i32]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([8 x i32]* @__const.main.weights to i8*), i64 32, i1 false)
  %3 = getelementptr inbounds [8 x i32], [8 x i32]* %1, i32 0, i32 0
  call void @_Z15generateSubsetsPiii(i32* %3, i32 8, i32 53)
  %4 = load i32, i32* @_ZL11total_nodes, align 4
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i32 0, i32 0), i32 %4)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

attributes #0 = { noinline sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}
