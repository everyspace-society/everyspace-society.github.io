---

title: "Calculating Efficiency"
date: 2008-11-14T15:52:19+00:00
comments: true
sharing: true
footer: true
category: "Calculators"
---

What is the best way to calculate a unit's efficiency? There is a simple
formula that helps a player calculate the ratio of units needed in an
attack:


<code>Ratio = (Power<sub>A</sub> - Shield<sub>D</sub>) / Armour<sub>D</sub></code>


This is a clean formula. You have to adjust for the technology level of
the attacker and defender, but the result is how many attacking units
are necessary to defeat the enemy in one attack. Against base defenses,
you have to remember to multiply by five. You also have to remember to
halve the value of the Shield when dealing with Ions.


Base Defenses on the Attack:

<code>Ratio = (Power<sub>A</sub> - Shield<sub>D</sub>) * 5 / Armour<sub>D</sub></code>

Base Defenses on the Defense:

<code>Ratio = (Power<sub>A</sub> - Shield<sub>D</sub>) / (Armour<sub>D</sub> * 5)</code>

There is another way to approach this. The formula below shows the
cost per unit of power delivered against a given target.


<code>Cost = Cost<sub>A</sub> / (Power<sub>A</sub> - Shield<sub>D</sub>) </code>


As an example, Let's try a Battleship against a Titan. We will assume
all technologies at level 20.


<code>Cost = 2000 / (336 - (30/2)) = 6.23 credits</code>


