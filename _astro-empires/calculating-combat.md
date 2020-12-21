---

title: "Calculating Combat"
date: 2009-03-29T22:25:13+00:00
comments: true
sharing: true
footer: true
category: "Astro Empires"
---

There are basically three formulas you need to calculate unit-on-unit combat. In the three examples below, "Power" refers to the Attacker, "Shield" and "Armour" refer to the defender.

When Power is lower than Armour (e.g. Fighters v. Cruisers), but higher than Shield.

<div class=''>

Armour / (Power - Shield) = Number of Attackers to Kill One Defender

</div>

When Power is greater than Armour (e.g. Dreadnought v. Cruiser)

<div class=''>

(Power - Shield) / Armour = Number of Defenders Killed per Attacker

</div>

When Power is less than Shield (except those Ion units that have 50 percent of their power bypass shields).

<div class=''>

Armour / (Power * 0.01) = Number of Attackers needed.

</div>
