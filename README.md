This project contains Terraform code for kubernetes cluster deployment in AWS cloud.

The pre-requiste are 

1- install [Terrafrom](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) <br />
2- install [AWS cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) <br />
3- install [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/) <br />

## Available Scripts

In the project directory, you can run:

### `terraform init`
The [command](https://developer.hashicorp.com/terraform/cli/commands/init) initialize the terraform project and install dependancies

### `terraform plan`

This [command](https://developer.hashicorp.com/terraform/tutorials/cli/plan?in=terraform%2Fcli) preview changes before applying. <br /> 

After running this command you will see that it creates 56 resource in your AWS cloud.

### `terraform apply`
The [command](https://developer.hashicorp.com/terraform/cli/commands/apply) command executes the actions proposed in a Terraform plan

Once it is deployed, run <br />
`aws eks --region $(terraform output -raw region) update-kubeconfig \` <br />
    `--name $(terraform output -raw cluster_name)`

command to configure `kubectl` command to communicate with your cluster 

Run the following commands 
```bash
kubectl apply -f deploy.yaml
kubectl apply -f ingress.yaml --namespace ingress-nginx
kubectl apply -f mongodb-secrets.yaml --namespace ingress-nginx
kubectl apply -f mongo-configmap.yaml --namespace ingress-nginx
kubectl apply -f mongodb-deployment.yaml --namespace ingress-nginx
kubectl apply -f mongo-express-deployment.yaml --namespace ingress-nginx
```


