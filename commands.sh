#docs https://argo-cd.readthedocs.io/en/stable/user-guide/commands/argocd_app_create/

#-----------login
argocd login localhost:8080 --insecure
argocd login loadbalancer-ip:443 --insecure
argocd login loadbalancer-ip:443 

#-----------create application
argocd app list 

# Create a directory app
argocd app create guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path guestbook --dest-namespace default --dest-server https://kubernetes.default.svc --directory-recurse

# Create a Jsonnet app
argocd app create jsonnet-guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path jsonnet-guestbook --dest-namespace default --dest-server https://kubernetes.default.svc --jsonnet-ext-str replicas=2

# Create a Helm app
argocd app create helm-guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path helm-guestbook --dest-namespace default --dest-server https://kubernetes.default.svc --helm-set replicaCount=2

# Create a Helm app from a Helm repo
argocd app create nginx-ingress --repo https://charts.helm.sh/stable --helm-chart nginx-ingress --revision 1.24.3 --dest-namespace default --dest-server https://kubernetes.default.svc

# Create a Kustomize app
argocd app create kustomize-guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path kustomize-guestbook --dest-namespace default --dest-server https://kubernetes.default.svc --kustomize-image gcr.io/heptio-images/ks-guestbook-demo:0.1

# Create a app using a custom tool:
argocd app create kasane --repo https://github.com/argoproj/argocd-example-apps.git --path plugins/kasane --dest-namespace default --dest-server https://kubernetes.default.svc --config-management-plugin kasane

#-------------argocd sync
argocd app sync app2

#-------------argocd create JWT Token for roles
argocd proj role create-token PROJECT ROLE-NAME

#-------------argocd projects
kubectl get appproject -n argocd

#----------------delete app with token
argocd app delete guestbook-helm --auth-token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhcmdvY2QiLCJzdWIiOiJwcm9qOnByb2plY3Qtd2l0aC1yb2xlOmNpLXJvbGUiLCJuYmYiOjE3MTExODI2NTksImlhdCI6MTcxMTE4MjY1OSwianRpIjoiZGU0NzI2OGEtNDE4Yi00YTBlLThkOTEtY2UzNGM0ZjU2MTU3In0.z0PnjuTN2jRTb0RpQ3P2d_Zr1OmLacHJ22cDc0EvA6U