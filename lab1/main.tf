terraform {
  required_providers {
    random = {
      source = "hashicorp/random" //Source terraform is pulling from
      version = "~> 3.7"
    }
  }
}

resource "random_pet" "lab" { //Tells terraform to create a resource
  length = 2                 //random_pet = resource type provided by random provider
}                            //lab = the local name to use when referencing the resource elsewhere in code
                             // length = 2 = argument for resource. (Tells random to provide name with two words)
output "pet_name" { //Output block displays information after terraform finishes applying configuration
  value = random_pet.lab.id
}