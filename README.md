 #create secretsmanager using awscli
 
 aws --region us-east-1 secretsmanager create-secret --name creds --secret-string '{"username":"raj", "password":"csi-driver"}'
 
Verify the installation:

kubectl get daemonsets -n kube-system -l app=csi-secrets-store-provider-aws
kubectl get daemonsets -n kube-system -l app.kubernetes.io/instance=csi-secrets-store



 #check that the file based on our secret’s name is available inside our Pods

kubectl exec -it $(kubectl get pods | awk '/test-csi-setup/{print $1}' | head -1) -- cat /mnt/secrets-store/creds; echo