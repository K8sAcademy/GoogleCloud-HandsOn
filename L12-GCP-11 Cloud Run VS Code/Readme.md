
# L21-GCP-11

Deploy an express app to Cloud Run using VS Code.

## Command palette

Open the command palette.

Type Cloud Code and select the **Cloud Code: Deploy to Cloud Run** command.

## Settings

You can change the proposed service name if you want.

Since the app is listening on port 80, we need to change the **Container Port** setting from 8080 to 80.

## Deploy the app

Click on the **Deploy** button.

## Open the Cloud Run extension

Locate the Cloud Run extension. You should see the app you just deployed. Take a look at the properties.

## Test the app

You can get the URL from the instance properties list or you can right click on it and select **Open Container Image URL**.

## Clean up

Delete the service using the Console or the CLI.

    gcloud run services list
    gcloud run services delete [name]

Validate

    gcloud run services list 
