# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui_fearnworksnodes@0.1.2 --mode remote

# download models into comfyui
RUN comfy model download --url https://huggingface.co/ashllay/YOLO_Models/resolve/main/bbox/nipples_yolov8s.pt --relative-path models/ultralytics/bbox --filename nipples_yolov8s.pt
RUN comfy model download --url https://huggingface.co/uooogh/nipples_yolov8s-seg/resolve/main/nipples_yolov8s-seg.pt --relative-path models/ultralytics/segm --filename nipples_yolov8s-seg.pt
RUN comfy model download --url https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth --relative-path models/sams --filename sam_vit_b_01ec64.pth
RUN comfy model download --url https://huggingface.co/dhead/animagineXL40_v4Opt/resolve/main/animagineXL40_v4Opt.safetensors --relative-path models/checkpoints --filename animagineXL40_v4Opt.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
