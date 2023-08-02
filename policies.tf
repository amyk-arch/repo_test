#Configure the azure providers
provider "azurerm" {
  features {}
}

provider "azurerm.policy" {}
# Define the policy set definition (initiative)
resource "azurerm_policy_set_definition" "test" {
  name         = "test-policy-set"
  display_name = "test Policy Set"
  description  = "This is an test policy set definition."

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/127ef6d7-242f-43b3-9eef-947faf1725d0"
  }
  
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4ec52d6d-beb7-40c4-9a9e-fe753254690e"
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/08b1442b-7789-4130-8506-4f99a97226a7"
  }
}
# Assign the policies to my respurce group
resource "azurerm_policy_assignment" "test-policy" {
  name                 = "test-policy-assignment"
  policy_set_definition_id = azurerm_policy_set_definition.test.id
  scope                = /subscriptions/6821ba2a-ab72-4ff4-8450-81ac3d902869/resourceGroups/test-madic
}
