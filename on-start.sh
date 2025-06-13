#!/bin/bash

# This script automates the setup of an AUTOMATIC1111 instance on Vast.ai.
# Stop the script if any command fails
set -e

echo "--- Starting Custom Setup ---"

# Define the directory where upscaler models should be placed
ESRGAN_MODELS_DIR="/workspace/stable-diffusion-webui/models/ESRGAN"

# Create the directory if it doesn't exist
mkdir -p $ESRGAN_MODELS_DIR
echo "Upscaler model directory is ready at $ESRGAN_MODELS_DIR"

# ------------------------------------------------------------------------------------
# ▼▼▼ PASTE YOUR MODEL DOWNLOAD LINKS FROM OPENMODELDB.INFO BELOW ▼▼▼
#
# HOW-TO:
#   1. Go to https://openmodeldb.info/
#   2. Find a model you want.
#   3. Right-click the blue "Download" button and select "Copy Link Address".
#   4. Create a new line below and paste it inside the quotes for the wget command.
#
# TEMPLATE:
#   wget -nc -P "$ESRGAN_MODELS_DIR" "PASTE_YOUR_LINK_HERE"
# ------------------------------------------------------------------------------------

echo "--- Downloading Upscaler Models ---"

# Model 1: 4x-UltraSharp
wget -nc -P "$ESRGAN_MODELS_DIR" "https://huggingface.co/lokCX/4x-UltraSharp/resolve/main/4x-UltraSharp.pth"

# Model 2: 4x_NMKD-Siax_200k (Example)
wget -nc -P "$ESRGAN_MODELS_DIR" "https://huggingface.co/Akumetsu971/SD_upscalers/resolve/main/4x_NMKD-Siax_200k.pth"

# Model 3: lollypop (Example)
wget -nc -P "$ESRGAN_MODELS_DIR" "https://huggingface.co/substat/lollypop-upscaler/resolve/main/lollypop.pth"

# Add your new models on the lines below:





echo "--- All models downloaded successfully ---"


# --- Launch the Web UI ---
# This starts AUTOMATIC1111 so you can access it.
echo "--- Launching AUTOMATIC1111 Web UI ---"
cd /workspace/stable-diffusion-webui
python launch.py --xformers --api --listen --port 17860 --enable-insecure-extension-access

echo "--- Setup Complete ---"
