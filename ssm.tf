resource "aws_ssm_document" "install_httpd" {
  name          = "InstallHttpd"
  document_type = "Command"

  content = jsonencode({
    schemaVersion = "2.2"
    description   = "Install and start httpd"
    mainSteps = [
      {
        action = "aws:runShellScript"
        name   = "installHttpd"
        inputs = {
          runCommand = [
            "yum update -y",
            "yum install -y httpd",
            "systemctl enable httpd",
            "systemctl start httpd"
          ]
        }
      }
    ]
  })
}
