# Build an image starting with the python 3.7 image
FROM python:3.7-alpine

# Set the working directory to /code
WORKDIR /code

# Set environmnet variable used by flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Install gcc and other dependencies
RUN apk add --no-cache gcc musl-dev linux-headers

# Copy the requirements and install the dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Add metadatato the image to describe that the container is listening on port 5000
EXPOSE 5000

# Copy the current directory . in the project to the working directory . in the image
COPY . .

# Set the default command for container to flask run
CMD ["flask", "run"]
