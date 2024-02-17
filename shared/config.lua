Config = {}

Config.start = {
    [1] = { ['x'] = 1455.71, ['y'] = 6352.36, ['z'] = 23.83 }, -- 1445.71, 6352.36, 23.83
    [2] = { ['x'] = 3614.37, ['y'] = 5025.28, ['z'] = 11.35} -- 3614.37, 5025.28, 11.35
}

Config.message = {
    [1] = 'Pressione ~INPUT_PICKUP~ para iniciar',
    [2] = 'Você iniciou o <b>FARM AFK</b>, Basta ficar 05 Minutos para receber o Dinheiro.',
    [3] = 'Você pode farmar equanto estiver AFK'
}

Config.time = 300000

Config.payment = { min = 40000, max = 80000 }

return Config
