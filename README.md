 #check that the file based on our secret’s name is available inside our Pods

kubectl exec -it $(kubectl get pods | awk '/test-csi-setup/{print $1}' | head -1) -- cat /mnt/secrets-store/creds; echo