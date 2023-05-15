#!/bin/bash

# Check if video folder path and output folder path are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 video_folder_path output_folder_path"
    exit 1
fi

# Create features and clustering folders inside output folder
mkdir -p $2/features $2/clustering

# Run feature extraction script with arguments
python extract_features.py --video-folder $1 --feature-folder $2/features

# Run clustering script with arguments
python clustering.py --video-folder $1 --feature-folder $2/features --clustering-folder $2/clustering --method kmeans --num-clusters 10