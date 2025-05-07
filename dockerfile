FROM ac2-registry.cn-hangzhou.cr.aliyuncs.com/ac2/pytorch-ubuntu:2.3.0-cuda12.1.1-ubuntu22.04
RUN pip install flask opencv-python
RUN pip install opencv-python-headless matplotlib tqdm pyyaml psutil modelscope accelerate qwen-vl-utils[decord]
RUN apt update && apt install git gcc g++ python3.10-dev -y
RUN pip install git+https://gitcode.com/gh_mirrors/tra/transformers
RUN pip install vllm==0.8.4
RUN mkdir -p /home/admin/atec_project
RUN mkdir -p /home/admin/workspace/job/logs/
COPY *.py /home/admin/atec_project/
RUN ln -s /bin/python3 /bin/python
RUN python get_qwen_model.py