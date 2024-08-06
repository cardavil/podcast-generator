FROM ubuntu:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
# New 6 dependencies
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
# New
Run python3.10 -m pip install --upgrade pip
 
# Install Python dependencies
RUN pip3.10 install PyYAML

#copy the application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script is executable
# New
RUN chmod +x /entrypoint.sh

# Set the entrypoint script is executable
ENTRYPOINT ["/entrypoint.sh"]
