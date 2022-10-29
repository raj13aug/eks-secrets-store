 #create secretsmanager using awscli
 
 aws --region us-east-1 secretsmanager create-secret --name creds1 --secret-string '{"username":"raj", "password":"csi-driver"}'
 
 #check that the file based on our secret’s name is available inside our Pods

kubectl exec -it $(kubectl get pods | awk '/test-csi-setup/{print $1}' | head -1) -- cat /mnt/secrets-store/creds; echo