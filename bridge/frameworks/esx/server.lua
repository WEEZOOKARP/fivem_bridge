local framework = {}
local ESX = exports["es_extended"]:getSharedObject()

function framework.getPlayerFromID(id)
  local player = ESX.GetPlayerFromId(id)
  return player

  -- return {
  -- id = player.playerId,
  -- name = player.name,
  -- firstname = player.firstName
  -- lastname = player.lastname,
  -- sex = player.sex,
  -- weight = player.weight,
  -- license = player.license,
  -- dateofbirth = player.dateofbirth,
  -- dead = player.dead,
  -- money = player.money,
  -- accounts = player.accounts
  -- }
end

function framework.getStatus(id, type)
  local value = nil
  TriggerEvent("esx_status:getStatus", id, type, function(status)
    value = status.val
  end)
  if value ~= nil then
    return value
  else
    print("Requesting ESX status returned nil. You requested the status : ".. type.." is this correct?")
  end
end

function framework.getAccount(identifier, account)
  local account = exports['esx_addonaccount']:GetAccount(account, identifier)
  return account
end

return framework
