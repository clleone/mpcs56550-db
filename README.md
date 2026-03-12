## Database for ECommerce App

This repository houses all code and configuration files related to the Postgres
database used by my ecommerce application.

### Requirements


### Directory Structure
```text
|   .env
|   .gitignore
|   Dockerfile.jenkins
|   init.sql
|   Jenkinsfile
|   README.md
|
+---k8s
|   \---database
|       +---dev
|       |       configmap.yaml
|       |       deployment.yaml
|       |       init-configmap.yaml
|       |       persistent-volume-claim.yaml
|       |       persistent-volume.yaml
|       |       secret.yaml
|       |       service.yaml
|       |
|       +---prod
|       |       configmap.yaml
|       |       deployment.yaml
|       |       init-configmap.yaml
|       |       persistent-volume-claim.yaml
|       |       persistent-volume.yaml
|       |       secret.yaml
|       |       service.yaml
|       |
|       \---staging
|               configmap.yaml
|               deployment.yaml
|               init-configmap.yaml
|               persistent-volume-claim.yaml
|               persistent-volume.yaml
|               secret.yaml
|               service.yaml
|
+---miscellaneous-documentation
|       design-choices.md
|       example-jenkins-output.txt
|
\---security-scans
        trivy-database.txt
        trivy-frontend.txt
        trivy-frontend2.txt
        trivy-frontend3.txt
        trivy-orders.txt
        trivy-products.txt
```
### Instructions to build and run database locally:
```bash
# Clone the repo
git clone https://github.com/yourusername/mpcs56550-db
cd mpcs56550-db

# Copy environment template and fill in values
cp .env.example .env

# Start the database
docker compose up database
```

PostgreSQL will be available at localhost:5432

### Testing:
```bash
# Run manually
docker run --rm \
  -v $(pwd)/init.sql:/init.sql \
  postgres:15 \
  psql -f /init.sql -c "SELECT COUNT(*) FROM products;" --no-password
```

### Docker
```bash
# Start just the database
docker compose up database

# Start the full stack
docker compose up --build
```

### GitFlow Overview:
- **Main** - This branch stores the official release history. All commits here are 
tagged with a version number. *Main is a protected branch and requires a pull
request to merge.*
- **Develop** - This branch contains the complete history of the project and serves
as an integration branch for features. *Develop is a protected branch and
requires a pull request to merge.*
- **Feature** - Feature branches are split off of the latest Develop branch to build
new features. Once complete, they are merged back into Develop.
- **Release** - Once a certain amount of features have been completed, a Release
branch is split off Develop. Once this branch is created, no new features are
added, only tidying up existing ones. Once complete, it is merged into Main and
tagged with a version number. It is then also merged into Develop.
- **Hotfix** - These branches exist to quickly patch production releases. They are
the only branches split directly off Main. Once a fix is completed, it is merged
into Main with a new version number and then Develop. (in some cases it might be
merged into a Release branch)

Citation: [Atlassian](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)