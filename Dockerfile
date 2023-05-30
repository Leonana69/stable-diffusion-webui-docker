FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-runtime

RUN apt update && apt install -y wget git python3 python3-pip nano google-perftools libgl1-mesa-dev
RUN pip install gfpgan clip open_clip_torch

WORKDIR /root
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git


WORKDIR /root/stable-diffusion-webui
COPY ./src /root/stable-diffusion-webui/

RUN bash webui.sh
EXPOSE 7861
CMD ["python", "launch.py", "--port", "7861", "--listen", "--theme", "light"]