; ModuleID = 'subset-sum.ll'
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
  br label %3

3:                                                ; preds = %10, %2
  %.0 = phi i32 [ 0, %2 ], [ %11, %10 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %12

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds i32, i32* %0, i64 %6
  %8 = load i32, i32* %7, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 5, i32 %8)
  br label %10

10:                                               ; preds = %5
  %11 = add nsw i32 %.0, 1
  br label %3

12:                                               ; preds = %3
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
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
  br label %67

33:                                               ; preds = %7
  %34 = icmp slt i32 %5, %2
  br i1 %34, label %35, label %66

35:                                               ; preds = %33
  %36 = sext i32 %5 to i64
  %37 = getelementptr inbounds i32, i32* %0, i64 %36
  %38 = load i32, i32* %37, align 4
  %39 = add nsw i32 %4, %38
  %40 = icmp sle i32 %39, %6
  br i1 %40, label %41, label %66

41:                                               ; preds = %35
  br label %42

42:                                               ; preds = %63, %41
  %.0 = phi i32 [ %5, %41 ], [ %64, %63 ]
  %43 = icmp slt i32 %.0, %2
  br i1 %43, label %44, label %65

44:                                               ; preds = %42
  %45 = sext i32 %.0 to i64
  %46 = getelementptr inbounds i32, i32* %0, i64 %45
  %47 = load i32, i32* %46, align 4
  %48 = sext i32 %3 to i64
  %49 = getelementptr inbounds i32, i32* %1, i64 %48
  store i32 %47, i32* %49, align 4
  %50 = sext i32 %.0 to i64
  %51 = getelementptr inbounds i32, i32* %0, i64 %50
  %52 = load i32, i32* %51, align 4
  %53 = add nsw i32 %4, %52
  %54 = icmp sle i32 %53, %6
  br i1 %54, label %55, label %62

55:                                               ; preds = %44
  %56 = add nsw i32 %3, 1
  %57 = sext i32 %.0 to i64
  %58 = getelementptr inbounds i32, i32* %0, i64 %57
  %59 = load i32, i32* %58, align 4
  %60 = add nsw i32 %4, %59
  %61 = add nsw i32 %.0, 1
  call void @_Z10subset_sumPiS_iiiii(i32* %0, i32* %1, i32 %2, i32 %56, i32 %60, i32 %61, i32 %6)
  br label %62

62:                                               ; preds = %55, %44
  br label %63

63:                                               ; preds = %62
  %64 = add nsw i32 %.0, 1
  br label %42

65:                                               ; preds = %42
  br label %66

66:                                               ; preds = %65, %35, %33
  br label %67

67:                                               ; preds = %66, %32
  ret void
}

; Function Attrs: noinline sspstrong uwtable
define dso_local void @_Z15generateSubsetsPiii(i32* %0, i32 %1, i32 %2) #0 {
  %4 = sext i32 %1 to i64
  %5 = mul i64 %4, 4
  %6 = call noalias i8* @malloc(i64 %5) #6
  %7 = bitcast i8* %6 to i32*
  %8 = bitcast i32* %0 to i8*
  %9 = sext i32 %1 to i64
  call void @qsort(i8* %8, i64 %9, i64 4, i32 (i8*, i8*)* @_Z10comparatorPKvS0_)
  br label %10

10:                                               ; preds = %17, %3
  %.01 = phi i32 [ 0, %3 ], [ %16, %17 ]
  %.0 = phi i32 [ 0, %3 ], [ %18, %17 ]
  %11 = icmp slt i32 %.0, %1
  br i1 %11, label %12, label %19

12:                                               ; preds = %10
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds i32, i32* %0, i64 %13
  %15 = load i32, i32* %14, align 4
  %16 = add nsw i32 %.01, %15
  br label %17

17:                                               ; preds = %12
  %18 = add nsw i32 %.0, 1
  br label %10

19:                                               ; preds = %10
  %20 = getelementptr inbounds i32, i32* %0, i64 0
  %21 = load i32, i32* %20, align 4
  %22 = icmp sle i32 %21, %2
  br i1 %22, label %23, label %26

23:                                               ; preds = %19
  %24 = icmp sge i32 %.01, %2
  br i1 %24, label %25, label %26

25:                                               ; preds = %23
  call void @_Z10subset_sumPiS_iiiii(i32* %0, i32* %7, i32 %1, i32 0, i32 0, i32 0, i32 %2)
  br label %26

26:                                               ; preds = %25, %23, %19
  %27 = bitcast i32* %7 to i8*
  call void @free(i8* %27) #6
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
