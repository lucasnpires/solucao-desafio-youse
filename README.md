# Youse DevOps Challenge SRE - Solução

## Problema 1

<br/>

## Pré-requisitos:
- Ter uma conta na AWS
- Recuperar access_key e secret_key na AWS para as credenciais do terraform
- Salvar no arquivo /opt/terraform/credentials/aws/dev_credentials.tfvars da sua máquina as credenciais:

``` bash
access_key = "XXXXXXXXXXXXXXXXXXXXX"
secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXX"
```

<br/>
<br/>

## Etapas para provisionamento dos recursos

<br/>

### Comandos terraform para iniciar a construção do bucket de relatório diário:

``` terraform
cd terraform/s3-youse-reports-diarios

terraform init -var-file=/opt/terraform/credentials/aws/dev_credentials.tfvars

terraform plan -var-file=/opt/terraform/credentials/aws/dev_credentials.tfvars

terraform apply -var-file=/opt/terraform/credentials/aws/dev_credentials.tfvars --auto-approve

terraform destroy -var-file=/opt/terraform/credentials/aws/dev_credentials.tfvars --auto-approve

```

<br/>

### Comandos terraform para iniciar a construção do bucket de relatório semanal:

``` terraform
cd terraform/s3-youse-reports-semanais

terraform init -var-file=/opt/terraform/credentials/aws/dev_credentials.tfvars

terraform plan -var-file=/opt/terraform/credentials/aws/dev_credentials.tfvars

terraform apply -var-file=/opt/terraform/credentials/aws/dev_credentials.tfvars --auto-approve

terraform destroy -var-file=/opt/terraform/credentials/aws/dev_credentials.tfvars --auto-approve

```

<br/>

### Comandos terraform para iniciar a construção do bucket de relatório mensal:

``` terraform
cd terraform/s3-youse-reports-mensais

terraform init -var-file=/opt/terraform/credentials/aws/dev_credentials.tfvars

terraform plan -var-file=/opt/terraform/credentials/aws/dev_credentials.tfvars

terraform apply -var-file=/opt/terraform/credentials/aws/dev_credentials.tfvars --auto-approve

terraform destroy -var-file=/opt/terraform/credentials/aws/dev_credentials.tfvars --auto-approve

```
<br/>

## Problema 2

<br/>

## Pré-requisitos:
- Helm na versão 3.x ou mais;
- Cluster Kubernetes Gerenciado provisionado (no meu estudo de caso AKS);
- Cluster limpo de qualquer instalação do istio, independente da versão;
- Estar logado como administrador no cluster do Kubernetes;
- Client (istioctl) e pacote de instação do istio na versão 1.8.1;
- kubectl em uma versão atualizada;


### Instalando as dependências de Chart localmente
```bash
helm dependency update ./helm/Charts/app/
```
<br/>

### Instalando o microservice via helm
```bash
helm upgrade --install microservice ./helm/Charts/app/ --wait --set image=lucasnp1990/microservice-java --set version=0.0.1 --namespace microservice-java --create-namespace --wait --debug --atomic --cleanup-on-fail
```