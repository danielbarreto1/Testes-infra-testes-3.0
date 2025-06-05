// Essas são as opções que podem ser usadas nos Security Groups 
/*
 cidr_blocks = ["10.0.2.0/24"]                                 # Permite liberar entrada ou saída de uma subrede ou IP
 source_security_group_name = "sg_exemplo"                     # Permite liberar acesso que tenha como origem um outro Security Group
 prefix_list_ids = ["pl-00432d7a935a1ed6a"]                    # Permite liberar acesso Prefix List
 self        = true                                            # Permite referenciar o próprio SG
*/

security_groups = {
  sg_teste = {
    description = "Security Group teste"
    tags = {
      Owner   = "security"
      Project = "opc"
    }
    ingress_rules = [
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Permitir trafego de entrada para via web"
      }
    ]
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