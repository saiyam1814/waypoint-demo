project = "saiyam-waypoint"

app "saiyam-waypoint" {
  labels = {
      "service" = "saiyam-waypoint",
      "env" = "dev"
  }

  build {
   use "docker" {}
    registry {
        use "docker" {
          image = "saiyam911/cd-demo"
          tag = "1"
          username = var.user
          password = var.password
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
