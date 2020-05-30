; ModuleID = 'matrix-chain-multiplication.memopt.ll'
source_filename = "matrix-chain-multiplication.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@__const.main.arr = private unnamed_addr constant [4 x i32] [i32 1, i32 2, i32 3, i32 4], align 16
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [38 x i8] c"Minimum number of multiplications is \00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_matrix_chain_multiplication.cpp, i8* null }]

; Function Attrs: noinline sspstrong uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @_Z16MatrixChainOrderPii(i32* %0, i32 %1) #4 {
  %3 = zext i32 %1 to i64
  %4 = zext i32 %1 to i64
  %5 = call i8* @llvm.stacksave()
  %6 = mul nuw i64 %3, %4
  %7 = alloca i32, i64 %6, align 16
  %8 = add nuw nsw i64 %4, 1
  %scevgep16 = getelementptr i32, i32* %7, i64 %8
  %9 = shl nuw nsw i64 %4, 2
  %10 = add nuw nsw i64 %9, 4
  br label %11

11:                                               ; preds = %14, %2
  %lsr.iv17 = phi i32* [ %16, %14 ], [ %scevgep16, %2 ]
  %.02 = phi i32 [ 1, %2 ], [ %15, %14 ]
  %lsr.iv1718 = bitcast i32* %lsr.iv17 to i1*
  %12 = icmp slt i32 %.02, %1
  br i1 %12, label %13, label %17

13:                                               ; preds = %11
  store i32 0, i32* %lsr.iv17, align 4
  br label %14

14:                                               ; preds = %13
  %15 = add nsw i32 %.02, 1
  %scevgep19 = getelementptr i1, i1* %lsr.iv1718, i64 %10
  %16 = bitcast i1* %scevgep19 to i32*
  br label %11

17:                                               ; preds = %11
  %scevgep = getelementptr i32, i32* %0, i64 1
  %18 = add nuw nsw i64 %4, 1
  %scevgep9 = getelementptr i32, i32* %7, i64 %18
  %19 = shl nuw nsw i64 %4, 2
  %20 = add nuw nsw i64 %19, 4
  br label %21

21:                                               ; preds = %80, %17
  %.0 = phi i32 [ 2, %17 ], [ %81, %80 ]
  %22 = icmp slt i32 %.0, %1
  br i1 %22, label %23, label %82

23:                                               ; preds = %21
  br label %24

24:                                               ; preds = %76, %23
  %lsr.iv10 = phi i32* [ %78, %76 ], [ %scevgep9, %23 ]
  %lsr.iv5 = phi i32 [ %lsr.iv.next6, %76 ], [ 2, %23 ]
  %lsr.iv = phi i32* [ %scevgep1, %76 ], [ %scevgep, %23 ]
  %.1 = phi i32 [ 1, %23 ], [ %77, %76 ]
  %lsr.iv1013 = bitcast i32* %lsr.iv10 to i8*
  %lsr.iv1011 = bitcast i32* %lsr.iv10 to i1*
  %lsr.iv3 = bitcast i32* %lsr.iv to i8*
  %25 = sub nsw i32 %1, %.0
  %26 = add nsw i32 %25, 1
  %27 = icmp slt i32 %.1, %26
  br i1 %27, label %28, label %79

28:                                               ; preds = %24
  %29 = add nsw i32 %.1, %.0
  %30 = sub nsw i32 %29, 1
  %31 = sext i32 %.1 to i64
  %32 = mul nsw i64 %31, %4
  %33 = getelementptr inbounds i32, i32* %7, i64 %32
  %34 = sext i32 %30 to i64
  %35 = getelementptr inbounds i32, i32* %33, i64 %34
  store i32 2147483647, i32* %35, align 4
  br label %36

36:                                               ; preds = %74, %28
  %lsr.iv7 = phi i32 [ %lsr.iv.next8, %74 ], [ %lsr.iv5, %28 ]
  %lsr.iv2 = phi i64 [ %lsr.iv.next, %74 ], [ 0, %28 ]
  %37 = add i32 %lsr.iv7, -1
  %38 = sub nsw i32 %30, 1
  %39 = icmp sle i32 %37, %38
  br i1 %39, label %40, label %75

40:                                               ; preds = %36
  %uglygep14 = getelementptr i8, i8* %lsr.iv1013, i64 %lsr.iv2
  %uglygep1415 = bitcast i8* %uglygep14 to i32*
  %41 = load i32, i32* %uglygep1415, align 4
  %42 = sext i32 %lsr.iv7 to i64
  %43 = mul nsw i64 %42, %4
  %44 = getelementptr inbounds i32, i32* %7, i64 %43
  %45 = sext i32 %30 to i64
  %46 = getelementptr inbounds i32, i32* %44, i64 %45
  %47 = load i32, i32* %46, align 4
  %48 = add nsw i32 %41, %47
  %49 = sub nsw i32 %.1, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32* %0, i64 %50
  %52 = load i32, i32* %51, align 4
  %uglygep = getelementptr i8, i8* %lsr.iv3, i64 %lsr.iv2
  %uglygep4 = bitcast i8* %uglygep to i32*
  %53 = load i32, i32* %uglygep4, align 4
  %54 = mul nsw i32 %52, %53
  %55 = sext i32 %30 to i64
  %56 = getelementptr inbounds i32, i32* %0, i64 %55
  %57 = load i32, i32* %56, align 4
  %58 = mul nsw i32 %54, %57
  %59 = add nsw i32 %48, %58
  %60 = sext i32 %.1 to i64
  %61 = mul nsw i64 %60, %4
  %62 = getelementptr inbounds i32, i32* %7, i64 %61
  %63 = sext i32 %30 to i64
  %64 = getelementptr inbounds i32, i32* %62, i64 %63
  %65 = load i32, i32* %64, align 4
  %66 = icmp slt i32 %59, %65
  br i1 %66, label %67, label %73

67:                                               ; preds = %40
  %68 = sext i32 %.1 to i64
  %69 = mul nsw i64 %68, %4
  %70 = getelementptr inbounds i32, i32* %7, i64 %69
  %71 = sext i32 %30 to i64
  %72 = getelementptr inbounds i32, i32* %70, i64 %71
  store i32 %59, i32* %72, align 4
  br label %73

73:                                               ; preds = %67, %40
  br label %74

74:                                               ; preds = %73
  %lsr.iv.next = add nuw nsw i64 %lsr.iv2, 4
  %lsr.iv.next8 = add i32 %lsr.iv7, 1
  br label %36

75:                                               ; preds = %36
  br label %76

76:                                               ; preds = %75
  %77 = add nsw i32 %.1, 1
  %scevgep1 = getelementptr i32, i32* %lsr.iv, i64 1
  %lsr.iv.next6 = add nuw i32 %lsr.iv5, 1
  %scevgep12 = getelementptr i1, i1* %lsr.iv1011, i64 %20
  %78 = bitcast i1* %scevgep12 to i32*
  br label %24

79:                                               ; preds = %24
  br label %80

80:                                               ; preds = %79
  %81 = add nsw i32 %.0, 1
  br label %21

82:                                               ; preds = %21
  %83 = mul nsw i64 1, %4
  %84 = getelementptr inbounds i32, i32* %7, i64 %83
  %85 = sub nsw i32 %1, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32* %84, i64 %86
  %88 = load i32, i32* %87, align 4
  call void @llvm.stackrestore(i8* %5)
  ret i32 %88
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local i32 @main() #5 {
  %1 = alloca [4 x i32], align 16
  %2 = bitcast [4 x i32]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([4 x i32]* @__const.main.arr to i8*), i64 16, i1 false)
  %3 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0))
  %4 = getelementptr inbounds [4 x i32], [4 x i32]* %1, i32 0, i32 0
  %5 = call i32 @_Z16MatrixChainOrderPii(i32* %4, i32 4)
  %6 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %3, i32 %5)
  %7 = call i32 @getchar()
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #1

declare i32 @getchar() #1

; Function Attrs: noinline sspstrong uwtable
define internal void @_GLOBAL__sub_I_matrix_chain_multiplication.cpp() #0 section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}
