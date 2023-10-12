output "agent_check_result" {
  description = "ID of the AWS SSM Association for the agent check."
  value       = aws_ssm_association.association[*].id
}
