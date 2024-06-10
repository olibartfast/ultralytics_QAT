# Use the NVIDIA NGC PyTorch base image
FROM nvcr.io/nvidia/pytorch:23.08-py3

# Set the working directory in the container
WORKDIR /workspace

# Copy the current directory contents into the container at /workspace
COPY . /workspace

# Install any additional dependencies if necessary
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip3 install --upgrade pip

# Install Python dependencies (adjust as needed for your project)
RUN pip3 install -q git+https://github.com/THU-MIG/yolov10.git \
    # Add any other dependencies required by your scripts
    # e.g., scikit-learn, pandas, etc.
    && rm -rf /root/.cache/pip

RUN pip3 install -r requirements.txt

# Expose any ports if necessary (example: 8080)
# EXPOSE 8080

# Set the entry point (optional)
# ENTRYPOINT ["python3", "qat-yolov10.py"]

# You can also specify a default command
# CMD ["python3", "qat-yolov10.py"]

# To keep the container running, you might use the following:
# CMD ["tail", "-f", "/dev/null"]
