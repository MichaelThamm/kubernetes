# Docker Desktop
* For local testing Docker Desktop is being used to spin up a single host cluster

# Nomenclature
* kubectl - Interact with cluster Api server via CLI.
  * Used with Docker Desktop, Minikube, cloud clusters, ... widely compatible.
## Master Node
* Api server - Interect/manage cluster using CLI, UI, API, ...
  * Can also be a gatekeeper for authentication.
* Scheduler - On a cluster request the scheduler determines which worker node is suitable for the resource requirements.
* Controller manager - Detects pod state changes on worker nodes e.g. pod dies. Will request scheduler to restart pods.
* etcd - Key value store i.e. cluster brain. Stores all the state data of the worker nodes.
  * Application data is not stored in etcd, only kubernetes date.
## Worker Node
* Kubelet - Executes the request from the master node's scheduler to provision the pod.
* Kube Proxy - Forward requests from services to pods e.g. app to database will likely forward to database on same node to avoid networking overhead.
* Container runtime - Docker, Ubuntu, ... compatible OS.

# Commands
* kubectl get nodes/deployment/pods --all-namespaces
* kubectl create/edit/delete deployment <deployment_name>
  * once edited, run kubectl get pods to check the high-availability
* kubectl logs <pod_name>
* kubectl get services

# Deployments
## Website
## MySQL
[kubernetes-mysql](https://phoenixnap.com/kb/kubernetes-mysql)