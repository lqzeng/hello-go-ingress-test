echo "STARTING SCRIPT"

echo $HOME 

echo "setting GOPATH"
export GOPATH = "/home/lucas/go"
echo $GOPATH

echo "setting .kube config"
kubectl --kubeconfig=~/.kube/config

echo "creating cluster"
kind create cluster --config=kind-ingress.yaml

echo "loading basic go hello docker image"
kind load docker-image hello-go

echo "applying nginx ingress"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

echo "applying ingress usage"
kubectl apply -f ingress-usage.yaml

echo "checking deployment"
kubectl get all

echo "checking apps are running"
localhost/foo
localhost/bar

echo "SCRIPT FINISHED"