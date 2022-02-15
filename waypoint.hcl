project = "saiyam-waypoint"

app "saiyam-waypoint" {
  labels = {
      "service" = "saiyam-waypoint",
      "env" = "dev"
  }

  build {
    use "pack" {}
    registry {
      use "docker" {
        image = "saiyam911/cd-demo"
        tag   = "1"
        local = true
  }
    }
 }

  deploy { 
    use "kubernetes" {
        probe_path = "/"
        service_port = 8080
}
  }

  release {
    use "kubernetes" {
      node_port = 31769
      port = 8080
    }
  }
}
