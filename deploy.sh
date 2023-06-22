docker stop wafer_calculator
docker rm wafer_calculator
docker build -t wafer_calculator-image . 
docker run -p 8501:80 -d --name wafer_calculator wafer_calculator-image 
