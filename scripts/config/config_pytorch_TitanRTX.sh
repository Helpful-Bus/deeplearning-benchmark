#!/bin/bash

NUM_GPU=1
NUM_EXP=2

PyTorch_SSD_FP32_PARAMS=(   
             --data                   "/data/object_detection"
             --batch-size             "16"
             --benchmark-warmup       "100"
             --benchmark-iterations   "200"
           )

PyTorch_SSD_AMP_PARAMS=(   
             --data                   "/data/object_detection"
             --batch-size             "32"
             --benchmark-warmup       "100"
             --benchmark-iterations   "200"
             --amp
           )

PyTorch_resnet50_FP32_PARAMS=(
                                      "/data/imagenet"
             --arch                   "resnet50"
             --epochs                 "1" 
             --prof                   "100" 
             --batch-size             "64"
             --raport-file            "benchmark.json"
             --print-freq             "1"
             --training-only
           )

PyTorch_resnet50_FP16_PARAMS=(
                                      "/data/imagenet"
             --arch                   "resnet50"
             --fp16
             --static-loss-scale      "256"
             --epochs                 "1" 
             --prof                   "100" 
             --batch-size             "128"
             --raport-file            "benchmark.json"
             --print-freq             "1"
             --training-only  
           )

PyTorch_resnet50_AMP_PARAMS=(
                                      "/data/imagenet"
             --arch                   "resnet50"
             --amp
             --static-loss-scale      "256"
             --epochs                 "1" 
             --prof                   "100" 
             --batch-size             "128"
             --raport-file            "benchmark.json"
             --print-freq             "1"
             --training-only   
           )

PyTorch_maskrcnn_FP32_PARAMS=(
             --config-file            "/workspace/config/e2e_mask_rcnn_R_50_FPN_1x.yaml"
             SOLVER.IMS_PER_BATCH     "2"
             DTYPE                    "float32"
             SOLVER.MAX_ITER          "500"
             OUTPUT_DIR               "/results"
             PATHS_CATALOG            "/workspace/config/paths_catalog_ci.py"
           )

PyTorch_maskrcnn_FP16_PARAMS=(
             --config-file            "/workspace/config/e2e_mask_rcnn_R_50_FPN_1x.yaml"
             SOLVER.IMS_PER_BATCH     "4"
             DTYPE                    "float16"
             SOLVER.MAX_ITER          "500"
             OUTPUT_DIR               "/results"
             PATHS_CATALOG            "/workspace/config/paths_catalog_ci.py"
           )

PyTorch_gnmt_FP32_PARAMS=(
            --dataset-dir             "/data/gnmt/wmt16_de_en"
            --train-batch-size        "96"
            --math                    "fp32"
            --epochs                  "1"
            --seed                    "2"
           )

PyTorch_gnmt_FP16_PARAMS=(
            --dataset-dir             "/data/gnmt/wmt16_de_en"
            --train-batch-size        "192"
            --math                    "fp16"
            --epochs                  "1"
            --seed                    "2"
           )

PyTorch_ncf_FP32_PARAMS=(
            --data                    "/data/ncf/cache/ml-20m"
            --epochs                  "1"
            --opt_level               "O0"
           )

PyTorch_ncf_FP16_PARAMS=(
            --data                    "/data/ncf/cache/ml-20m"
            --epochs                  "1"
            --opt_level               "O2"
           )

PyTorch_transformerxlbase_FP32_PARAMS=(
            --data                    "/data/transformer-xl/wikitext-103"
            --max_step                "500"
            --batch_size              "1"
            --dataset                 "wt103" 
            --n_layer                 "16"
            --d_model                 "512"
            --n_head                  "8"
            --d_head                  "64"
            --d_inner                 "2048"
            --dropout                 "0.1"
            --dropatt                 "0.0"
            --optim                   "jitlamb"
            --lr                      "0.01"
            --eta_min                 "0.001"
            --warmup_step             "1000"
            --tgt_len                 "192"
            --mem_len                 "192"
            --eval_tgt_len            "192"
            --log_interval            "10"
            --eval_interval           "5000"
            --roll
            --cuda
           )

PyTorch_transformerxlbase_FP16_PARAMS=(
            --data                    "/data/transformer-xl/wikitext-103"
            --max_step                "500"
            --batch_size              "1"
            --dataset                 "wt103" 
            --n_layer                 "16"
            --d_model                 "512"
            --n_head                  "8"
            --d_head                  "64"
            --d_inner                 "2048"
            --dropout                 "0.1"
            --dropatt                 "0.0"
            --optim                   "jitlamb"
            --lr                      "0.01"
            --eta_min                 "0.001"
            --warmup_step             "1000"
            --tgt_len                 "192"
            --mem_len                 "192"
            --eval_tgt_len            "192"
            --log_interval            "10"
            --eval_interval           "5000"
            --roll
            --cuda
            --fp16
           )

PyTorch_transformerxllarge_FP32_PARAMS=(
            --data                    "/data/transformer-xl/wikitext-103"
            --max_step                "500"
            --batch_size              "1"
            --dataset                 "wt103" 
            --n_layer                 "18"
            --d_model                 "1024"
            --n_head                  "16"
            --d_head                  "64"
            --d_inner                 "4096"
            --dropout                 "0.2"
            --dropatt                 "0.2"
            --optim                   "adam"
            --lr                      "0.00025"
            --warmup_step             "16000"
            --tgt_len                 "256"
            --mem_len                 "256"
            --eval_tgt_len            "128"
            --eval_interval           "5000"
            --roll
            --cuda
           )

PyTorch_transformerxllarge_FP16_PARAMS=(
            --data                    "/data/transformer-xl/wikitext-103"
            --max_step                "500"
            --batch_size              "1"
            --dataset                 "wt103" 
            --n_layer                 "18"
            --d_model                 "1024"
            --n_head                  "16"
            --d_head                  "64"
            --d_inner                 "4096"
            --dropout                 "0.2"
            --dropatt                 "0.2"
            --optim                   "adam"
            --lr                      "0.00025"
            --warmup_step             "16000"
            --tgt_len                 "256"
            --mem_len                 "256"
            --eval_tgt_len            "128"
            --eval_interval           "5000"
            --cuda
            --fp16
           )