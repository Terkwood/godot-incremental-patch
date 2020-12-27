#!/bin/bash

DATA_DIR=/tmp/delta-sample-0456

if [ -d "$DATA_DIR" ]; then
    echo "Cannot proceed if the dir $DATA_DIR exists!"
    exit 1
fi


# needs a dummy entry to represent the beginning of time.
# the URL and checksum values will be ignored
write-delta --data-dir $DATA_DIR -r 0.0.0 -p 0.0.0 --diff-url "http://localhost:8080/nothing" --diff-b2bsum 0 --expected-pck-b2bsum 0


# first update
write-delta --data-dir $DATA_DIR -r "0.0.0-DELTA" -p 0.0.0 --diff-url "http://localhost:8080/test-0.0.0_to_test-0.0.0-DELTA.bin" --diff-b2bsum 3de46aeb3a11efb998af4a7c1bcdf54d1a397df9d31883162942ac5cbab04dba1e7f8dc451d6b621ae80e4220c1767d9533795d4afc0b0cfffd7017f72e1f3cc --expected-pck-b2bsum 80417e1017a3be2e153fd5e8fbf342d30861a14ae15488c3cf1a850fac98e3c1f5a2e6c2262ce1bb70c3cd23c9a1a01fa8ba24fab9d24138849e81bdc8eebd49

write-delta --data-dir $DATA_DIR -r "0.1.0" -p "0.0.0-DELTA" --diff-url "http://localhost:8080/test-0.0.0-DELTA_to_test-0.1.0.bin" --diff-b2bsum abcd -e 6e9a3c25ea95bec459f833add17e34340ffd07226ac3d3fc2332c6b7d31e45f6419b5d3b276cbb5efa0ff63109d3f867a03e04a576fa7848e62eba0c9618e811
