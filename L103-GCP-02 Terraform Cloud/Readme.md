# L103-GCP-02

## Terraform Cloud

Log into your Terraform account

    https://app.terraform.io/

## Terminal

In VS Code, open a terminal, log using your Terraform Cloud credentials

    terraform login

## New workspace

Create a new CLI based workspace.

Locate the config code section

In the **main.tf** file, replacing the organization and workspace names.

Init the workspace

    terraform init

## Service account key file

To be able to use the service account key values, we need to strip the newline characters from the file.

On Linux/Mac, use this command

    cat key.json | tr -s '\n' ' '

If you use Powershell, use this command

    (Get-Content 'key.json') -join ' ' | Set-Content 'key2.json'

Let's add the variables in the Terraform Cloud workspace.

    project_id = [the project ID]
    region = us-central1
    zone = us-central1-c

Copy the content of the stripped JSON to this variable

    credentials = [the stripped JSON key] (Mark as sensitive)

## Save the file and validate

    terraform validate

## Deploy

    terraform apply

## Let's see what was generated

Click on the **Runs tab**, you should see your first run.

## Cleanup

Let's now delete the droplet by typing

    terraform destroy

Delete the workspace by clicking on the **Settings tab** and on the **Delete from Terraform Cloud** button.

