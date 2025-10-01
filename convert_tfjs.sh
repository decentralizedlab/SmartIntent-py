#!/bin/bash
export CUDA_VISIBLE_DEVICES=none

# 定义变量
MODEL=smartbert_lstm.keras
DIR=smartbert_lstm
JS=smartbert_lstm_js

# 运行Python脚本，传入命令行参数
python save_model.py --model_path ./models/$MODEL --model_dir ./models/$DIR

# 运行TensorFlow.js转换命令
tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --control_flow_v2=true ./models/$DIR ./models/$JS
