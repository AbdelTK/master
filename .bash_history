sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter
sudo tee /etc/sysctl.d/kubernetes.conf <<EOT
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOT

sudo sysctl --system
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates
sudo apt update
sudo apt install -y curl gnupg software-properties-common apt ca-certificates
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y containerd.io
containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml
sudo systemctl restart containerd
sudo systemctl enable containerd
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo kubeadm init
kubectl get nodes
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.0/manifests/calico.yaml
sudo apt-get install procps
watch -n 1 kubectl get all -A
kubectl get pods
kubectl get all -A
kubectl describe pod/calico-node-4tlql
watch -n 1 kubectl get all -A
kubectl get nodes
watch -n 1 kubectl get all -A
git clone https://github.com/AbdelTK/elk.git
ls
kubectl apply -f elk/.
watch -n 1 kubectl get all -A
kubectl get pods -n default
kubectl expose deployment kibana --type=NodePort --name=kibana-service
kubectl get svc kibana-service
kubectl get svc kibana-service -o wide -n default
watch -n 1 kubectl get all -A
kubectl get all -A
watch -n 1 kubectl get all -A
kubectl get pods
kubectl describe pod/elasticsearch-779bd75d45-cjqqv
kubectl get pods
kubectl describe pod/elasticsearch-779bd75d45-v7xmf
watch -n 1 kubectl get all -A
kubectl get svc kibana-service -o wide -n default
watch -n 1 kubectl get all -A
kubectl get svc elastic-service -o wide -n default
watch -n 1 kubectl get all -A
kubectl get pods
kubectl delete pod/elasticsearch-779bd75d45-v7xmf
kubectl get pods
watch -n 1 kubectl get all -A
kubectl get all -A
kubectl get nodes
kubectl get pods
watch -n 1 kubectl get all -A
kubectl get all -A
kubectl get nodes
kubectl get svc kibana-service -o wide -n default
helm repo list
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh 
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install zookeeper bitnami/zookeeper
helm install kafka bitnami/kafka
watch -n 1 kubectl get all -A
helm install kafka bitnami/kafka -f values.yaml
cd elk/
helm install kafka bitnami/kafka -f values.yaml
nano values.yml
helm install kafka bitnami/kafka -f values.yaml
helm install kafka bitnami/kafka -f values.yml
ls
rm values.yml 
helm install kafka bitnami/kafka -f values.yml
nano values.yaml
helm install kafka bitnami/kafka -f values.yaml
mv values.yaml Value.yml
ls
helm install kafka bitnami/kafka -f Value.yml
ls -lh
ls -al
rm -r .git/
helm install kafka bitnami/kafka -f Value.yml
helm install kafkaa bitnami/kafka -f Value.yml
watch -n 1 kubectl get all -A
helm install kafka bitnami/kafka -f Value.yml
helm install kafkaa bitnami/kafka -f Value.yml
watch -n 1 kubectl get all -A
kubectl gte pods
kubectl get pods
kubectl delete pod/elasticsearch-779bd75d45-nz5k7
kubectl get all -A
kubectl describe pod kafka-controller-0 -n default
kubectl describe pod zookeeper-0 -n default
kubectl get all -A
kubectl describe pod zookeeper-0 -n default
kubectl get pvc -n default
kubectl get pv
kubectl apply -f kafka-pv.yml
kubectl get pv
kubectl get pvc -n default
kubectl apply -f kafka-pvc.yml
kubectl delete pvc data-kafka-controller-0
kubectl delete pvc data-kafka-controller-1
kubectl delete pvc data-kafka-controller-2
kubectl delete pvc data-zookeeper-0
kubectl apply -f kafka-pvc.yaml
kubectl apply -f kafka-pvc.yml
nano storage-class.yml
kubectl apply -f storage-class.yml
kubectl delete pvc data-kafka-controller-0
kubectl delete pvc data-kafka-controller-1
kubectl delete pvc data-kafka-controller-2
kubectl delete pvc data-zookeeper-0
watch -n 1 kubectl get all -A
kubectl apply -f PersistentVolume.yml 
kubectl delete pvc data-kafka-controller-0
kubectl delete pvc data-kafka-controller-1
kubectl delete pvc data-kafka-controller-2
kubectl delete pvc data-zookeeper-0
kubectl apply -f PersistentVolumeClaim.yml 
kubectl delete pvc data-kafka-controller-0
kubectl delete pvc data-kafka-controller-1
kubectl delete pvc data-kafka-controller-2
kubectl delete pvc data-zookeeper-0
kubectl apply -f PersistentVolumeClaim.yml 
kubectl apply -f kfk-pvc.yml 
kubectl delete persistentvolumeclaims data-kafka-controller-0 data-kafka-controller-1 data-kafka-controller-2 data-zookeeper-0
kubectl apply -f kfk-pvc.yml 
watch -1 -n kubectl get all -A
watch -n 1 kubectl get all -A
kubectl describe pod/kafka-controller-0
kubectl get all -A
kubectl delete service/kafka 
kubectl delete service/kafkaa-controller-headless
kubectl get all -A
watch -n 1 kubectl get all -A
kubectl get all -A
kubectl apply -f kfk-pvc.yml 
kubectl apply f kafka-pv.yml 
kubectl apply -f kafka-pv.yml 
kubectl apply -f Value.yml 
kubectl get all -A
kubectl get deployments,pods,services,persistentvolumeclaims,configmaps,secrets --namespace default
kubectl get all -A
kubectl delete statefulset.apps/kafka-controller 
kubectl get all -A
kubectl delete statefulset.apps/kafkaa-controller 
kubectl delete statefulset.apps/zookeeper
kubectl get all -A
kubectl delete service/kafkaa
kubectl delete service/kafka-controller-headless
kubectl delete service/zookeeper
kubectl delete service/zookeeper-headless 
kubectl get all -A
kubectl get pods
kubectl get all -A
kubectl get pods
kubectl delete pod/elasticsearch-779bd75d45-7l7m9
kubectl get pods
kubectl describe pod/elasticsearch-779bd75d45-xr9cl
kubectl get all -A
watch -n 1 kubectl get all -A
kubectl get nodes --show-labels
kubectl apply -f elastic-deployment.yml 
kubeadm token create --print-join-command
kubectl get nodes
kubectl apply -f elastic-deployment.yml 
watch -n 1 kubectl get all -A
kubectl apply -f kibana-deployment.yml 
kubectl apply -f logstash-deployment.yml 
watch -n 1 kubectl get all -A
kubectl describe  pod/elasticsearch-7d7cd8cfd6-64gt6  
watch -n 1 kubectl get all -A
kubectl apply -f elastic-deployment.yml 
watch -n 1 kubectl get all -A
kubectl get pods
kubectl delete pod/elasticsearch-7df89f7b67-tfhbb
kubectl delete pod/elasticsearch-7d7cd8cfd6-64gt6
watch -n 1 kubectl get all -A
kubectl get pods
kubectl delete pod/elasticsearch-7df89f7b67-rc22b 
kubectl get pods
watch -n 1 kubectl get all -A
kubectl describe pod/elasticsearch-7df89f7b67-4s8b2
kubectl apply -f elastic-deployment.yml 
watch -n 1 kubectl get all -A
kubectl describe pod/elasticsearch-5b78559789-4lk9h 
watch -n 1 kubectl get all -A
kubectl describe pod/elasticsearch-5b78559789-4lk9h 
kubectl get pods
kubectl kogs elasticsearch-5b78559789-4lk9h
kubectl logs elasticsearch-5b78559789-4lk9h
kubectl logs -p elasticsearch-5b78559789-4lk9h
kubectl apply -f elastic-deployment.yml 
watch -n 1 kubectl get all -A
kubectl logs -p elasticsearch-54b99d9dd8-9mdfj
kubectl get pods
kubectl logs -p elasticsearch-54b99d9dd8-9mdfj
kubectl logs elasticsearch-54b99d9dd8-9mdfj
kubectl get all 
kubectl logs -p elasticsearch-54b99d9dd8-9mdfj
watch -n 1 kubectl get all -A
kubectl describe pod/elasticsearch-54b99d9dd8-9mdfj 
kubectl logs -p pod/elasticsearch-54b99d9dd8-9mdfj 
kubectl logs -p elasticsearch-54b99d9dd8-9mdfj 
sudo chown -R 1000:1000 /var/lib/elasticsearch/
sudo chown -R 1000:1000 /var/lib/elasticsearch/data
watch -n 1 kubectl get all -A
kubectl get pods
kubectl delete pod/elasticsearch-54b99d9dd8-9mdfj
kubectl get pods
kubectl logs -p elasticsearch-54b99d9dd8-cqgdf
watch -n 1 kubectl get all -A
kubectl exec -it elasticsearch-54b99d9dd8-9mdfj -- /bin/bash
kubectl get pods
kubectl exec -it elasticsearch-54b99d9dd8-cqgdf -- /bin/bash
kubectl logs -p elasticsearch-54b99d9dd8-cqgdf
kubectl logs -p kibana-5db48b8974-v7q7j 
kubectl get pods
kubectl logs -p logstash-754f99bccd-kcgqr
kubectl logs logstash-754f99bccd-kcgqr
kubectl get pods
kubectl logs elasticsearch-54b99d9dd8-cqgdf
kubectl exec -it elasticsearch-54b99d9dd8-cqgdf -- /bin/bash
kubectl get nodes
kubectl get pods
kubectl logs kibana-5db48b8974-v7q7j
kubectl get pods
kubectl logs elasticsearch-54b99d9dd8-cqgdf
kubectl get pods
kubectl logs -f elasticsearch-54b99d9dd8-cqgdf
kubectl logs -l app=elasticsearch
kubectl logs -f -n elasticsearch-54b99d9dd8-cqgdf
kubectl logs -f -n elasticsearch-54b99d9dd8-cqgdf -l app=elasticsearch
kubectl logs -f -n default -l app=elasticsearch
kubectl apply -f elastic-deployment.yml 
kubectl get pods
kubectl logs elasticsearch-5b78559789-6qsbk
kubectl logs -f  elasticsearch-5b78559789-6qsbk
kubectl logs -f elasticsearch-5b78559789-6qsbk
ls -l /usr/share/elasticsearch/data/nodes
kubectl describe pod elasticsearch-5b78559789-6qsbk
kubectl exec -it elasticsearch-5b78559789-6qsbk -- /bin/bash
cd /usr/share/
ls
cd /var/lib/cd s cd cd
cd /var/lib/
ls
cd
cd /mnt/data/
cd /mnt/
ls
cd
kubectl apply -f PersistenVolume.yml
cd elk/
kubectl apply -f PersistentVolume.yml 
cd mnt/
cd /mnt/
ls
cd
cd elk/
watch -n 1 kubectl get all -A
kubectl apply -f elastic-deployment.yml 
watch -n 1 kubectl get all -A
kubectl get pods
kubectl logs -f elasticsearch-5cc569c84-hlrdc
kubectl describe pod/elasticsearch-5cc569c84-hlrdc
kubectl apply -f elastic-deployment.yml 
watch -n 1 kubectl get all -A
kubectl get pods
kubectl logs -f elasticsearch-5b78559789-ch7rl
kubectl describe pod/elasticsearch-5b78559789-ch7rl
kubectl logs -f elas-c elasticsearch elasticsearch-5b78559789-ch7rl
sudo apt update
watch -n 1 kubectl get all -A
cd elk/
kubectl apply -f ingress.yml 
watch -n 1 kubectl get all -A
cd ConfigMap/
cd ../Deployment/
kubectl apply -f elastic-deployment.yml 
cd ../ConfigMap/
kubectl apply -f elastic-configmap.yml 
cd ..
watch -n 1 kubectl get all -A
cd Deployment/
kubectl apply -f elastic-deployment.yml 
cd
cd elk/
watch -n 1 kubectl get all -A
cd Deployment/
kubectl apply -f elastic-deployment.yml 
cd ..
watch -n 1 kubectl get all -A
kubectl describe  pod/elasticsearch-77c5d6b84-w796j 
kubectl get pods
kubectl describe  pod/elasticsearch-77c5d6b84-w796j 
kubectl get pods
kubectl logs pod/elasticsearch-77c5d6b84-w796j -c elasticsearch
cd ConfigMap/
kubectl apply -f elastic-configmap.yml 
cd ../Deployment/
kubectl apply -f elastic-deployment.yml 
cd ..
watch -n 1 kubectl get all -A
kubectl describe pod/elasticsearch-7cd49565f-94ktc
watch -n 1 kubectl get all -A
cd Deployment/
kubectl apply -f elastic-deployment.yml 
cd ..
watch -n 1 kubectl get all -A
cd Deployment/
kubectl apply -f elastic-deployment.yml 
cd ../ConfigMap/
kubectl apply -f elastic-configmap.yml 
cd ..
watch -n 1 kubectl get all -A
curl -X GET "http://34.230.62.120:9200/_cluster/health?pretty"
kubectl get pods
kubectl get pod elasticsearch-d5978c8cc-hgls4 -o jsonpath='{.status.podIP}'
curl -X GET "http://192.168.188.76:9200/_cluster/health?pretty"
cd ConfigMap/
kubectl apply -f elastic-configmap.yml 
cd ..
watch -n 1 kubectl get all -A
kubectl get pods
kubectl delete pod/elasticsearch-d5978c8cc-hgls4
watch -n 1 kubectl get all -A
kubectl apply -f role.yaml
ls
kubectl apply -f role.yml
kubectl apply -f rolebinding.yml
kubectl get roles
kubectl get rolebndings
kubectl get rolebindings
cd ConfigMap/
kubectl apply -f elastic-configmap.yml 
cd ..
watch -n 1 kubectl get all -A
kubectl get pods
kubectl delete pod/elasticsearch-d5978c8cc-z7xzk
watch -n 1 kubectl get all -A
kubectl logs dependency-failure-pod -f
kubectl describe pod/elasticsearch-d5978c8cc-z7xzk
kubectl get pods
kubectl describe pod/elasticsearch-d5978c8cc-p6694
watch -n 1 kubectl get all -A
cd Services/
kubectl apply -f elastic-service.yml 
cd ..
kubectl apply -f elasticsearch-statfulset.yml 
kubectl get statefulsets
kubectl get pods -l app=elasticsearch
kubectl get pods
kubectl delete pod/elasticsearch-d5978c8cc-p6694
watch -n 1 kubectl get all -A
kubectl apply -f elasticsearch-statfulset.yml 
kubectl describe svc elasticsearch
kubectl apply -f elasticsearch-statfulset.yml 
kubectl delete svc elasticsearch
kubectl apply -f elasticsearch-statfulset.yml 
watch -n 1 kubectl get all -A
kubectl get all -
kubectl get all -A
watch -n 1 kubectl get all -A
cd Services/
kubectl apply -f elastic-service.yml 
cd ..
kubectl apply -f elasticsearch-statfulset.yml 
watch -n 1 kubectl get all -A
kubectl get all -A
kubectl delete replicaset.apps/elasticsearch-54b99d9dd8
kubectl delete replicaset.apps/elasticsearch-5b78559789
kubectl delete replicaset.apps/elasticsearch-5cc569c84
kubectl delete replicaset.apps/elasticsearch-779bd75d45 
kubectl delete replicaset.apps/elasticsearch-77c5d6b84
kubectl delete replicaset.apps/elasticsearch-797c5ff7cc 
kubectl delete replicaset.apps/elasticsearch-7cd49565f
kubectl delete replicaset.apps/elasticsearch-7d7cd8cfd6
kubectl delete replicaset.apps/elasticsearch-7df89f7b67
kubectl delete replicaset.apps/logstash-c8c4d64dc *
kubectl delete replicaset.apps/logstash-c8c4d64dc 
kubectl delete replicaset.apps/kibana-85947d5ddd 
kubectl get all -A
kubectl describe pod/es-cluster-0
kubectl apply -f redis.yml 
watch -n 1 kubectl get all -A
kubectl get all -A
cd Services/
kubectl apply -f elastic-service.yml 
cd ../ConfigMap/
kubectl apply -f kibana-configmap.yml 
cd ..
kubectl apply -f elasticsearch-statfulset.yml 
helm repo add elastic https://helm.elastic.co
helm install my-elasticsearch elastic/elasticsearch --version 7.13.4
helm repo update
helm install my-elasticsearch elastic/elasticsearch --version 7.13.4
kubectl apply -f elastic-statefulset.yml 
kubectl rollout status sts/es-cluster --namespace=default
kubectl create -f kube-logging.yaml
nano kube-logging.yaml
kubectl create -f kube-logging.yaml
kubectl get namespaces
cd Services/
nano elasticsearch_svc.yaml
kubectl create -f elasticsearch_svc.yaml
cd ..
kubectl get services --namespace=kube-logging
nano elasticsearch_statefulset.yaml
kubectl create -f elasticsearch_statefulset.yaml
kubectl rollout status sts/es-cluster --namespace=kube-logging
watch -n 1 kubectl get all -A
kubectl ge pods
kubectl get pods
kubectl delete pod/elasticsearch-0
kubectl delete pod/logstash-754f99bccd-kcgqr
watch -n 1 kubectl get all -A
kubectl get pods
kubectl delete pod/elasticsearch-2  
kubectl delete pod/elasticsearch-1
kubectl delete pod/elasticsearch-0
kubectl get pods
watch -n 1 kubectl get all -A
kubectl get all -A
kubectl delete statefulset.apps/elasticsearch
kubectl delete statefulset.apps/es-cluster
kubectl get all -A
kubectl delete statefulset.apps/es-cluster
kubectl delete statefulset.apps/es-cluster -n kube-logging
kubectl get all -A
cd elk/
cd Services/
cd ..
kubectl apply -f elastic-statefulset.yml 
cd Services/
kubectl apply -f elasticsearch_svc.yaml 
cd ../ConfigMap/
kubectl apply -f elastic-configmap.yml 
cd ..
kubectl apply -f Secret.yml 
watch -n 1 kubectl get all -A
kubectl get pods
kubectl delete pod/elasticsearch-d5978c8cc-b7qgh
watch -n 1 kubectl get all -A
kubectl get all -A
kubectl describe pod/elasticsearch-0  
kubectl get all -A
kubectl describe statefulset.apps/elasticsearch
kubectl apply -f Secret.yml 
kubectl get all -A
kubectl describe statefulset.apps/elasticsearch
kubectl apply -f storage-class.yml 
kubectl apply -f Str-class.yml 
kubectl apply -f elastic-statefulset.yml 
kubectl apply -f Str-class.yml 
kubectl apply -f elastic-statefulset.yml 
kubectl apply -f elastic-statefulset.yml
kubectl apply -f statefulset-elastic.yml 
kubectl get all -A
kubectl delete statefulset.apps/elasticsearch
kubectl apply -f statefulset-elastic.yml 
watch -n 1 kubectl get all -A
kubectl get all -A
kubectl get pvc
kubectl get pods -l app=elasticsearch
kubectl describe pod/elasticsearch-0   
kubectl get pvc
kubectl delete pvc data-es-cluster-0 data-kafka-controller-0 data-kafka-controller-1 data-kafka-controller-2 data-kafkaa-controller-0  data-zookeeper-0 
kubectl get pvc
kubectl delete pvc data-elasticsearch-0
kubectl get pvc
kubectl delete statefulset elasticsearch
kubectl get all -A
kubectl delete deployment.apps/elasticsearch
kubectl get all -A
kubectl apply -f Statefulset_elastic.yml 
kubectl get statefulset elasticsearch
kubectl get all -A
watch -n 1 kubectl get all -A
kubectl get all -A
kubectl describe statefulset.apps/elasticsearch
kubectl get all -A
kubectl describe statefulset.apps/elasticsearch
kubectl logs pod/elasticsearch-0  
kubectl logs elasticsearch-0  
kubectl logs -f elasticsearch-0  
kubectl logs -p elasticsearch-0  
kubectl get pods -l app=elasticsearch
kubectl describe pod/elasticsearch-0
kubectl get pvc
kubectl describe elasticsearch-pvc
kubectl describe pvc elasticsearch-pvc
kubectl describe pvc data-elasticsearch-0
kubectl get pv
kubectl get pvc
kubectl delete pv kafka-pv-0 kafka-pv-1 kafka-pv-2 pv-kafka-0 pv-kafka-1  pv-kafka-2  pv-zookeeper-0  zookeeper-pv-0
kubectl get pv
kubectl get pvc
cd PV-PVC/
kubectl apply -f PersistentVolume.yml 
cd ..
kubectl get pv
kubectl get pvc
cd PV-PVC/
kubectl edit pvc elasticsearch-pvc
kubectl apply -f PersistentVolumeClaim.yml 
cd ..
kubectl get pv
kubectl get pvc
kubectl get all -A
kubectl describe pod/elasticsearch-0 
kubectl get pv
kubectl get pvc
kubectl apply -f Str-class.yml 
kubectl apply -f str-class.yml 
ls
cd PV-PVC/
kubectl apply -f str-class.yml 
kubectl apply -f PersistentVolume.yml 
kubectl apply -f PersistentVolumeClaim.yml 
kubectl delete pvc elasticsearch-pvc
kubectl apply -f PersistentVolumeClaim.yml 
cd ..
kubectl get pv
kubectl get pvc
kubectl apply -f Statefulset_elastic.yml 
kubectl delete Statefulset_elastic.yml 
kubectl get all -A
kubectl delete statefulset.apps/elasticsearch 
kubectl apply -f Statefulset_elastic.yml 
kubectl get pv
kubectl get pvc
ls
kubectl apply -f Statefulset_elastic.yml 
kubectl get pvc
kubectl get all -A
kubectl get pv
kubectl get pvc
kubectl delete statefulset.apps/elasticsearch
kubectl delete pvc data-elasticsearch-0
kubectl delete pvc elasticsearch-pvc
ls
rm Statefulset_elastic.yml 
rm kube-logging.yaml 
cd PV-PVC/
ls
rm str-class.yml 
rm PersistentVolumeClaim.yml 
cd ..
kubectl apply -f new-str-class.yaml
ls
kubectl apply -f new-str-class.yml 
cd PV-PVC/
kubectl apply -f elastic-pvc.yaml
ls
cd ..
ls
kubectl apply -f new-str-class.yml 
ls
nano storage_class.yml
kubectl apply -f storage_class.yml 
kubectl get pv
kubectl get pvc
cd PV-PVC/
kubectl apply -f pvc-elastic.yml 
kubectl get pvc
kubectl get pv
kubectl delete storageclass new-str-class
kubectl get pv
kubectl get storageclass
kubectl delete storageclass str-class
kubectl get storageclass
kubectl get pv
kubectl apply -f PersistentVolume.yml 
kubectl get pv
kubectl get pvc
kubectl apply -f pvc-elastic.yml 
kubectl apply -f local-storageclass.yml 
kubectl get ovc
kubectl get pvc
kubectl get pv
kubectl get storageclass
kubectl get all -
kubectl get all -A
kubectl create ns elk
kubectl apply -f elasticsearch-pv.yml
kubectl get pv
kubectl get pvc --namespace=elk
kubectl get StorageClass --namespace=metrics
helm repo list
helm repo update
helm install elasticsearch elastic/elasticsearch --namespace elk -f values.yml
kubectl get pods --namespace=elk -l app=elasticsearch-master -w
kubectl describe pods elasticsearch-master-0 --namespace=elk
kubectl get pods --namespace=elk -l app=elasticsearch-master
kubectl describe pods elasticsearch-master-0 --namespace=elk
kubectl get pvc --namespace=elk
kubectl get pods --namespace=elk -l app=elasticsearch-master
kubectl describe ingress elasticsearch-master --namespace=elk
kubectl get nodes
kubectl apply -f PersistentVolume.yml 
kubectl get pv
kubectl get pvc
kubectl get storageclass
kubectl get pv
kubectl get pvc
kubectl get pods
kubectl get all -n default
cd ..
kubectl apply -f es-sts.yml 
kubectl get all -A
kubectl describe statefulset.apps/elasticsearch
kubectl get all -A
kubectl describe pod/elasticsearch-0 
kubectl apply -f es-sts.yml 
kubectl describe pod/elasticsearch-0 
kubectl describe statefulset.apps/elasticsearch
kubectl describe pod/elasticsearch-0 
kubectl get all -A
kubectl get pv
kubectl get pvc
kubectl get pvc,pv
kubectl get pvc,pv -o wide
kubectl get pods,pvc,pv,ns -o wide
kubectl delete -f PV-PVC/PersistentVolume.yml 
kubectl get pods,pvc,pv,ns -o wide
kubectl apply -f PV-PVC/PersistentVolume.yml 
kubectl get sc -o wide
kubectl delete -f es-sts.yml 
kubectl apply -f es-sts.yml 
kubectl get pods,pvc,pv,ns -o wide
kubectl get pods,pvc,pv -o wide
kubectl describe pvc elk-pv-claim-elasticsearch-0
kubectl delete -f es-sts.yml 
kubectl get pods,pvc,pv -o wide
kubectl apply -f es-sts.yml 
kubectl get pods,pvc,pv -o wide
kubectl describe pvc es-storage--elasticsearch-0
kubectl describe pvc es-storage-elasticsearch-0
kubectl get sc
kubectl describe sc local-storage
kubectl apply -f PV-PVC/PersistentVolume.yml 
kubectl get pods,pvc,pv -o wide
kubectl delete -f PV-PVC/PersistentVolume.yml 
kubectl apply -f PV-PVC/PersistentVolume.yml 
kubectl get pods,pvc,pv -o wide
kubectl apply -f es-sts.yml 
kubectl delete -f es-sts.yml 
kubectl apply -f es-sts.yml 
kubectl get pods,pvc,pv -o wide
kubectl describe elasticsearch-0
kubectl describe pod elasticsearch-0
kubectl get node
kubectl get pod -o wide
kubectl delete -f es-sts.yml 
kubectl apply -f es-sts.yml 
kubectl get pod -o wide
watch kubectl get pod -o wide
kubectl delete -f es-sts.yml 
kubectl apply -f es-sts.yml 
kubectl describe pod elasticsearch-0
kubectl delete -f es-sts.yml 
kubectl apply -f es-sts.yml 
kubectl  delete PV-PVC/PersistentVolume.yml 
kubectl  delete -f PV-PVC/PersistentVolume.yml 
kubectl apply -f PV-PVC/PersistentVolume.yml 
kubectl apply -f es-sts.yml 
kubectl get pod,pv,pvc -o wide
kubectl get pod,pvc,pv -o wide
kubectl delete -f es-sts.yml 
kubectl get pod,pvc,pv -o wide
kubectl apply -f es-sts.yml 
kubectl get pod,pvc,pv -o wide
kubectl describe pod elasticsearch-0
kubectl get all -A
kubectl get all
sudo apt update
sudo apt install nfs-common
sudo apt install nfs-kernel-server
sudo mkdir /var/nfs/general -p
ls -la /var/nfs/general
sudo chown nobody:nogroup /var/nfs/general
sudo nano /etc/exports 
sudo systemctl restart nfs-kernel-server
sudo ufw allow from 54.196.44.187 to any port nfs
sudo ufw allow from 35.173.235.41 to any port nfs
sudo ufw allow from 54.224.75.207 to any port nfs
sudo mkdir -p /nfs/general
sudo mount <nfs-server-ip>:/var/nfs/general /nfs/general
sudo mount 54.196.44.187:/var/nfs/general /nfs/general
df -h
sudo touch /nfs/general/general.test
ls -l /nfs/general/general.test
sudo nano /etc/fstab 
helm repo list
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm repo update
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server=54.196.44.187 --set nfs.path=/var/nfs/general
ls
cd elk/
kubectl delete PV-PVC/PersistentVolume.yml 
kubectl delete -f es-sts.yml 
kubectl apply -f es-sts.yml 
kubectl get all -A
kubectl apply -f es-sts.yml 
kubectl get pvc
kubectl apply -f PV-PVC/pvc-nfs.yml 
kubectl get pvc
sudo touch /nfs/general/test.test
ls -l
cd
cd /nfs/
cd general/
ls
cd
sudo nano /etc/exports
sudo umount /nfs
sudo cat /etc/exports
sudo exportfs -r
sudo umount /nfs/general
sudo mount /nfs/general
ls -ld /var/nfs
sudo chmod 755 /var/nfs
ls -l /nfs/general/general.test
sudo touch /nfs/general/check.test
ls -l /nfs/general/
kubectl get all -A
ls -l /nfs/general/
sudo chmod 755 /var/nfs/check.test
sudo chmod 755 /var/nfs
ls -l /nfs/general/
kubectl get pv
kubectl get pvc
kubectl get pv
kubectl get pvc
sudo nano /etc/exports 
exportfs --help
exportfs
sudo exportfs
mkdir -p /nfs/test
sudo mkdir -p /nfs/test
sudo mount 35.173.235.41@/var/nfs/general /nfs/test/
df -h
ls -lh /nfs/general/
sudo mount 35.173.235.41:/var/nfs/general /nfs/test/
ls -lh /nfs/test
clear
ls
helm list -A
helm delete nfs-subdir-external-provisioner
kubectl get all
kubectl get all -A
clear
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm repo update
helm show values nfs-subdir-external-provisioner/nfs-subdir-external-provisioner > values-nfs.yaml
vi values-nfs.yaml 
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner -f values-nfs.yaml 
watch kubectl get all
watch kubectl get pvc
watch kubectl get pv
kubectl get sc
kubectl create pers
kubectl create -h
clear
vi test-nfs.yaml
kubectl get sc
vi test-nfs.yaml
kubectl apply -f test-nfs.yaml 
kubectl get pvc
kubectl get pv
kubectl get pvc
kubectl describe pod www-web-0
kubectl describe pvc www-web-0
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl describe pvc www-web-0
kubectl apply -f test-nfs.yaml 
kubectl describe pvc www-web-0
kubectl get pvc
helm list repo
helm list A
helm list -A
helm delete nfs-subdir-external-provisioner
kubectl get pvc
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner ~-f values-nfs.yaml 
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner -f values-nfs.yaml 
kubectl get pvc
kubectl get pv
kubectl get pvc
kubectl get all -A
cd elk/
kubectl delete -f es-sts.yml 
kubectl apply -f es-sts.yml 
kubectl get pvc
ls
kubectl get all -A
kubectl delete statefulset.apps/web
kubectl get all -A
kubectl describe statefulset.apps/elasticsearch
kubectl apply -f PV-PVC/pvc-nfs.yml 
kubectl get all -A
kubectl delete statefulset.apps/elasticsearch
kubectl apply -f es-sts.yml 
kubectl get all -A
kubectl describe statefulset.apps/elasticsearch
kubectl get all
watch kubectl get all -A
kubectl get all -A
kubectl describe pod/nfs-subdir-external-provisioner-586bf4c877-z24n6
udo systemctl start nfs-utils.service 
sudo systemctl start nfs-server
kubectl get all -A
watch kubectl get all -A
kubectl get all -A
kubectl delete pod/nfs-subdir-external-provisioner-586bf4c877-z24n6
kubectl get all -A
watch kubectl get all -A
kubectl describe pod/nfs-subdir-external-provisioner-586bf4c877-zw55p
watch kubectl get all -A
kubectl get pv
kubectl get pvc
kubectl get pvc,pv,pods
watch kubectl get all -A
kubectl describe pod/nfs-subdir-external-provisioner-586bf4c877-zw55p
ping 35.173.235.41
sudo nano /etc/exports 
kubectl get pods
kubectl delete pod/nfs-subdir-external-provisioner-586bf4c877-zw55p
watch kubectl get all -A
sudo exportfs -rav
watch kubectl get all -A
kubectl delete pod/nfs-subdir-external-provisioner-586bf4c877-j4sxj
watch kubectl get all -A
kubectl describe pod/nfs-subdir-external-provisioner-586bf4c877-mjl7c
watch kubectl get all -A
kubectl delete -f values-nfs.yaml 
kubectl apply -f values-nfs.yaml 
watch kubectl get all -A
cd elk/
kubectl delete pod/nfs-subdir-external-provisioner-586bf4c877-mjl7c
watch kubectl get all -A
sudo systemctl restart nfs-server
watch kubectl get all -A
kubectl delete pod/nfs-subdir-external-provisioner-586bf4c877-5rjhd
watch kubectl get all -A
kubectl delete  pod/nfs-subdir-external-provisioner-586bf4c877-ckcdq
watch kubectl get all -A
kubectl get all -A
kubectl delete statefulset.apps/elasticsearch
kubectl delete service/elasticsearch
kubectl get all -A
kubectl delete service/elasticsearch -n kube-logging
kubectl get all -A
ls
cd
kubectl apply -f test-nfs.yaml 
kubectl get all -A
watch kubectl get all -A
kubectl describe pod/es-cluster-0 
watch kubectl get all -A
kubectl get all -A
kubectl describe replicaset.apps/nfs-subdir-external-provisioner-586bf4c877 
kubectl get all -A
kubectl describe pod/nfs-subdir-external-provisioner-586bf4c877-5c2x9
ping 35.173.235.41
cat ifconfig.me
ipddr a
sudo nano /etc/exports 
sudo systemctl restart nfs-kernel-server
sudo ufw allow from 54.81.192.235 to any port nfs
sudo ufw allow from 3.91.89.208 to any port nfs
kubectl get pods
kubectl delete pod/nfs-subdir-external-provisioner-586bf4c877-5c2x9
watch kubectl get all -A
sudo mount -t nfs 54.81.192.235:/var/nfs/general /mnt
sudo exportfs -ra
watch kubectl get all -A
kubectl delete pod/nfs-subdir-external-provisioner-586bf4c877-xwp6p
watch kubectl get all -A
kubectl describe pod/nfs-subdir-external-provisioner-586bf4c877-95jjb
sudo mount 54.81.192.235:/var/nfs/general /nfs/general
dh -f
df -h
watch kubectl get all -A
kubectl delete pod/nfs-subdir-external-provisioner-586bf4c877-95jjb
watch kubectl get all -A
kubectl describe pod/nfs-subdir-external-provisioner-586bf4c877-qxf6q
kubectl edit deployment nfs-subdir-external-provisioner
kubectl get deployment nfs-subdir-external-provisioner -o yaml
kubectl edit deployment nfs-subdir-external-provisioner
kubectl get deployment nfs-subdir-external-provisioner -o yaml
watch kubectl get all -A
kubectl get all -A
kubectl get pods
kubectl describe pod/es-cluster-1 
kubectl delete pod/es-cluster-1 pod/es-cluster-0 pod/es-cluster-2  
watch kubectl get all -A
kubectl get all -A
watch kubectl get all -A
kubectl get all -A
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
watch kubectl get all -A
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl describe pod/es-cluster-0
kubectl logs es-cluster-0 -c elasticsearch
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl describe pod/es-cluster-2  
kubectl get all -A
kubectl delete replicaset.apps/nfs-subdir-external-provisioner-586bf4c877 
kubectl delete replicaset.apps/nfs-subdir-external-provisioner-5f94dd85f7
kubectl get all -A
kubectl describe pod/kibana-5db48b8974-zghjh
kubectl describe service/kibana-service
kubectl describe service/kibana
kubectl get all -A
kubectl describe  deployment.apps/kibana
netstat -ant
sudo apt install net-tools
netstat -ant
watch kubectl get all 6a
watch kubectl get all -A
sudo nano /etc/exports 
sudo nano /etc/fstab 
kubectl edit deployment nfs-subdir-external-provisioner
watch kubectl get all -A
kubectl describe pod/es-cluster-0
watch kubectl get all -A
kubectl get pods
watch kubectl get all -A
kubectl describe pod/nfs-subdir-external-provisioner-77996768f6-67v8f
sudo mount 54.196.61.159:/var/nfs/general /nfs/general
df -h
watch kubectl get all -A
kubectl describe pod/nfs-subdir-external-provisioner-77996768f6-67v8f
kubectl delete pod/nfs-subdir-external-provisioner-77996768f6-67v8f
watch kubectl get all -A
kubectl describe pod/nfs-subdir-external-provisioner-77996768f6-ptn4b 
watch kubectl get all -A
kubectl delete pod/es-cluster-0
watch kubectl get all -A
kubectl delete pod/es-cluster-0
watch kubectl get all -A
kubectl delete pod/es-cluster-1
watch kubectl get all -A
kubectl describe pod/nfs-subdir-external-provisioner-77996768f6-ptn4b
sudo ufw allow from 54.196.61.159 to any port nfs
watch kubectl get all -A
sudo ufw allow from 54.85.68.234 to any port nfs
watch kubectl get all -A
kubectl delete pod/nfs-subdir-external-provisioner-77996768f6-ptn4b
watch kubectl get all -A
kubectl  describe pod/es-cluster-2     
kubectl edit deployment nfs-subdir-external-provisioner
watch kubectl get all -A
kubectl delete pod/es-cluster-2
kubectl delete pod/es-cluster-0
watch kubectl get all -A
cd elk/
ls
kubectl delete -f es-sts.yml 
kubectl apply -f es-sts.yml 
watch kubectl get all -A
kubectl describe pod/es-cluster-0
kubectl edit deployment nfs-subdir-external-provisioner
watch kubectl get all -A
kubectl delete -f es-sts.yml 
kubectl apply -f es-sts.yml 
watch kubectl get all -A
kubectl describe pod/es-cluster-0
kubectl delete pod/es-cluster-0
watch kubectl get all -A
kubectl delete pod/es-cluster-0
watch kubectl get all -A
kubectl describe pod/es-cluster-0
sudo exportfs -rav
watch kubectl get all -A
kubectl describe pod/es-cluster-0
watch kubectl get all -A
kubectl delete pod/es-cluster-0
watch kubectl get all -A
kubectl describe pod/es-cluster-0
kubectl delete -f es-sts.yml 
kubectl apply -f es-sts.yml 
watch kubectl get all -A
kubectl delete pod/es-cluster-0
watch kubectl get all -A
kubectl describe pod/es-cluster-0
kubectl get pv
kubectl edit pv pvc-dd14b14d-0221-4123-a33c-5e0ab352c463
kubectl get pods
kubectl delete -f es-sts.yml 
kubectl edit pv pvc-dd14b14d-0221-4123-a33c-5e0ab352c463
sudo nano pvc-dd14b14d-0221-4123-a33c-5e0ab352c463
kubectl apply -f es-sts.yml 
watch kubectl get pods
kubectl describe es-cluster-0 
kubectl describe pod/es-cluster-0 
kubectl get pv
kubectl edit pv pvc-dd14b14d-0221-4123-a33c-5e0ab352c463
kubectl get pv pvc-dd14b14d-0221-4123-a33c-5e0ab352c463 -o yaml > pv-config.yaml
nano pv-config.yaml
kubectl apply -f pv-config.yaml
kubectl delete pv pvc-dd14b14d-0221-4123-a33c-5e0ab352c463
kubectl get pv
kubectl apply -f pv-config.yaml
kubectl patch pv pvc-dd14b14d-0221-4123-a33c-5e0ab352c463 -p '{"metadata":{"finalizers":null}}'
kubectl get pv
kubectl apply -f pv-config.yaml
kubectl get pv
kubectl get pod
kubectl delete pod/es-cluster-0
watch kubectl get all -A
kubectl get pv pvc-dd14b14d-0221-4123-a33c-5e0ab352c463 -o yaml > pv-config-1.yaml
sudo nano pvc-b7f4aa65-e21e-48c1-98b0-75cdc51d3439
watch kubectl get all -A
kubectl get pv pvc-b7f4aa65-e21e-48c1-98b0-75cdc51d3439 -o yaml > pv-config-1.yaml
sudo nano pvc-b7f4aa65-e21e-48c1-98b0-75cdc51d3439
nano pv-config-1.yaml
kubectl patch pv pvc-b7f4aa65-e21e-48c1-98b0-75cdc51d3439 -p '{"metadata":{"finalizers":null}}'
kubectl get pods
kubectl delete pod/es-cluster-1
watch kubectl get all -A
kubectl describe pod/es-cluster-1
watch kubectl get all -A
kubectl describe pod/es-cluster-1
ls
nano pv-config-1.yaml 
kubectl delete pod/es-cluster-1
watch kubectl get all -A
kubectl describe pod/es-cluster-1  
kubectl get pv
kubectl get pv pvc-b7f4aa65-e21e-48c1-98b0-75cdc51d3439 -o yaml > pvconfig.yaml
nano pvconfig.yaml 
kubectl get pods
kubectl delete pod/es-cluster-1
watch kubectl get all -A
kubectl patch pv pvc-b7f4aa65-e21e-48c1-98b0-75cdc51d3439 -p '{"metadata":{"finalizers":null}}'
watch kubectl get all -A
kubectl delete pod/es-cluster-1
watch kubectl get all -A
kubectl get pods
kubectl logs kibana-5db48b8974-zghjh
kubectl logs -p kibana-5db48b8974-zghjh
kubectl logs kibana-5db48b8974-zghjh -f
kubectl get pods
kubectl logs kibana
kubectl logs -n kibana
kubectl logs -n default kibana
watch kubectl get all -A
kubectl get all -A
kubectl logs kibana-5db48b8974-zghjh --previous
kubectl logs kibana-5db48b8974-zghjh --timestamps
kubectl logs kibana-5db48b8974-zghjh | grep "ERROR"
kubectl logs kibana-5db48b8974-zghjh -n default
kubectl logs kibana-5db48b8974-zghjh -n default -f
kubectl get pods
kubectl delete pod/kibana-5db48b8974-zghjh
kubectl get pods
kubectl logs kibana-5db48b8974-cdfzg
watch kubectl logs kibana-5db48b8974-cdfzg
watch kubectl logs -f  kibana-5db48b8974-cdfzg
kubectl logs -f  kibana-5db48b8974-cdfzg
cd Deployment/
kubectl delete -f kibana-deployment.yml 
kubectl apply -f kibana-deployment.yml 
cd ..
watch kubectl get all -A
kubectl edit deployment nfs-subdir-external-provisioner
Dispose d’un menu contextuel
watch kubectl get all -A
kubectl describe pod/es-cluster-1
kubectl get pods
kubectl delete pod/es-cluster-1 pod/es-cluster-0
watch kubectl get all -A
ls
cd elk/
kubectl delete -f es-sts.yml 
kubectl apply -f es-sts.yml 
watch kubectl get all -A
kubectl delete pod/pod/es-cluster-0
kubectl get pods
kubectl delete pod/es-cluster-0
watch kubectl get all -A
kubectl get all -A
kubectl describe pod/es-cluster-0
watch kubectl get all -A
kubectl delete -f es-sts.yml 
watch kubectl get all -A
kubectl describe pod/es-cluster-0
kubectl delete pod/es-cluster-0
watch kubectl get all -A
kubectl logs -f pod/es-cluster-0
kubectl logs es-cluster-0
kubectl logs es-cluster-0 -c elasticsearch
kubectl logs es-cluster-0 -c elasticsearch --previous
sudo mount 18.234.229.203:/var/nfs/general /nfs/general
df -h
watch kubectl get all -A
sudo ufw allow from 18.234.229.203 to any port nfs
sudo ufw allow from 18.232.114.171 to any port nfs
kubectl get pods
kubectl delete -f es-sts.yml 
ls
kubectl apply -f es-sts.yml 
kubectl get pods
kubectl delete pod/es-cluster-0  
watch kubectl get all -A
kubectl delete -f es-sts.yml 
kubectl apply -f es-sts.yml 
watch kubectl get all -A
kubectl delete pod/es-cluster-0
watch kubectl get all -A
kubectl describe pod/es-cluster-0
watch kubectl get all -A
kubectl get all -A
kubectl describe statefulset.apps/es-cluster 
kubectl get all -A
kubectl describe statefulset.apps/elasticsearch
kubectl get pods
kubectl delete pod es-cluster-0 --namespace default --force --grace-period=0
watch kubectl get all -A
kubectl delete -f es-sts.yml 
kubectl delete pod es-cluster-0 --namespace default --force --grace-period=0
watch kubectl get all -A
kubectl get all -A
kubectl delete statefulset.apps/es-cluster
kubectl apply -f es-sts.yml 
kubectl get all -A
watch kubectl get all -A
kubectl get all -A
kubectl delete statefulset.apps/elasticsearch 
cd
kubectl apply -f test-nfs.yaml 
watch kubectl get all -A
kubectl get all -A
kubectl describe statefulset.apps/es-cluster
kubectl logs statefulset.apps/es-cluster
kubectl delete statefulset.apps/es-cluster
watch kubectl get all -A
cd elk/
ls
kubectl apply -f es-sts.yml 
watch kubectl get all -A
kubectl get all -A
kubectl delete statefulset.apps/elasticsearch
ls
cd
kubectl apply -f test-nfs.yaml 
kubectl describe pod/es-cluster-0
sudo nano /etc/exports 
sudo nano /etc/fstab 
sudo exportfs -rav
kubectl delete pod/es-cluster-0
kubectl delete -f test-nfs.yaml 
kubectl delete pod/es-cluster-0
kubectl apply -f test-nfs.yaml 
cd elk/
kubectl apply -f es-sts.yml 
kubectl get all -A
kubectl decribe pod/es-cluster-0
kubectl describe pod/es-cluster-0
kubectl edit deployment nfs-subdir-external-provisioner
kubectl get deployment nfs-subdir-external-provisioner -o yaml
sudo mount 18.234.229.203:/var/nfs/general /nfs/general
sudo nano /etc/fstab 
sudo nano /etc/exports 
kubectl apply -f nfs-provisioner-deployment.yaml
ls
nano pv-config-1.yaml 
nano pv-config.yaml 
kubectl apply -f pv-config.yaml 
kubectl get all -A
kubectl delete statefulset.apps/elasticsearch statefulset.apps/es-cluster
kubectl apply -f pv-config.yaml 
kubectl apply -f pv-config-1.yaml 
kubectl get pvc
kubectl get pv
kubectl get pvc
kubectl get all -A
kubectl get pv
kubectl get pv pvc-dd14b14d-0221-4123-a33c-5e0ab352c4632d4h -o yaml > pv-latest.yaml
kubectl get pvc
kubectl get pv pvc-dd14b14d-0221-4123-a33c-5e0ab352c463 -o yaml > pv-latest.yaml
ls
nano pv-latest.yaml 
kubectl get pvc
kubectl get pv pvc-b7f4aa65-e21e-48c1-98b0-75cdc51d3439 -o yaml > pv-latest-1.yaml
sudo nano pv-latest-1.yaml 
kubectl apply -f pv-latest.yaml 
kubectl apply -f es-sts.yml 
kubectl get all -A
cd 
kubectl apply -f test-nfs.yaml 
cd elk/
kubectl describe pod/es-cluster-0
kubectl edit deployment nfs-subdir-external-provisioner
sudo nano /etc/fstab 
sudo nano /etc/exports 
sudo exportfs -rav
cd elk/
watch kubectl get all -A
kubectl get all -A
kubectl delete -f es-sts.yml 
cd 
kubectl delete -f test-nfs.yaml 
cd elk/
cd
kubectl apply -f values-nfs.yaml 
cd elk/
kubectl delete pod/es-cluster-0 
cd
kubectl apply -f test-nfs.yaml 
kubectl get all -A
kubectl delete -f statefulset.apps/es-cluster 
kubectl delete statefulset.apps/es-cluster 
cd elk/
kubectl apply -f es-sts.yml 
kubectl delete -f es-sts.yml 
cd
kubectl get nodes
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
cd elk/
kubectl describe  pod/es-cluster-0
kubectl delete -f test-nfs.yaml 
cd
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl get pv
kubectl get pvc
kubectl get all -A
kubectl get pvc
cd elk/
kubectl get pv pvc-dd14b14d-0221-4123-a33c-5e0ab352c463 -o yaml > pv-config.yml
nano pv-config.yml 
kubectl describe pod/es-cluster-0 
nano pv-config.yml 
kubectl delete pv pvc-dd14b14d-0221-4123-a33c-5e0ab352c463
kubectl apply -f pv-config.yml 
kubectl get pv pvc-dd14b14d-0221-4123-a33c-5e0ab352c463
kubectl delete pvc es-data-es-cluster-0
kubectl apply -f pv-config.yml
kubectl get pv pvc-dd14b14d-0221-4123-a33c-5e0ab352c463
nano pv-config.yml 
kubectl get pv
cd
kubectl delete -f test-nfs.yaml 
kubectl apply -f pv-config.yml
cd elk/
cd
kubectl apply -f pv-conf.yml 
kubectl apply -f test-nfs.yaml 
kubectl get pv
kubectldelete -f test-nfs.yaml 
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl get all -A
kubectl delete replicaset.apps/nfs-subdir-external-provisioner-77996768f6 replicaset.apps/nfs-subdir-external-provisioner-5964577d4c replicaset.apps/nfs-subdir-external-provisioner-57fc8c7dcc replicaset.apps/nfs-subdir-external-provisioner-5676444cc
kubectl get all -A
cd elk/
kubectl delete pod/es-cluster-0 
kubectl get pods
kubectl delete pod/es-cluster-0 
cd
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
sudo nano /etc/exports 
sudo nano /etc/fstab 
sudo exportfs -rav
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl delete -f test-nfs.yaml 
kubectl apply -f values-nfs.yaml 
kubectl apply -f values-nfs.yaml --validate=false
ls
kubectl delete -f values-nfs.yaml 
kubectl apply -f values-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl describe pod/es-cluster-0
kubectl logs pod/es-cluster-0
kubectl describe pod/es-cluster-0
kubectl get deployment nfs-subdir-external-provisioner -o yaml
kubectl describe pod/es-cluster-0
ls
nano pv-conf.yml 
kubectl get pv
kubectl get pv pvc-e43f2e9f-e4b3-4047-ab9f-41cc8e907d57 -o yaml > pv-backup.yaml
ls
kubectl delete pv pvc-e43f2e9f-e4b3-4047-ab9f-41cc8e907d57
kubectl get pv
nano pv-backup.yaml 
kubectl apply -f pv-backup.yaml
kubectl get pv pvc-e43f2e9f-e4b3-4047-ab9f-41cc8e907d57 -o yaml
nano pv-backup.yaml 
kubectl apply -f pv-backup.yaml 
kubectl delete pvc es-data-es-cluster-0
kubectl delete pv pvc-e43f2e9f-e4b3-4047-ab9f-41cc8e907d57
kubectl delete -f test-nfs.yaml 
kubectl apply -f pv-backup.yaml 
kubectl apply -f test-nfs.yaml 
ls
rm pv-conf.yml 
ls
kubectl delete -f test-nfs.yaml 
cd elk/Deployment/
kubectl rollout restart deployment/kibana
cd
kubectl apply -f test-nfs.yaml 
kubectl rollout restart deployment/kibana
kubectl rollout restart statefulset/es-cluster
kubectl logs deployment/kibana
kubectl rollout restart deployment/kibana
kubectl rollout restart statefulset/es-cluster
kubectl rollout restart deployment/kibana
kubectl rollout restart statefulset/es-cluster
kubectl rollout restart deployment/kibana
kubectl rollout restart statefulset/es-cluster
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl rollout restart deployment/kibana
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl rollout restart deployment/kibana
curl -u elastic:Hitm@n00 http://100.29.128.153:31084/api/status
curl -u http://100.29.128.153:31084/api/status
curl -u elastic:Hitm@n00 http://100.29.128.153:31084/api/status
kubectl logs deployment/kibana
kubectl rollout restart deployment/kibana
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl rollout restart deployment/kibana
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl rollout restart deployment/kibana
curl -u elastic:Hitm@n00 http://100.29.128.153:31084/api/status
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
cd elk/Deployment/
kubectl apply -f kibana-deployment.yml 
cd
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
bin/elasticsearch-setup-passwords interactive
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
cd elk/Deployment/
kubectl apply -f kibana-deployment.yml 
cd
kubectl rollout restart deployment/kibana
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
kubectl delete -f test-nfs.yaml 
kubectl apply -f test-nfs.yaml 
cd elk/Deployment/
kubectl apply -f kibana-deployment.yml 
cd
cd elk/Deployment/
kubectl apply -f kibana-deployment.yml 
cd
