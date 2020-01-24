// RUN: pmlc-opt -convert-tile-to-pxa -canonicalize -cse %s | FileCheck %s

func @eltwise_add(
  %arg0: tensor<10x20x!eltwise.f32>,
  %arg1: tensor<10x20x!eltwise.f32>
) -> tensor<10x20x!eltwise.f32> {
  %0 = "eltwise.add"(%arg1, %arg0) : (
    tensor<10x20x!eltwise.f32>,
    tensor<10x20x!eltwise.f32>
  ) -> tensor<10x20x!eltwise.f32>
  return %0 : tensor<10x20x!eltwise.f32>
}

// CHECK-LABEL: func @eltwise_add
// CHECK: pxa.parallel
// CHECK: affine.load
// CHECK: affine.load
// CHECK: addf
// CHECK: affine.store