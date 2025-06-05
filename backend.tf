terraform {
  backend "local" {
    path = "./terraform.tfstate"  # Caminho onde o arquivo de state será salvo
  }
}