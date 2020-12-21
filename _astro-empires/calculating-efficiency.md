---

title: "Calculating Efficiency"
date: 2008-11-14T15:52:19+00:00
comments: true
sharing: true
footer: true
category: "Astro Empires"
---

What is the best way to calculate a unit's efficiency? There is a simple
formula that helps a player calculate the ratio of units needed in an
attack:

<div class=''>
Ratio = (Power'_Attacker_' - Shield'_Defender_') / Armour'_Defender_'
</div>

This is a clean formula. You have to adjust for the technology level of
the attacker and defender, but the result is how many attacking units
are necessary to defeat the enemy in one attack. Against base defenses,
you have to remember to multiply by five. You also have to remember to
halve the value of the Shield when dealing with Ions.

<div class=''>
Base Defenses on the Attack:

Ratio = (Power'_Attacker_' - Shield'_Defender_') * 5 / Armour'_Defender_'

Base Defenses on the Defense:

Ratio = (Power'_Attacker_' - Shield'_Defender_') / (Armour'_Defender_' * 5)

</div>

There is another way to approach this. The formula below shows the
cost per unit of power delivered against a given target.

<div class=''>
Cost = Cost'_Attacker_' / (Power'_Attacker_' - Shield'_Defender_') 
</div>

As an example, Let's try a Battleship against a Titan. We will assume
all technologies at level 20.

<div class=''>
Cost = 2000 / (336 - (30/2)) = 6.23 credits
</div>

