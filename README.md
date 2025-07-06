# cloud-ecommerce-jfc-solution-iac
Infraestructura como Código (IaC) para la solución eCommerce de JFC, utilizando Terraform para provisionar componentes clave en AWS como redes, bases de datos, caché, y más.

## Estructura del Proyecto
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
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── .gitignore
└── README.md


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
git clone https://github.com/<TU-USUARIO>/cloud-ecommerce-jfc-solution-iac.git
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