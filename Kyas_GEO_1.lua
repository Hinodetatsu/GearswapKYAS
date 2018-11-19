-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
  
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
  
    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('Organizer-lib2.lua')
end
  
-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    indi_timer = ''
    indi_duration = 255
end
  
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
  
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal','Accuracy','Dual')
    state.CastingMode:options('Normal','Accuracy')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'MEvasion')
      
    gear.PetCape = {name="Nantosuelta's Cape", augments={'Mag. Acc +2', 'Pet: "Regen" +10'}}
	gear.Hastecape = {name="Nantosuelta's Cape", augments={'DEX+1'}} --additional augs. Haste +10%, Accuracy+13, Attack +3
      
    select_default_macro_book()
      
end
 
lowtier = S{"Fire", "Fire II", "Stone", "Stone II", "Blizzard", "Blizzard II", "Aero", "Aero II", "Water", "Water II", "Thunder", "Thunder II", "Fira", "Blizzara", "Aerora", "Stonera", "Thundara", "Watera"}
hightier = S{"Fire III", "Fire IV", "Stone IV", "Stone III", "Blizzard IV", "Blizzard III", "Aero IV", "Aero III", "Water IV", "Water III", "Thunder IV", "Thunder III", "Fira II", "Blizzara II", "Aerora II", "Stonera II", "Thundara II", "Watera II"}
  
  
-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Moogle Slips and Items
	--------------------------------------
    --------------------------------------
    -- Precast sets
    --------------------------------------
  
    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic",
    head="Azimuth hood"
    }
    sets.precast.JA['Curative Recantation'] = {hands="Bagua Mitaines"}
    sets.precast.JA['Mending Halation'] = {legs="Bagua Pants"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
    sets.precast.JA['Primal Zeal'] = {head="Bagua galero"}   
    sets.precast.JA['Cardinal Chant'] = {head="geomancy galero"}
  
  
    -- Fast cast sets for spells
  
    sets.precast.FC = {range="Dunna",
    head="Nahtirah Hat",
    body="Vanir Cotehardie",
    hands="Helios Gloves",
    legs="Geomancy Pants",
    feet="Chelona Boots",
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="lebeche Ring",
    back="Lifestream Cape",
}
  
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
    main="Vejovis Wand +1",
    sub="Genbu's Shield",
    body="Heka's Kalasiris",
    waist="Acerbic Sash +1",
    back="Pahtli Cape",
})
  
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
    head="Umuthi Hat",
    hands="Carapacho Cuffs",
    waist="Siegel Sash",
})  
  
      
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
    main="Ngqoqwanb",
    hands="Bagua Mitaines",
    neck="Stoicheion Medal",
	feet="Tutyr Sabots"
})
  
    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
      
      
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Asperity Necklace",
    waist="Shadow Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Adoulin Ring",
    right_ring="Raja's Ring",
    back=gear.MeleeCape}
  
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
		
		sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS,{waist="Light Belt", right_ring="Cacoethic Ring", right_ear="Domin. Earring +1", neck="Imbodla Necklace"})	
         
		sets.precast.WS['Exudation'] = set_combine(sets.precast.WS,{waist="Shadow Belt", right_ring="Shiva Ring", back="Refraction Cape", neck="Imbodla Necklace"})
		 
        sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS,{waist="Light Belt",left_ear="Hecate's Earring",right_ear="Friomisi Earring"
		,right_ring="Vertigo Ring",back="Seshaw Cape",neck="Imbodla Necklace"})
		sets.precast.WS['Seraph Strike'] = sets.precast.WS['Flash Nova']
		sets.precast.WS['Shining Strike'] = sets.precast.WS['Flash Nova']
          
		sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS,{left_ear="Kuwunga Earring", right_ear="Steelflash Earring",right_ring="Enlivened Ring", waist="Light Belt"}) 
        sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS)
		sets.precast.WS['Judgment'] = set_combine(sets.precast.WS)
		sets.precast.WS['True Strike'] = set_combine(sets.precast.WS,{back="Kayapa Cape",waist="Cetl Belt"})
      
        sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{right_ring="Acumen Ring", right_ear="Friomisi Earring",
		neck="Imbodla Necklace", waist="Breeze Belt"})    
		sets.precast.WS['Gust Slash'] =sets.precast.WS['Aeolian Edge']
              
		sets.precast.WS['Starlight'] = {neck="Prudence Torque"}
		sets.precast.WS['Moonlight'] = sets.precast.WS['Starlight']
          
  
    --------------------------------------
    -- Midcast sets
    --------------------------------------
  
    -- Base fast recast for spells
    sets.midcast.FastRecast =set_combine(sets.precast.fastcast) 
  
sets.midcast.Regen = set_combine(sets.midcast.fastcast, {
    main="bolelabunga",
    body="Telchine Chas."})
      
    sets.midcast['Enhancing Magic']={
    main="Kirin's Pole",
    sub="Fulcio Grip",
    head="Umuthi Hat",
    hands="Bagua Mitaines",
    body="Manasa Chasuble",
    legs="Bagua Pants +1",
    feet="helios Boots",
    neck="Colossus's Torque",
    waist="Cascade Belt",
    left_ear="Andoaa Earring",
    right_ear="Magnetic Earring",
    back="Merciful Cape",
}
      
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
    back="grapevine cape"})
  
    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
    waist="Emphatikos rope"})
  
    sets.midcast.Geomancy ={range="Dunna",
    main="Numen Staff",
    sub="Staff Strap",
    head="Azimuth Hood",
    body="Bagua Tunic",
    hands="Geomancy Mitaines +1",
    legs="Azimuth Tights",
    feet="Umbani Boots",
    waist="Witful Belt",
    left_ear="Magnetic Earring",
    right_ear="Gifted Earring",
    right_ring="Bifrost Ring",
    back="Lifestream Cape",
}
      
    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {legs="Bagua Pants"})
  
  
    sets.midcast.Cure = {
    main="Tamaxchi",
    sub="Genbu's Shield",
    head="Vanya Hood",
    body="Heka's Kalasiris",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Colossus's Torque",
    waist="Cognizant Belt",
    left_ear="Gifted Earring",
    right_ear="Magnetic Earring",
    left_ring="Sirona's Ring",
    right_ring="Aquasoul Ring",
    back="Pahtli Cape",
}
          
        sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    neck="Stone Gorget",
    waist="siegel sash",
    right_ear="Earthcry Earring",
})  
              
    sets.midcast.Curaga = sets.midcast.Cure
  
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
  
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
  
        -- Custom Spell Classes
    sets.midcast['Enfeebling Magic'] = {
    main="Ngqoqwanb",
    sub="Mephitis Grip",
    head="Jhakri Coronal +1",
    body="Vanya Robe",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="imbodla necklace",
    waist="Demonry Sash",
    left_ear="Psystorm Earring",
    right_ear="Lifestorm Earring",
    left_ring="Perception Ring",
    right_ring="Adoulin Ring",
    back="lifestream Cape",
}
  
    sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
      
})  
  
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']
  
    sets.midcast['Dark Magic'] = {
    main="Ngqoqwanb",
    sub="Caecus Grip",
    body="Geomancy Tunic",
    hands="Hagondes Cuffs",
    legs="Artsieq Hose",
    feet="Umbani Boots",
    neck="Aesir Torque",
    left_ear="Abyssal Earring",
    right_ear="Gwati Earring",
    left_ring="shiva Ring",
    right_ring="sangoma Ring",
    back="Merciful Cape",
}
          
        sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
	head="Bagua Galero",
    waist="Fucho-No-Obi",
})
      
    sets.midcast.Aspir = sets.midcast.Drain
      
  
  
    sets.midcast.Stun = sets.precast.FC
              
  
            sets.midcast.Bolster = {body="Bagua Tunic"}
        sets.midcast['Life Cycle'] = {body="Geomancy Tunic",
    head="Azimuth hood"}
        sets.midcast['Mending Halation'] = {legs="Bagua Pants"}
        sets.midcast['Radial Arcana'] = {feet="Bagua Sandals +1"}
        sets.midcast.Bolster.Pet = {body="Bagua Tunic"}
        sets.midcast['Life Cycle'].Pet = {body="Geomancy Tunic",
    head="Azimuth hood"}
        sets.midcast['Mending Halation'].Pet = {legs="Bagua Pants"}        sets.midcast.Bolster.Pet.Indi = {body="Bagua Tunic"}
        sets.midcast['Life Cycle'].Pet.Indi = {body="Geomancy Tunic",
    head="Azimuth hood"}
        sets.midcast['Mending Halation'].Pet.Indi = {legs="Bagua Pants"}
  
          -- Elemental Magic sets
      
    sets.midcast['Elemental Magic']= {
    main="Eminent Staff",
    sub="Niobid Strap",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Eddy Necklace",
    waist="Tengu-no-Obi",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Shiva Ring",
    right_ring="Adoulin Ring",
    back="Seshaw Cape",
}
  
    sets.midcast['Elemental Magic']['Accuracy']= {
	main="Eminent Staff",sub="Niobid Strap",ammo="Kalboron Stone",
	head="Jhakri Coronal +1",neck="Imbodla Necklace",left_ear="Psystorm Earring",right_ear="Lifestorm Earring",
	body="Jhakri Robe +1",hands="Jhakri Cuffs +1",left_ring="Vertigo Ring",right_ring="Adoulin Ring",
	back="Refraction Cape",waist="Tengu-no-Obi",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1",
}
       sets.midcast.Impact = {
    main="Marin staff +1",
    sub="Elder's Grip +1",
    head=empty,
    body="Twilight Cloak",
    hands="azimuth gloves +1",
    legs="Azimuth Tights +1",
    feet="Helios Boots",
    neck="Eddy Necklace",
    waist=gear.ElementalObi,
    left_ear="Gwati Earring",
    right_ear="Crematio Earring",
    left_ring="Shiva Ring",
    right_ring="Shiva Ring",
    back="Toro Cape",
}   
      
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
  
    -- Resting sets
    sets.resting = {main="Numen Staff",sub="Staff Strap",
    ammo="Clarus Stone",
	head="Befouled Crown",
    body="Jhakri Robe +1",
    hands="Bagua Mitaines",
    legs="Assid. Pants +1",
    feet="Serpentes Sabots",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Colossus's Earring",
    right_ear="Magnetic Earring",
    left_ring="Paguroidea Ring",
    right_ring=gear.DarkRing.physical,
    back="Kumbira Cape",}
  
  
    -- Idle sets
	
	sets.idle = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Blistering Sallet +1",neck="Twilight Torque",ear1="Gifted Earring",ear2="Loquacious Earring",
        body="Jhakri Robe +1",hands="Bagua Mitaines",ring1="Bifrost Ring",ring2="Serket Ring",
        back="Cheviot Cape",waist="Witful Belt",legs="Assid. Pants +1",feet="Serpentes Sabots"}
  
  
    sets.idle.PDT = {
    main="Earth Staff",
    sub="Tzacab Grip",
        head="Blistering Sallet +1",
        neck="Loricate Torque",
        ear1="Colossus's Earring",
        ear2="Magnetic Earring",
        body="Ischemia Chasu.",
        hands="hagondes cuffs",
        ring1=gear.DarkRing.physical,
        ring2=gear.DarkRing.magical,
        back="Cheviot Cape",
        waist="Slipor Sash",
        legs="Artseiq Hose",
        feet="Azimuth Gaiters"}
          
        sets.idle.MDT = set_combine(sets.idle.PDT,{main="Chatoyant Staff",head="Vanya Hood",body="Vanya Robe", ring1="Coral Ring", legs="Bokwus Slops", feet="Umbani Boots", back="Kayapa Cape", hands="Telchine Gloves"})
		
		sets.idle.MEvasion = set_combine(sets.idle.PDT,{main="Chatoyant Staff", body= "Cohort Cloak", hands="Telchine Gloves", ear1= "Dominance Earring", 
		ear2="Domin. Earring", legs="Assid. Pants +1", feet="Umbani Boots"}) 
  
    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle,{back=gear.PetCape, feet="Bagua Sandals +1", head="Azimuth Hood"})
  
    sets.idle.PDT.Pet = set_combine(sets.idle.PDT,{back="Lifestream Cape",waist="Isa Belt",hands="Geomancy Mitaines +1"})
  
    sets.idle.MDT.Pet = set_combine(sets.idle.MDT, {back="Lifestream Cape",hands="Geomancy Mitaines +1"})
  
    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = sets.idle.Town
      
    sets.idle.PDT.Indi = sets.idle.PDT
      
    sets.idle.MDT.Indi = sets.idle.MDT
       
    sets.idle.PDT.Pet.Indi = sets.idle.PDT.Pet
      
    sets.idle.MDT.Pet.Indi = sets.idle.MDT.Pet
  
    sets.idle.Town = {
    main="Bolelabunga",
    sub="Genbu's Shield",
    range="Dunna",
    head="Blistering Sallet +1",
    body="Jhakri Robe +1",
    hands="Bagua Mitaines",
    legs="Assid. Pants +1",
    feet="Serpentes Sabots",
    neck="Loricate Torque",
    waist="Fucho-no-Obi",
    left_ear="Colossus Earing",
    left_ring=gear.DarkRing.physical,
    right_ring=gear.DarkRing.magical,
    back="Cheviot Cape",
}
  
    sets.idle.Weak = sets.resting
  
    -- Defense sets
  
    sets.defense.PDT = sets.idle.PDT
  
    sets.defense.MDT = sets.idle.MDT
	
	sets.defense.MEvasion = sets.idle.MEvasion
  
    sets.Kiting = {feet="Geomancy Sandals"}
  
    sets.latent_refresh = {waist="Fucho-no-obi"}
      
      
  
    --------------------------------------
    -- Engaged sets
    --------------------------------------
  
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
  
    -- Normal melee group
    sets.engaged = {
    sub="Genbu's Shield",
    range="Dunna",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Asperity Necklace",
    waist="Cetl Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="rajas Ring",
    right_ring="k'ayres ring",
    back=gear.Hastecape}
  
    sets.engaged.Accuracy = set_combine(sets.engaged,{
    left_ring="Cacoethic Ring",
    right_ring="Adoulin Ring",
	right_ear="Dominance Earring +1"
})   
  
    sets.engaged.Dual = set_combine(sets.engaged,{
    sub="Tamaxchi",
    left_ear="Heartseeker Earring",
    right_ear="Dudgeon Earring",
    waist="shetal stone",
})
    --------------------------------------
    -- Custom buff sets
    --------------------------------------
  
end
 poison = 0
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
  
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
    if buff == "poison" then
        if gain then
            poison = 1
            add_to_chat(255, '*-*-*-*-*-*-*-*-* [ Poisoned ] *-*-*-*-*-*-*-*-*')
        else
            poison = 0
            add_to_chat(255, '*-*-*-*-*-*-*-*-* [ Poison OFF ] *-*-*-*-*-*-*-*-*')
        end
    end
end
  
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range','ammo')
		elseif newValue == 'Accuracy' then
			disable('main','sub','range','ammo')
		elseif newValue == 'Dual' then
			disable('main','sub','range','ammo')
        else
            enable('main','sub','range','ammo')
        end
    end
end
 
-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
     
        -- this if for low tier
      if lowtier:contains(spell.name) then
        add_to_chat(204, '*-*-*-*-*-*-*-*-* [ Low TIER ] *-*-*-*-*-*-*-*-*')
        if buffactive.Poison then
            equip(sets.midcast['Elemental Magic'], {main="Mindmelter"})
        elseif spell.element == 'Earth' then
            equip(sets.midcast['Elemental Magic'])
        elseif spell.element == 'Ice' then
            equip(sets.midcast['Elemental Magic'], {main="Ngqoqwanb"})  
        elseif spell.element == 'Wind' then
            equip(sets.midcast['Elemental Magic'])
        end
          
  
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.midcast['Elemental Magic'], {waist="Hachirin-No-Obi"})
        end
      else
        -- high tier
        add_to_chat(204, '*-*-*-*-*-*-*-*-* [ High TIER ] *-*-*-*-*-*-*-*-*')
        if buffactive.Poison then
            equip(sets.midcast['Elemental Magic']['Accuracy'], {main="Mindmelter"})
        elseif spell.element == 'Earth' then
            equip(sets.midcast['Elemental Magic']['Accuracy'])
        elseif spell.element == 'Ice' then
            equip(sets.midcast['Elemental Magic']['Accuracy'], {main="Ngqoqwanb"})  
        elseif spell.element == 'Wind' then
            equip(sets.midcast['Elemental Magic'])
        end
          
  
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.midcast['Elemental Magic'], {waist="Hachirin-No-Obi"})
        end
     
      end
  
    end
end
  
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
  
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
            elseif spell.skill == 'Elemental Magic' then
        end
    end
end
  
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end
  
-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end
  
-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end
  
-- MAKE A MACRO : /tell <me> check
function open_coffer()
    CofferType = "Velkk Coffer"
    if player.inventory[CofferType] then
    NCoffer = player.inventory[CofferType].count
    bag = windower.ffxi.get_bag_info(0).count
    max = windower.ffxi.get_bag_info(0).max
    spots = max-bag
    if spots > 0 then
    add_to_chat(204, '*-*-*-*-*-*-*-*-* [ '..NCoffer..'x '..CofferType..' to open - Inventory('..bag..'/'..max..') ] *-*-*-*-*-*-*-*-*')
    local nextcommand = ""
    for i=1, spots do
        nextcommand = nextcommand .. 'input /item "'..CofferType..'" <me>; wait 2;'
    end
    nextcommand = nextcommand .. 'input /tell '..player.name..' check'
    send_command(nextcommand)
    else
        add_to_chat(204, '*-*-*-*-*-*-*-*-* [ Inventory('..bag..'/'..max..') ] *-*-*-*-*-*-*-*-*')
    end
    else
        add_to_chat(204, '*-*-*-*-*-*-*-*-* [ No '..CofferType..' in inventory ] *-*-*-*-*-*-*-*-*')
    end
end
  
  
windower.register_event('chat message', function(original, sender, mode, gm)
    local match
  
                if sender == player.name then
                    if original == "check" then
                        open_coffer()
                    end
                end
  
    return sender, mode, gm
end)
  
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
  
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 18)
 end