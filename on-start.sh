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
#   1. Go to https://openmodeldb.info/
#   2. Find a model you want.
#   3. Right-click the blue "Download" button and select "Copy Link Address".
#   4. Create a new line below and paste it inside the quotes for the wget command.
#
# TEMPLATE:
#   wget -nc -P "$ESRGAN_MODELS_DIR" "PASTE_YOUR_LINK_HERE"
# ------------------------------------------------------------------------------------

echo "--- Downloading Upscaler Models ---"

wget -nc -P "$ESRGAN_MODELS_DIR" "https://drive.google.com/uc?export=download&confirm=1&id=1d3wPbtjFcgCkWAMVFQalOuQHdiNmfc5i"
# Add your new models on the lines below:





echo "--- All models downloaded successfully ---"


# --- Launch the Web UI ---
# This starts AUTOMATIC1111 so you can access it.
echo "--- Launching AUTOMATIC1111 Web UI ---"
cd /workspace/stable-diffusion-webui
python launch.py --xformers --api --listen --port 17860 --enable-insecure-extension-access

echo "--- Setup Complete ---"
