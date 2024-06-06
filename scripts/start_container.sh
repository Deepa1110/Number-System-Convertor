set -e

docker pull deepa14/number-system-convertor

docker run -d -p 5000:5000 deepa14/number-system-convertor