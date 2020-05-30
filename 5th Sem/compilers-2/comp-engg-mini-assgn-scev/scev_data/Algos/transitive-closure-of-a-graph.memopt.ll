; ModuleID = 'transitive-closure-of-a-graph.ll'
source_filename = "transitive-closure-of-a-graph.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [59 x i8] c"Following matrix is transitive closure of the given graph\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__const.main.graph = private unnamed_addr constant [4 x [4 x i32]] [[4 x i32] [i32 1, i32 1, i32 0, i32 1], [4 x i32] [i32 0, i32 1, i32 1, i32 0], [4 x i32] [i32 0, i32 0, i32 1, i32 1], [4 x i32] [i32 0, i32 0, i32 0, i32 1]], align 16

; Function Attrs: noinline sspstrong uwtable
define dso_local void @_Z17transitiveClosurePA4_i([4 x i32]* %0) #0 {
  %2 = alloca [4 x [4 x i32]], align 16
  br label %3

3:                                                ; preds = %21, %1
  %.01 = phi i32 [ 0, %1 ], [ %22, %21 ]
  %4 = icmp slt i32 %.01, 4
  br i1 %4, label %5, label %23

5:                                                ; preds = %3
  br label %6

6:                                                ; preds = %18, %5
  %.02 = phi i32 [ 0, %5 ], [ %19, %18 ]
  %7 = icmp slt i32 %.02, 4
  br i1 %7, label %8, label %20

8:                                                ; preds = %6
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [4 x i32], [4 x i32]* %0, i64 %9
  %11 = sext i32 %.02 to i64
  %12 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 0, i64 %11
  %13 = load i32, i32* %12, align 4
  %14 = sext i32 %.01 to i64
  %15 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %2, i64 0, i64 %14
  %16 = sext i32 %.02 to i64
  %17 = getelementptr inbounds [4 x i32], [4 x i32]* %15, i64 0, i64 %16
  store i32 %13, i32* %17, align 4
  br label %18

18:                                               ; preds = %8
  %19 = add nsw i32 %.02, 1
  br label %6

20:                                               ; preds = %6
  br label %21

21:                                               ; preds = %20
  %22 = add nsw i32 %.01, 1
  br label %3

23:                                               ; preds = %3
  br label %24

24:                                               ; preds = %68, %23
  %.0 = phi i32 [ 0, %23 ], [ %69, %68 ]
  %25 = icmp slt i32 %.0, 4
  br i1 %25, label %26, label %70

26:                                               ; preds = %24
  br label %27

27:                                               ; preds = %65, %26
  %.1 = phi i32 [ 0, %26 ], [ %66, %65 ]
  %28 = icmp slt i32 %.1, 4
  br i1 %28, label %29, label %67

29:                                               ; preds = %27
  br label %30

30:                                               ; preds = %62, %29
  %.13 = phi i32 [ 0, %29 ], [ %63, %62 ]
  %31 = icmp slt i32 %.13, 4
  br i1 %31, label %32, label %64

32:                                               ; preds = %30
  %33 = sext i32 %.1 to i64
  %34 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %2, i64 0, i64 %33
  %35 = sext i32 %.13 to i64
  %36 = getelementptr inbounds [4 x i32], [4 x i32]* %34, i64 0, i64 %35
  %37 = load i32, i32* %36, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %55, label %39

39:                                               ; preds = %32
  %40 = sext i32 %.1 to i64
  %41 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %2, i64 0, i64 %40
  %42 = sext i32 %.0 to i64
  %43 = getelementptr inbounds [4 x i32], [4 x i32]* %41, i64 0, i64 %42
  %44 = load i32, i32* %43, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %53

46:                                               ; preds = %39
  %47 = sext i32 %.0 to i64
  %48 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %2, i64 0, i64 %47
  %49 = sext i32 %.13 to i64
  %50 = getelementptr inbounds [4 x i32], [4 x i32]* %48, i64 0, i64 %49
  %51 = load i32, i32* %50, align 4
  %52 = icmp ne i32 %51, 0
  br label %53

53:                                               ; preds = %46, %39
  %54 = phi i1 [ false, %39 ], [ %52, %46 ]
  br label %55

55:                                               ; preds = %53, %32
  %56 = phi i1 [ true, %32 ], [ %54, %53 ]
  %57 = zext i1 %56 to i32
  %58 = sext i32 %.1 to i64
  %59 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %2, i64 0, i64 %58
  %60 = sext i32 %.13 to i64
  %61 = getelementptr inbounds [4 x i32], [4 x i32]* %59, i64 0, i64 %60
  store i32 %57, i32* %61, align 4
  br label %62

62:                                               ; preds = %55
  %63 = add nsw i32 %.13, 1
  br label %30

64:                                               ; preds = %30
  br label %65

65:                                               ; preds = %64
  %66 = add nsw i32 %.1, 1
  br label %27

67:                                               ; preds = %27
  br label %68

68:                                               ; preds = %67
  %69 = add nsw i32 %.0, 1
  br label %24

70:                                               ; preds = %24
  %71 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %2, i32 0, i32 0
  call void @_Z13printSolutionPA4_i([4 x i32]* %71)
  ret void
}

; Function Attrs: noinline sspstrong uwtable
define dso_local void @_Z13printSolutionPA4_i([4 x i32]* %0) #0 {
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str, i32 0, i32 0))
  br label %3

3:                                                ; preds = %19, %1
  %.01 = phi i32 [ 0, %1 ], [ %20, %19 ]
  %4 = icmp slt i32 %.01, 4
  br i1 %4, label %5, label %21

5:                                                ; preds = %3
  br label %6

6:                                                ; preds = %15, %5
  %.0 = phi i32 [ 0, %5 ], [ %16, %15 ]
  %7 = icmp slt i32 %.0, 4
  br i1 %7, label %8, label %17

8:                                                ; preds = %6
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [4 x i32], [4 x i32]* %0, i64 %9
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 0, i64 %11
  %13 = load i32, i32* %12, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %13)
  br label %15

15:                                               ; preds = %8
  %16 = add nsw i32 %.0, 1
  br label %6

17:                                               ; preds = %6
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  br label %19

19:                                               ; preds = %17
  %20 = add nsw i32 %.01, 1
  br label %3

21:                                               ; preds = %3
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local i32 @main() #2 {
  %1 = alloca [4 x [4 x i32]], align 16
  %2 = bitcast [4 x [4 x i32]]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([4 x [4 x i32]]* @__const.main.graph to i8*), i64 64, i1 false)
  %3 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %1, i32 0, i32 0
  call void @_Z17transitiveClosurePA4_i([4 x i32]* %3)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}
