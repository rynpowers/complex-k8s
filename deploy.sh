docker build -t rynpowers/complex-client:latest -t rynpowers/complex-client:$SHA  -f ./client/Dockerfile ./client
docker build -t rynpowers/complex-server:latest -t rynpowers/complex-server:$SHA  -f ./server/Dockerfile ./server
docker build -t rynpowers/complex-worker:latest -t rynpowers/complex-worker:$SHA  -f ./worker/Dockerfile ./worker
docker push rynpowers/complex-client:latest
docker push rynpowers/complex-client:$SHA
docker push rynpowers/complex-server:latest
docker push rynpowers/complex-server:$SHA
docker push rynpowers/complex-worker:latest
docker push rynpowers/complex-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment server=rynpowers/complex-client:$SHA
kubectl set image deployments/server-deployment server=rynpowers/complex-server:$SHA
kubectl set image deployments/worker-deployment server=rynpowers/complex-worker:$SHA
