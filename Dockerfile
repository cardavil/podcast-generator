FROM ubuntu:latest

# install system dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Install Python dependencies
RUN pip3 install PyYAML

#copy the application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint script is executable
entrypoint ["/entrypoint.sh"]
