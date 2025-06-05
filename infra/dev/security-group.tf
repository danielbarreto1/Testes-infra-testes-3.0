// Essas são as opções que podem ser usadas nos Security Groups 
/*
 cidr_blocks = ["10.0.2.0/24"]                                 # Permite liberar entrada ou saída de uma subrede ou IP
 source_security_group_name = "sg_exemplo"                     # Permite liberar acesso que tenha como origem um outro Security Group
 prefix_list_ids = ["pl-00432d7a935a1ed6a"]                    # Permite liberar acesso Prefix List
 self        = true                                            # Permite referenciar o próprio SG
*/


locals {

  security_groups = {
    sg_teste = {
      description = "Security Group teste"
      tags = {
        Owner   = "security"
        Project = "opc"
      }
      ingress_rules = [
        {
          from_port   = 8081
          to_port     = 8081
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
          description = "Permitir trafego de entrada para via web"
        },
        {
          from_port   = 8080
          to_port     = 8080
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
          description = "Permitir trafego de entrada para via web"
        }
      ],
      egress_rules = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
          description = "Permitir trafego de saida"
        }
      ]
    },
    sg_teste22 = {
      description = "Security Group teste2"
      tags = {
        Owner   = "security"
        Project = "opc"
      }
      ingress_rules = [
        {
          from_port                  = 8081
          to_port                    = 8081
          protocol                   = "tcp"
          source_security_group_name = "sg_teste"
          description                = "Permitir trafego de entrada para via web"
        },
        {
          from_port   = 8080
          to_port     = 8080
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
          description = "Permitir trafego de entrada para via web"
        }
      ],
      egress_rules = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
          description = "Permitir trafego de saida"
        }
      ]
    }
  }
}

module "security_group" {
  source          = "../modules/security-group"
  vpc_id          = module.vpc.vpc_id
  security_groups = local.security_groups
  tags            = var.tags

}


