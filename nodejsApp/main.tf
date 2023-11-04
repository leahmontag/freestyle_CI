# main.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

# Create a user-defined Docker network
resource "docker_network" "my_network" {
  name = "my-network"
}

# MongoDB container
resource "docker_container" "mongodb" {
  name  = "mongodb"
  image = "mongo:4.4"
  network_mode = docker_network.my_network.name # Connect it to the user-defined network
  ports {
    internal = 27017
    external = 27017
  }
  volumes {
    container_path = "/data/db"
    host_path      = "C:/Users/1/Desktop/nodejsApp/mongodb-data"
  }
}

# Node.js application container
resource "docker_container" "nodejs-app" {
  name  = "nodejs-app"
  image = "nodejsapp-nodejs-app:latest" # Use your custom image name and tag
  network_mode = docker_network.my_network.name # Connect it to the user-defined network
  ports {
    internal = 4000
    external = 4000
  }
  depends_on = [docker_container.mongodb]
}
