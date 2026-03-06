# # Terraform Beginners Track - terraform-aws-vpc

## Prerequisites

- Any Code Editor (Visual Studio Code or Atom etc) 
- AWS Subscription. 

- Hashicorp Terraform installed and added to the PATH
- A local AWS Secret profile or If you are running this on EC2 instance then Instance Role must have necessary access to create Network resources
- Select the module and its corresponding dependent module which you want to build in main.tf file.

  The standard Terraform workflow follows a specific sequence. Think of it as Init → Plan → Apply.'

### 1. Initialize the Directory : terraform init 
 Creates a .terraform folder and downloads the necessary code to talk to your cloud provider (AWS, Azure, etc.). It also initializes your state file.

### 2. Validate (Optional) : terraform validate
Checks your code for internal consistency and syntax errors.

### 3. Create an Execution Plan : terraform plan
shows you what Terraform is going to do before it actually does it.

### 4. Apply the Changes : terraform apply
actually creates, updates, or deletes infrastructure based on your Terraform configuration.

![Uploading ScreenRecording2026-03-02160051-ezgif.com-video-to-gif-converter.gif…]()

