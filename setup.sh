echo "setting minikube...(1/4)"
echo -n "0% "
minikube delete > /dev/null 2>&1
echo -n "============"
minikube start --driver=docker > /dev/null 2>&1
echo -n "================="
eval $(minikube docker-env) > /dev/null 2>&1
echo -n "=======> 100%"
echo " "
echo "building images...(2/4)"
echo -n "0% ====="
docker build -t i_nginx srcs/nginx > /dev/null 2>&1
echo -n "====="
docker build -t i_wordpress srcs/wordpress > /dev/null 2>&1
echo -n "===="
docker build -t i_mysql srcs/mysql > /dev/null 2>&1
echo -n "===="
docker build -t i_phpmyadmin srcs/phpmyadmin > /dev/null 2>&1
echo -n "====="
docker build -t i_ftps srcs/ftps > /dev/null 2>&1
echo -n "===="
docker build -t i_grafana srcs/grafana > /dev/null 2>&1
echo -n "===="
docker build -t i_influxdb srcs/influxdb > /dev/null 2>&1
echo -n "=====> 100%"
echo " "
echo "applying manifests...(3/4)"
echo -n "0% "
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml > /dev/null 2>&1
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml > /dev/null 2>&1
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null 2>&1
echo -n "===="
kubectl apply -f srcs/metallb.yaml > /dev/null 2>&1
echo -n "===="
kubectl apply -f srcs/nginx.yaml > /dev/null 2>&1
echo -n "===="
kubectl apply -f srcs/mysql.yaml > /dev/null 2>&1
echo -n "==="
kubectl apply -f srcs/ftps.yaml > /dev/null 2>&1
echo -n "==="
kubectl apply -f srcs/phpmyadmin.yaml > /dev/null 2>&1
echo -n "===="
kubectl apply -f srcs/influxdb.yaml > /dev/null 2>&1
echo -n "===="
kubectl apply -f srcs/grafana.yaml > /dev/null 2>&1
echo -n "===="
sleep 15
kubectl apply -f srcs/wordpress.yaml > /dev/null 2>&1
echo -n "===="
sleep 15
echo -n "==> 100%"
echo " "
echo "opening dashboard...(4/4)"
minikube dashboard > /dev/null 2>&1