# L101-GCP-03 Providers

**Note: All the L101-GCP-[*] labs are part of a sequence and build upon each other.**

## Create a new Terraform file

Create a new folder.

Create a new file and name it **main.tf**

## Find the GCP provider settings

Head to https://registry.terraform.io

Locate the GCP provider and click on the **Use Provider** button.

!
Copy the code and paste it in the main.tf file.

## Edit the code

Get your GCP project ID using

    gcloud projects list

Replace this block

    provider "google" {
      # Configuration options
    }

With this and replace the **<PROJECT_ID>** placeholder with your project ID.

    provider "google" {
        credentials = file("<NAME>.json")

        project = "<PROJECT_ID>"
        region  = "us-central1"
        zone    = "us-central1-c"
    }

Save the file

## Create a service account and a key

Locate the **IAM and admin service** and select **Service accounts**.

Click the **Create Service Account** link at the top of the screen.

Name the account, click **Create and Continue**.

Usually, you would grant granual rights to a service account but for the sake of time, we will use the quick and easy way granting our service account the Editor role.. In the **Quick Access** list, select **Basic** and then the **Editor** role.

Leave the 3rd step blank and click on **Done**.

Click on the **Keys** tab and create a new Json key.

The key will be downloaded as a JSON file. Locate the file and copy it in the lab folder.

Edit the main.tf file, replace the **<NAME>** placeholder with your file's name.

    credentials = file("<NAME>.json")

Save the file.

## Init the folder

    terraform init

You should see some new files and folders being created in the working folder.

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-GCP-05 Validate/Format

**Note: All the L101-GCP-[*] labs are part of a sequence and build upon each other.**

## Let's try the fmt command

Change the position of these two lines a little bit so that they are no longer aligned. Note that the version number can differ, that's OK. Save the file.

    source = "hashicorp/google"
    version = "4.19.0"

Run the fmt command

    terraform fmt

The lines should be aligned correctly now.

## Let's validate

Run the validate command

    terraform validate

All is good.  Let's change this line

    source = "hashicorp/google"

to this by changing the source parameter to **sources**. Save the file.

    sources = "hashicorp/google"

Run validate again

    terraform validate

There's an error now.  Remove the extra character and save the file.

## Create a VM

Add the following code to create a VM.

    resource "google_compute_instance" "vm_instance" {
    name         = "terraform-instance"
    machine_type = "f1-micro"

    boot_disk {
        initialize_params {
        image = "debian-cloud/debian-9"
        }
    }

    network_interface {
        network = "default"
        access_config {
        }
    }
    }

Run the validate command

    terraform validate

All is good.  Remove this mandatory parameter or use a **#** to comment the line out. Save the file.

    name = "terraform-instance"

Run the validate command

    terraform validate

There's an error!  Replace the name parameter, save the file and validate again.

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-GCP-07 Plan

**Note: All the L101-GCP-[*] labs are part of a sequence and build upon each other.**

## Let's create a plan

Run the plan command

    terraform plan

Save a plan by typing

    terraform plan -out=myplan

The plan has been saved to the **myplan** file.

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-GCP-09 Apply

**Note: All the L101-GCP-[*] labs are part of a sequence and build upon each other.**

## Let's create the project

    terraform apply

Head to the portal and validate that the VM was created or check using the CLI

    gcloud compute instances list

Let's make a change by adding 2 tags. Add this after the network_interface block in main.tf.

    tags = ["foo", "bar"]

Format and validate

    terraform fmt
    terraform validate

Check what will Terraform do

    terraform plan

The resource will be updated, not replaced. Good! Let's deploy the change.

    terraform apply

Check that the change was correctly applied

    gcloud compute instances describe terraform-instance

List the objects in the Terraform state

    terraform state list

There's only one and it's the project.  Copy it's name and show it.

    terraform state show [name]

Inspect the state file by clicking on the terraform.state file.

Let's see what happens if we can change the name parameter. Simply add 2 at then of the name.

    name = "terraform-instance2"

Check what will Terraform do

    terraform plan

Humm, this is a breaking change. Revert to the previous name by removing the 2.

    name = "terraform-instance"

Let's now delete the VM by typing

    terraform destroy

Let's check

    gcloud compute instances list

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-GCP-11 Variables

**Note: All the L101-GCP-[*] labs are part of a sequence and build upon each other.**

## Let's now use variables

Edit the main.tf file by creating a local variable for the vm name.

    locals {
      vm_name = "k8slab"
    }

Now get the name from the variable

    name     = local.vm_name

## Create 2 new files: **variables.tf** and **terraform.tfvars**

Edit the **variables.tf** file to declare 2 variables. Note that vm_zone does not have a default value.

    variable "vm_region" {
      type = string
      default = "us-central1"
      description = "The region"
    }
    
    variable "vm_zone" {
      type = string
      description = "The zone"
    }

## Edit the **terraform.tfvars** file 

Add these values

    vm_region = "us-central1"
    vm_zone = "us-central1-c"

## Edit the **main.tf** file 

Use the newly created variables

    region  = var.vm_region
    zone    = var.vm_zone

## Let's validate, plan and deploy

The plan outpout should display the values we used as variables

    terraform validate
    terraform plan

Deploy

    terraform apply

Let's check

    gcloud compute instances list

Let's now delete the project by typing

    terraform destroy

Let's check

    gcloud compute instances list

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-GCP-13 Workspaces

**Note: All the L101-GCP-[*] labs are part of a sequence and build upon each other.**

Do we have a workspace already?

    terraform workspace list

Of course, it's the default one.

Let's deploy a project

    terraform apply
    terraform state list
    terraform state show []

## New workspace

Let's create a new workspace

    terraform workspace new dev
    terraform workspace list

Change the project name to something different, and deploy

    vm_name = "k8slab2"
    terraform apply

Check the state file

    terraform state list
    terraform state show []

Let's destroy this project

    terraform destroy

## Switch back to the default workspace

    terraform workspace select default

But we still share the main.tf file between all workspaces!

Change the name back and delete the dev workspace.

    vm_name = "k8slab"
    terraform workspace delete dev
    terraform workspace list
    terraform destroy

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-GCP-15 Modules

**Note: All the L101-GCP-[*] labs are part of a sequence and build upon each other.**

## The Naming module

Let's use a module from the Terraform registry. It's a module that helps with the naming or resources and we'll use it to generate a unique name for our project.  You can look at the documentation here: https://registry.terraform.io/modules/Azure/naming/azurerm/latest

In the **main.tf** file, add the module using the following code. We'll prefix the generated names with the **lab** string.

    module "naming" {
      source = "Azure/naming/azurerm"
      prefix = ["lab"]
    }

Next, replace the project name parameter line with this one:

    name     = module.naming.app_service.name_unique

Save the file and let's create a plan.  We have an error!  We first need to run init to download the module.

    terraform init
    terraform plan
    terraform apply

Let's see what was generated

    gcloud compute instances list

Let's now delete the project by typing

    terraform destroy

Let's check

    gcloud compute instances list

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-GCP-16 Output variables

**Note: All the L101-GCP-[*] labs are part of a sequence and build upon each other.**

## Create a new file

Create a new file named **output.tf**

## Edit the **output.tf** file

Add the following output variables

    output "vm_name" {
      value = google_compute_instance.vm_instance.name
    }

    output "vm_tags" {
      value = google_compute_instance.vm_instance.tags
    }

    output "vm_ip" {
      value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
    }

## Validate and deploy

    terraform validate
    terraform apply

You should see the output values

## Destroy

Let's now delete the project by typing

    terraform destroy

Let's check

    gcloud compute instances list

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-GCP-17 HCL Language

**Note: All the L101-GCP-[*] labs are part of a sequence and build upon each other.**

Let's create 3 droplets by using a for_each loop.

## Cleanup main.tf

Edit the **main.tf** file and remove everything except the terraform and provider blocks.

    resource "google_compute_instance" "vm_instance" {
      for_each = toset( ["demo1", "demo2", "demo3"] )
      name     = each.key

Edit the **output.tf** file replacing the content with this one

    output "vm_name" {
        value =  {
        for k, vm in google_compute_instance.vm_instance : k => vm.name
        }
    }

    output "vm_tags" {
        value =  {
        for k, vm in google_compute_instance.vm_instance : k => vm.tags
        }
    }

    output "vm_ip" {
        value =  {
        for k, vm in google_compute_instance.vm_instance : k => vm.network_interface.0.access_config.0.nat_ip
        }
    }

Generate a plan and deploy

    terraform plan
    terraform apply

Let's see what was generated

     gcloud compute instances list

Let's now delete the project by typing

    terraform destroy

Let's check

     gcloud compute instances list

## Cleanup

Keep the service account key file for the next labs.