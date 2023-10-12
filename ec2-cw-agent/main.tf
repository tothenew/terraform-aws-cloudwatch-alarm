resource "aws_ssm_document" "install_cloudwatch_agent" {
  count         = local.req
  name          = "install-cloudwatch-agent"
  document_type = "Command"

  content = <<DOC
  {
    "schemaVersion": "1.2",
    "description": "Check and install CloudWatch Agent if not present.",
    "parameters": {},
    "runtimeConfig": {
      "aws:runShellScript": {
        "properties": [
          {
            "id": "0.aws:runShellScript",
            "runCommand": [
              "if ! [ -x \"$(command -v amazon-cloudwatch-agent-ctl)\" ]; then",
              "  echo 'CloudWatch agent is not installed. Installing now...'",
              "  wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm",
              "  sudo rpm -U ./amazon-cloudwatch-agent.rpm",
              "  amazon-cloudwatch-agent-ctl -a start",
              "else",
              "  echo 'CloudWatch agent is already installed.'",
              "fi"
            ]
          }
        ]
      }
    }
  }
DOC
}

resource "aws_ssm_association" "association" {
  count       = local.req
  name        = aws_ssm_document.install_cloudwatch_agent[count.index].name
  # name        = aws_ssm_document.install_cloudwatch_agent.name
  targets {
    key    = "InstanceIds"
    values = var.instance_id
  }
  depends_on  = [aws_ssm_document.install_cloudwatch_agent]
}

