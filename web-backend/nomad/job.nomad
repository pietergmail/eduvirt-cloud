variable "templateName" {
  type = string
}
variable "userName" {
  type = string
}
variable "courseName" {
  type = string
}

job "demojob" {
  datacenters = ["dc1"]
  type = "batch"
  group "demogroup" {
    task "demotask" {
      driver = "raw_exec"
      config {
        command = "/home/t/eduvirt-cloud/web-backend/nomad/script.sh"
	args = ["${var.templateName}", "${var.userName}", "${var.courseName}"]
      }
    }
  }
}
