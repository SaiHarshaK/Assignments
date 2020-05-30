; ModuleID = 'transitive-closure-of-a-graph.memopt.ll'
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

3:                                                ; preds = %12, %1
  %lsr.iv12 = phi [4 x i32]* [ %15, %12 ], [ %0, %1 ]
  %lsr.iv7 = phi [4 x [4 x i32]]* [ %14, %12 ], [ %2, %1 ]
  %.01 = phi i32 [ 0, %1 ], [ %13, %12 ]
  %4 = icmp slt i32 %.01, 4
  br i1 %4, label %5, label %16

5:                                                ; preds = %3
  br label %6

6:                                                ; preds = %10, %5
  %lsr.iv9 = phi i64 [ %lsr.iv.next10, %10 ], [ 0, %5 ]
  %tmp15 = trunc i64 %lsr.iv9 to i32
  %7 = icmp slt i32 %tmp15, 4
  br i1 %7, label %8, label %11

8:                                                ; preds = %6
  %scevgep14 = getelementptr [4 x i32], [4 x i32]* %lsr.iv12, i64 0, i64 %lsr.iv9
  %9 = load i32, i32* %scevgep14, align 4
  %scevgep11 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %lsr.iv7, i64 0, i64 0, i64 %lsr.iv9
  store i32 %9, i32* %scevgep11, align 4
  br label %10

10:                                               ; preds = %8
  %lsr.iv.next10 = add nuw nsw i64 %lsr.iv9, 1
  br label %6

11:                                               ; preds = %6
  br label %12

12:                                               ; preds = %11
  %13 = add nsw i32 %.01, 1
  %scevgep8 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %lsr.iv7, i64 0, i64 1, i64 0
  %14 = bitcast i32* %scevgep8 to [4 x [4 x i32]]*
  %scevgep13 = getelementptr [4 x i32], [4 x i32]* %lsr.iv12, i64 1, i64 0
  %15 = bitcast i32* %scevgep13 to [4 x i32]*
  br label %3

16:                                               ; preds = %3
  br label %17

17:                                               ; preds = %49, %16
  %lsr.iv4 = phi [4 x [4 x i32]]* [ %51, %49 ], [ %2, %16 ]
  %.0 = phi i32 [ 0, %16 ], [ %50, %49 ]
  %18 = icmp slt i32 %.0, 4
  br i1 %18, label %19, label %52

19:                                               ; preds = %17
  br label %20

20:                                               ; preds = %45, %19
  %lsr.iv = phi [4 x [4 x i32]]* [ %47, %45 ], [ %2, %19 ]
  %.1 = phi i32 [ 0, %19 ], [ %46, %45 ]
  %21 = icmp slt i32 %.1, 4
  br i1 %21, label %22, label %48

22:                                               ; preds = %20
  br label %23

23:                                               ; preds = %43, %22
  %lsr.iv1 = phi i64 [ %lsr.iv.next, %43 ], [ 0, %22 ]
  %tmp = trunc i64 %lsr.iv1 to i32
  %24 = icmp slt i32 %tmp, 4
  br i1 %24, label %25, label %44

25:                                               ; preds = %23
  %scevgep3 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %lsr.iv, i64 0, i64 0, i64 %lsr.iv1
  %26 = load i32, i32* %scevgep3, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %40, label %28

28:                                               ; preds = %25
  %29 = sext i32 %.1 to i64
  %30 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %2, i64 0, i64 %29
  %31 = sext i32 %.0 to i64
  %32 = getelementptr inbounds [4 x i32], [4 x i32]* %30, i64 0, i64 %31
  %33 = load i32, i32* %32, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %38

35:                                               ; preds = %28
  %scevgep6 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %lsr.iv4, i64 0, i64 0, i64 %lsr.iv1
  %36 = load i32, i32* %scevgep6, align 4
  %37 = icmp ne i32 %36, 0
  br label %38

38:                                               ; preds = %35, %28
  %39 = phi i1 [ false, %28 ], [ %37, %35 ]
  br label %40

40:                                               ; preds = %38, %25
  %41 = phi i1 [ true, %25 ], [ %39, %38 ]
  %42 = zext i1 %41 to i32
  %scevgep2 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %lsr.iv, i64 0, i64 0, i64 %lsr.iv1
  store i32 %42, i32* %scevgep2, align 4
  br label %43

43:                                               ; preds = %40
  %lsr.iv.next = add nuw nsw i64 %lsr.iv1, 1
  br label %23

44:                                               ; preds = %23
  br label %45

45:                                               ; preds = %44
  %46 = add nsw i32 %.1, 1
  %scevgep = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %lsr.iv, i64 0, i64 1, i64 0
  %47 = bitcast i32* %scevgep to [4 x [4 x i32]]*
  br label %20

48:                                               ; preds = %20
  br label %49

49:                                               ; preds = %48
  %50 = add nsw i32 %.0, 1
  %scevgep5 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %lsr.iv4, i64 0, i64 1, i64 0
  %51 = bitcast i32* %scevgep5 to [4 x [4 x i32]]*
  br label %17

52:                                               ; preds = %17
  %53 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %2, i32 0, i32 0
  call void @_Z13printSolutionPA4_i([4 x i32]* %53)
  ret void
}

; Function Attrs: noinline sspstrong uwtable
define dso_local void @_Z13printSolutionPA4_i([4 x i32]* %0) #0 {
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str, i32 0, i32 0))
  br label %3

3:                                                ; preds = %14, %1
  %lsr.iv = phi [4 x i32]* [ %16, %14 ], [ %0, %1 ]
  %.01 = phi i32 [ 0, %1 ], [ %15, %14 ]
  %4 = icmp slt i32 %.01, 4
  br i1 %4, label %5, label %17

5:                                                ; preds = %3
  br label %6

6:                                                ; preds = %11, %5
  %lsr.iv1 = phi i64 [ %lsr.iv.next, %11 ], [ 0, %5 ]
  %tmp = trunc i64 %lsr.iv1 to i32
  %7 = icmp slt i32 %tmp, 4
  br i1 %7, label %8, label %12

8:                                                ; preds = %6
  %scevgep2 = getelementptr [4 x i32], [4 x i32]* %lsr.iv, i64 0, i64 %lsr.iv1
  %9 = load i32, i32* %scevgep2, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %9)
  br label %11

11:                                               ; preds = %8
  %lsr.iv.next = add nuw nsw i64 %lsr.iv1, 1
  br label %6

12:                                               ; preds = %6
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  br label %14

14:                                               ; preds = %12
  %15 = add nsw i32 %.01, 1
  %scevgep = getelementptr [4 x i32], [4 x i32]* %lsr.iv, i64 1, i64 0
  %16 = bitcast i32* %scevgep to [4 x i32]*
  br label %3

17:                                               ; preds = %3
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
