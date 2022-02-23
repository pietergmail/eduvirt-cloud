job "demojobforvm" {
  datacenters = ["dc1"]
  type = "batch"
  group "demovms" {
    task "demovm" {
      driver = "raw_exec"

      config {
        command = "/home/matthias/Desktop/scripts/clonevm.sh"
      }
    }
  }
}