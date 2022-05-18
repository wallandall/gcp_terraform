# GCP Deployment with Terraform

This project deploys infrastrucutre to Google Cloud Platform using Terraform. To run this solution clone this project and perform the following steps:

## Install Terraform:
Detailed documentation can be fownd on the [Terraform Site](https://www.terraform.io/downloads) for your respective operating system.

## Install GCP SDK
To interact with the Google Cloud Platform you need to [Install the GCP SDK](https://cloud.google.com/sdk/docs/install)

## Create a new Project for your solution
A GCP Project is a workspace that will be used to manage GCP Services, more information can be found [here](https://developers.google.com/workspace/guides/create-project)

## Create a service account
A service account will be used to interact with with the GCP API to manage resources defined in your Terraform Configuration. Steps to create a service account can be found [here](https://cloud.google.com/docs/authentication/production#create-service-account-console).

**! To ensure the project runs correcty** , ensure the certificate is accessible to the solution and correctly refferenced. eg:
![image](img/cert.png)

## Enable cloud resource manager API
Cloud Resource Manager is the API that allows you to manage resources in GCP, similar to Azure Resource Manager in Microsoft Azure or Cloud Formation in AWS. The following API's need to be enabled:
1. Cloud Resource Manager API
2. Cloud Compute Engine API
3. Cloud Storage API

More information on Cloud Resource Manger can be found [here](https://cloud.google.com/endpoints/docs/openapi/enable-api)

## Setup Terraform Remote State
Remote state writes state data to cloud storage instead of storing it locally in the ```terraform.tfstate```. 
1. In this project we will be storing our state in a GCP Bucket. Documentation on creating a bucket can be found [here](https://cloud.google.com/storage/docs/creating-buckets)
2. Create a folder in the newly created bucket called terraform

**! Please note**  bucket names need to be globaly unique, please update the configuration file to reflect your ```Bucket``` and ```Folder``` names.

## Update Configuration File
To ensure the solution runs correctly ensure you update the below values in the main.tf to reflect your environment:
1. credentials: This needs to point to the certificate you downloaded when creating the service account.
2. project: The project name should reflect the project you created.
3. region: Update the region to your location
4. zone: Update the zone to your current zone
5. bucket: A GCP bucket requires a globaly unique name and this value should reflect the name of your bucket
6. prefix: The prefex needs to be changed to the name of the folder you created in your bucket, eg terraform

## Build the Solution
### Terraform Init
From you project folder run ```terraform init``` this will initialise your project and download the resources defined in your configuration file.

If your solution is correctly configured, you will get the below output:
![image](img/init.png)

**!** If you make changes to the configuration file, you will need to run ```terraform init --reconfigure```

### Terraform Plan
From the project folder run ```terraform plan``` this will output the execution plan for your infrastrucutre as defined in your configuration files.

### Terraform Apply
Before applying the changes confirm the infrastrucutre is correctly defined by reviewing the output of ```terraform plan```. If it is correct, run ```terraform apply```


### Terraform Destry
Run ```terraform destroy``` to delete any resources created by Terraform