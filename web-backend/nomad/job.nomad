job "demojobforvm" {
  datacenters = ["dc1"]
  type = "batch"
  group "demovms" {
    task "demovm" {
      driver = "raw_exec"

      config {
        command = "/home/t/eduvirt-cloud/web-backend/nomad/script.sh"
      }
    }
  }
}
