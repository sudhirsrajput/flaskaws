FROM google/cloud-sdk:latest

WORKDIR /app

COPY . /app

RUN apt update -y && \
    apt-get update && \
    apt-get install -y python3-venv ffmpeg libsm6 libxext6 && \
    python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip

# Set the virtual environment as the default for subsequent commands
ENV PATH="/opt/venv/bin:$PATH"

RUN apt-get install apt-transport-https ca-certificates gnupg -y && apt install python3 -y

RUN pip3 install torch --extra-index-url https://download.pytorch.org/whl/cpu && pip3 install -r requirements.txt

CMD ["python3", "app.py"]

