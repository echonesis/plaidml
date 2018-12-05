// Copyright 2018, Intel Corporation

#pragma once

#include "tile/codegen/codegen.pb.h"
#include "tile/stripe/stripe.h"

namespace vertexai {
namespace tile {
namespace codegen {

void UnrollPass(stripe::Block* root, const proto::UnrollPass& options);
void UnrollIndexPass(stripe::Block* root, const proto::GenericPass& options);

}  // namespace codegen
}  // namespace tile
}  // namespace vertexai
