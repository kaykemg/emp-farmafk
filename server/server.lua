local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface('vRP')
vRPclient = Tunnel.getInterface('vRP')

emp = {}
Tunnel.bindInterface(GetCurrentResourceName(), emp)

function emp.CheckPayment()
    local source = source
    local user_id = vRP.getUserId(source)
        local randomPayment = math.random(Config.payment.min, Config.payment.max)
        vRP.giveMoney(user_id, randomPayment)
        TriggerClientEvent("Notify", source, "financeiro",
            "Você recebeu <b>$" .. vRP.format(parseInt(randomPayment)) .. " dólares</b>.")
end

function emp.barra()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		TriggerClientEvent("progress",source,Config.time,"FARMANDO")
		vRPclient._playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
		SetTimeout(Config.time,function()
			vRPclient._stopAnim(source,false)
		end)
	end
end