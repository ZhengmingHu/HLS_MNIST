; ModuleID = 'E:/HLSproj/LeNet5_hls_proj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_lenet5_ir(float* %w_conv0, float* %b_conv0, float* %w_conv1, float* %b_conv1, float* %w_fc0, float* %b_fc0, float* %w_fc1, float* %b_fc1, float* %feature_in, float* %feature_out, i32* %result) local_unnamed_addr #0 {
entry:
  %w_conv0_copy = alloca [400 x float], align 512
  %b_conv0_copy = alloca [16 x float], align 512
  %malloccall = tail call i8* @malloc(i64 51200)
  %w_conv1_copy = bitcast i8* %malloccall to [12800 x float]*
  %b_conv1_copy = alloca [32 x float], align 512
  %malloccall1 = tail call i8* @malloc(i64 262144)
  %w_fc0_copy = bitcast i8* %malloccall1 to [65536 x float]*
  %b_fc0_copy = alloca [128 x float], align 512
  %malloccall2 = tail call i8* @malloc(i64 5120)
  %w_fc1_copy = bitcast i8* %malloccall2 to [1280 x float]*
  %b_fc1_copy = alloca [10 x float], align 512
  %feature_in_copy = alloca [784 x float], align 512
  %feature_out_copy = alloca [10 x float], align 512
  %result_copy = alloca [1 x i32], align 512
  %0 = bitcast float* %w_conv0 to [400 x float]*
  %1 = bitcast float* %b_conv0 to [16 x float]*
  %2 = bitcast float* %w_conv1 to [12800 x float]*
  %3 = bitcast float* %b_conv1 to [32 x float]*
  %4 = bitcast float* %w_fc0 to [65536 x float]*
  %5 = bitcast float* %b_fc0 to [128 x float]*
  %6 = bitcast float* %w_fc1 to [1280 x float]*
  %7 = bitcast float* %b_fc1 to [10 x float]*
  %8 = bitcast float* %feature_in to [784 x float]*
  %9 = bitcast float* %feature_out to [10 x float]*
  %10 = bitcast i32* %result to [1 x i32]*
  call fastcc void @copy_in([400 x float]* %0, [400 x float]* nonnull align 512 %w_conv0_copy, [16 x float]* %1, [16 x float]* nonnull align 512 %b_conv0_copy, [12800 x float]* %2, [12800 x float]* %w_conv1_copy, [32 x float]* %3, [32 x float]* nonnull align 512 %b_conv1_copy, [65536 x float]* %4, [65536 x float]* %w_fc0_copy, [128 x float]* %5, [128 x float]* nonnull align 512 %b_fc0_copy, [1280 x float]* %6, [1280 x float]* %w_fc1_copy, [10 x float]* %7, [10 x float]* nonnull align 512 %b_fc1_copy, [784 x float]* %8, [784 x float]* nonnull align 512 %feature_in_copy, [10 x float]* %9, [10 x float]* nonnull align 512 %feature_out_copy, [1 x i32]* %10, [1 x i32]* nonnull align 512 %result_copy)
  %11 = getelementptr inbounds [400 x float], [400 x float]* %w_conv0_copy, i32 0, i32 0
  %12 = getelementptr inbounds [16 x float], [16 x float]* %b_conv0_copy, i32 0, i32 0
  %13 = getelementptr inbounds [12800 x float], [12800 x float]* %w_conv1_copy, i32 0, i32 0
  %14 = getelementptr inbounds [32 x float], [32 x float]* %b_conv1_copy, i32 0, i32 0
  %15 = getelementptr inbounds [65536 x float], [65536 x float]* %w_fc0_copy, i32 0, i32 0
  %16 = getelementptr inbounds [128 x float], [128 x float]* %b_fc0_copy, i32 0, i32 0
  %17 = getelementptr inbounds [1280 x float], [1280 x float]* %w_fc1_copy, i32 0, i32 0
  %18 = getelementptr inbounds [10 x float], [10 x float]* %b_fc1_copy, i32 0, i32 0
  %19 = getelementptr inbounds [784 x float], [784 x float]* %feature_in_copy, i32 0, i32 0
  %20 = getelementptr inbounds [10 x float], [10 x float]* %feature_out_copy, i32 0, i32 0
  %21 = getelementptr inbounds [1 x i32], [1 x i32]* %result_copy, i32 0, i32 0
  call void @apatb_lenet5_hw(float* %11, float* %12, float* %13, float* %14, float* %15, float* %16, float* %17, float* %18, float* %19, float* %20, i32* %21)
  call fastcc void @copy_out([400 x float]* %0, [400 x float]* nonnull align 512 %w_conv0_copy, [16 x float]* %1, [16 x float]* nonnull align 512 %b_conv0_copy, [12800 x float]* %2, [12800 x float]* %w_conv1_copy, [32 x float]* %3, [32 x float]* nonnull align 512 %b_conv1_copy, [65536 x float]* %4, [65536 x float]* %w_fc0_copy, [128 x float]* %5, [128 x float]* nonnull align 512 %b_fc0_copy, [1280 x float]* %6, [1280 x float]* %w_fc1_copy, [10 x float]* %7, [10 x float]* nonnull align 512 %b_fc1_copy, [784 x float]* %8, [784 x float]* nonnull align 512 %feature_in_copy, [10 x float]* %9, [10 x float]* nonnull align 512 %feature_out_copy, [1 x i32]* %10, [1 x i32]* nonnull align 512 %result_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([400 x float]* readonly, [400 x float]* noalias align 512, [16 x float]* readonly, [16 x float]* noalias align 512, [12800 x float]* readonly, [12800 x float]* noalias, [32 x float]* readonly, [32 x float]* noalias align 512, [65536 x float]* readonly, [65536 x float]* noalias, [128 x float]* readonly, [128 x float]* noalias align 512, [1280 x float]* readonly, [1280 x float]* noalias, [10 x float]* readonly, [10 x float]* noalias align 512, [784 x float]* readonly, [784 x float]* noalias align 512, [10 x float]* readonly, [10 x float]* noalias align 512, [1 x i32]* readonly, [1 x i32]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a400f32([400 x float]* align 512 %1, [400 x float]* %0)
  call fastcc void @onebyonecpy_hls.p0a16f32([16 x float]* align 512 %3, [16 x float]* %2)
  call fastcc void @onebyonecpy_hls.p0a12800f32([12800 x float]* %5, [12800 x float]* %4)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %7, [32 x float]* %6)
  call fastcc void @onebyonecpy_hls.p0a65536f32([65536 x float]* %9, [65536 x float]* %8)
  call fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* align 512 %11, [128 x float]* %10)
  call fastcc void @onebyonecpy_hls.p0a1280f32([1280 x float]* %13, [1280 x float]* %12)
  call fastcc void @onebyonecpy_hls.p0a10f32([10 x float]* align 512 %15, [10 x float]* %14)
  call fastcc void @onebyonecpy_hls.p0a784f32([784 x float]* align 512 %17, [784 x float]* %16)
  call fastcc void @onebyonecpy_hls.p0a10f32([10 x float]* align 512 %19, [10 x float]* %18)
  call fastcc void @onebyonecpy_hls.p0a1i32([1 x i32]* align 512 %21, [1 x i32]* %20)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a400f32([400 x float]* noalias align 512, [400 x float]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [400 x float]* %0, null
  %3 = icmp eq [400 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [400 x float], [400 x float]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast float* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [400 x float], [400 x float]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast float* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 400
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a16f32([16 x float]* noalias align 512, [16 x float]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [16 x float]* %0, null
  %3 = icmp eq [16 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [16 x float], [16 x float]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast float* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [16 x float], [16 x float]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast float* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 16
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a12800f32([12800 x float]* noalias, [12800 x float]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [12800 x float]* %0, null
  %3 = icmp eq [12800 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [12800 x float], [12800 x float]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast float* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [12800 x float], [12800 x float]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast float* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 12800
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* noalias align 512, [32 x float]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [32 x float]* %0, null
  %3 = icmp eq [32 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [32 x float], [32 x float]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast float* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [32 x float], [32 x float]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast float* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 32
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a65536f32([65536 x float]* noalias, [65536 x float]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [65536 x float]* %0, null
  %3 = icmp eq [65536 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [65536 x float], [65536 x float]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast float* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [65536 x float], [65536 x float]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast float* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 65536
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* noalias align 512, [128 x float]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [128 x float]* %0, null
  %3 = icmp eq [128 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [128 x float], [128 x float]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast float* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [128 x float], [128 x float]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast float* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 128
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a1280f32([1280 x float]* noalias, [1280 x float]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [1280 x float]* %0, null
  %3 = icmp eq [1280 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [1280 x float], [1280 x float]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast float* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [1280 x float], [1280 x float]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast float* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 1280
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a10f32([10 x float]* noalias align 512, [10 x float]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [10 x float]* %0, null
  %3 = icmp eq [10 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [10 x float], [10 x float]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast float* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [10 x float], [10 x float]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast float* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 10
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a784f32([784 x float]* noalias align 512, [784 x float]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [784 x float]* %0, null
  %3 = icmp eq [784 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [784 x float], [784 x float]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast float* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [784 x float], [784 x float]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast float* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 784
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a1i32([1 x i32]* noalias align 512, [1 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [1 x i32]* %0, null
  %3 = icmp eq [1 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %for.loop

for.loop:                                         ; preds = %entry
  %5 = bitcast [1 x i32]* %0 to i8*
  %6 = bitcast [1 x i32]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  br label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([400 x float]*, [400 x float]* noalias readonly align 512, [16 x float]*, [16 x float]* noalias readonly align 512, [12800 x float]*, [12800 x float]* noalias readonly, [32 x float]*, [32 x float]* noalias readonly align 512, [65536 x float]*, [65536 x float]* noalias readonly, [128 x float]*, [128 x float]* noalias readonly align 512, [1280 x float]*, [1280 x float]* noalias readonly, [10 x float]*, [10 x float]* noalias readonly align 512, [784 x float]*, [784 x float]* noalias readonly align 512, [10 x float]*, [10 x float]* noalias readonly align 512, [1 x i32]*, [1 x i32]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a400f32([400 x float]* %0, [400 x float]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a16f32([16 x float]* %2, [16 x float]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a12800f32([12800 x float]* %4, [12800 x float]* %5)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %6, [32 x float]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a65536f32([65536 x float]* %8, [65536 x float]* %9)
  call fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* %10, [128 x float]* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0a1280f32([1280 x float]* %12, [1280 x float]* %13)
  call fastcc void @onebyonecpy_hls.p0a10f32([10 x float]* %14, [10 x float]* align 512 %15)
  call fastcc void @onebyonecpy_hls.p0a784f32([784 x float]* %16, [784 x float]* align 512 %17)
  call fastcc void @onebyonecpy_hls.p0a10f32([10 x float]* %18, [10 x float]* align 512 %19)
  call fastcc void @onebyonecpy_hls.p0a1i32([1 x i32]* %20, [1 x i32]* align 512 %21)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_lenet5_hw(float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, i32*)

define void @lenet5_hw_stub_wrapper(float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, i32*) #5 {
entry:
  %11 = bitcast float* %0 to [400 x float]*
  %12 = bitcast float* %1 to [16 x float]*
  %13 = bitcast float* %2 to [12800 x float]*
  %14 = bitcast float* %3 to [32 x float]*
  %15 = bitcast float* %4 to [65536 x float]*
  %16 = bitcast float* %5 to [128 x float]*
  %17 = bitcast float* %6 to [1280 x float]*
  %18 = bitcast float* %7 to [10 x float]*
  %19 = bitcast float* %8 to [784 x float]*
  %20 = bitcast float* %9 to [10 x float]*
  %21 = bitcast i32* %10 to [1 x i32]*
  call void @copy_out([400 x float]* null, [400 x float]* %11, [16 x float]* null, [16 x float]* %12, [12800 x float]* null, [12800 x float]* %13, [32 x float]* null, [32 x float]* %14, [65536 x float]* null, [65536 x float]* %15, [128 x float]* null, [128 x float]* %16, [1280 x float]* null, [1280 x float]* %17, [10 x float]* null, [10 x float]* %18, [784 x float]* null, [784 x float]* %19, [10 x float]* null, [10 x float]* %20, [1 x i32]* null, [1 x i32]* %21)
  %22 = bitcast [400 x float]* %11 to float*
  %23 = bitcast [16 x float]* %12 to float*
  %24 = bitcast [12800 x float]* %13 to float*
  %25 = bitcast [32 x float]* %14 to float*
  %26 = bitcast [65536 x float]* %15 to float*
  %27 = bitcast [128 x float]* %16 to float*
  %28 = bitcast [1280 x float]* %17 to float*
  %29 = bitcast [10 x float]* %18 to float*
  %30 = bitcast [784 x float]* %19 to float*
  %31 = bitcast [10 x float]* %20 to float*
  %32 = bitcast [1 x i32]* %21 to i32*
  call void @lenet5_hw_stub(float* %22, float* %23, float* %24, float* %25, float* %26, float* %27, float* %28, float* %29, float* %30, float* %31, i32* %32)
  call void @copy_in([400 x float]* null, [400 x float]* %11, [16 x float]* null, [16 x float]* %12, [12800 x float]* null, [12800 x float]* %13, [32 x float]* null, [32 x float]* %14, [65536 x float]* null, [65536 x float]* %15, [128 x float]* null, [128 x float]* %16, [1280 x float]* null, [1280 x float]* %17, [10 x float]* null, [10 x float]* %18, [784 x float]* null, [784 x float]* %19, [10 x float]* null, [10 x float]* %20, [1 x i32]* null, [1 x i32]* %21)
  ret void
}

declare void @lenet5_hw_stub(float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, i32*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
