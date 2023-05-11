# remove old container and image
docker stop -t 0 sd-webui
docker image rm -f sd-webui:0.1
docker rm -f sd-webui &>/dev/null

# build
docker build -t sd-webui:0.1 .

# create a new container
docker run -td --privileged --net=host --ipc=host \
    --gpus all \
    --name="sd-webui" \
    -v ./models:/root/stable-diffusion-webui/models/Stable-diffusion \
    -v ./vae:/root/stable-diffusion-webui/models/VAE \
    -v ./embeddings:/root/stable-diffusion-webui/embeddings/ \
    -v ./lora:/root/stable-diffusion-webui/models/Lora \
    -e "DISPLAY=$DISPLAY" \
    sd-webui:0.1 \