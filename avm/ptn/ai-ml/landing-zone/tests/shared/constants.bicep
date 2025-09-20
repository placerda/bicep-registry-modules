@export()
@description('Enforced location for all tests.')
var enforcedLocation = 'westus3'

@export()
@description('Tags for resources used in all tests.')
var tags = {
  SecurityControl: 'Ignore' // ignore security policies imposed on testing subscriptions
}
