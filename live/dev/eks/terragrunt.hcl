include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/eks"
}


dependency "network" {
  config_path = "../network"
  mock_outputs = {
    vpc_id             = "vpc-mock-12345"
    private_subnet_ids = ["subnet-mock-1", "subnet-mock-2"]
  }
}

inputs = {
  env        = "dev"
  eks_version = "1.30"
  subnet_ids = dependency.network.outputs.private_subnet_ids
  
}