# cloud-ecommerce-jfc-solution-iac
Infraestructura como Código (IaC) para la solución eCommerce de JFC, utilizando Terraform para provisionar automáticamente toda la infraestructura base en AWS mediante CodePipeline y CodeBuild.


## Estructura del Proyecto
```bash
cloud-ecommerce-jfc-solution-iac/
├── modules/ # Módulos reutilizables por componente
│ ├── vpc/
│ ├── rds/
│ ├── redis/
│ ├── dynamodb/
│ ├── s3/
│ ├── cloudwatch/
│ ├── cognito/
│ ├── kms/
│ ├── apigateway/
│ └── iam/
├── environments/
│ └── dev/
│ ├── backend.tf         # Configuración del backend remoto en S3
│ ├── main.tf            # Recursos y módulos principales
│ ├── variables.tf       # Definición de variables
│ ├── terraform.tfvars   # Valores para entorno dev
│ ├── outputs.tf         # Salidas exportadas
│ └── buildspec.yml      # Script usado por AWS CodeBuild
├── .gitignore
└── README.md
```

---

## ¿Qué incluye esta solución?

- Red VPC con subredes públicas/privadas
- RDS Aurora (cluster con lectura y escritura)
- Redis (Amazon ElastiCache)
- DynamoDB (para carritos de compra)
- S3 (para objetos estáticos)
- CloudWatch Logs y métricas
- Cognito (para autenticación de usuarios)
- KMS (para encriptación de datos sensibles)
- API Gateway
- IAM Roles mínimos para servicios

---

## Requisitos Previos

- Terraform ≥ 1.3
- AWS CLI configurado con permisos suficientes
- Cuenta de AWS activa
- Git instalado (para clonar el proyecto)

---

## Despliegue Rápido

1. **Clonar el repositorio**

```bash
git clone https://github.com/mnkyng/cloud-ecommerce-jfc-solution-iac.git
cd cloud-ecommerce-jfc-solution-iac/environments/dev
```

2. **Inicializar Terraform**

```bash
terraform init
Verificar el plan de ejecución
```

```bash
terraform plan
```

3. **Aplicar la infraestructura**

```bash
terraform apply
```

## Despliegue Automatizado con AWS CodePipeline
Esta solución está diseñada para desplegarse automáticamente en cada push al repositorio usando AWS CodePipeline + CodeBuild. El archivo buildspec.yml se encarga de ejecutar los comandos Terraform:

```bash
version: 0.2

phases:
  install:
    runtime-versions:
      terraform: 1.6
  build:
    commands:
      - terraform init
      - terraform validate
      - terraform plan -out=tfplan
      - terraform apply -auto-approve tfplan
```

## Configuración del Backend Remoto
```bash
terraform {
  backend "s3" {
    bucket         = "tfstate-jfc-dev"
    key            = "cloud-ecommerce-jfc/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```

## Flujo CI/CD
1. **Push al repositorio (GitHub)**

2. **CodePipeline detecta el cambio**

3. **Ejecuta CodeBuild con el buildspec.yml**

4. **Terraform aplica automáticamente los cambios de infraestructura**

## Enpoints
1. **Endpoint de RDS**

2. **Endpoint de Redis**

3. **Buckets y nombres de tablas**

4. **VPC ID, subnets, etc.**
