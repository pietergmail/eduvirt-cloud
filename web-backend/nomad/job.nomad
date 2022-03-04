variable "templateName" {
  type = string
}
variable "userName" {
  type = string
}
variable "courseName" {
  type = string
}

job "${var.userName}_${var.templateName}job" {
  datacenters = ["dc1"]
  type = "batch"
  group "wtfgroup" {
    task "wtftask" {
      driver = "raw_exec"
      config {
        command = "bash"
	args = ["/home/t/eduvirt-cloud/web-backend/nomad/script.sh","${var.templateName}", "${var.userName}", "${var.courseName}"]
      }
    }
  }
}
