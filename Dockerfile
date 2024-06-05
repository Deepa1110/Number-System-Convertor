# Use an official GCC runtime as a parent image
FROM gcc:latest

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Compile the C program
RUN gcc -o number-system-convertor "Number System Convertor.c" -lpthread

# Run the binary program
CMD ["./number-system-convertor"]
