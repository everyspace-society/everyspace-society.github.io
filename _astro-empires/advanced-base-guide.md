---

title: "Advanced Base Guide"
subtitle: "Version 3.0"
date: 2007-10-12T15:53:13+00:00
updated_at: 2021-01-16T06:53:45+05:00
comments: true
sharing: true
footer: true
category: "Guides"
---

* **Updated July 2013.**
* **Updated January 2021 for v3.0 servers**

This advanced base guide discusses building your base after the first week's sprint to Nine bases. The earlier version of this guide is available, so you can read that if you are inclined. I want this guide to be leaner. There are 

Discussed:

* Astro Selection
* Minimal Build Goals
* Defense Goals
* Fleet Standard

## Astro Selection

AstroEmpires did an astro rebalance with Version 3. They shifted the Fertility bonus from slots 2,3 to slots 3,4. They increased the metal of all astros by one, as well as base gas and bonuses. I wrote a program that [analized](/astro-empires/analysis-v3/) all of the astro types by calculating the remaining area slot after adding Urban Structures and the most useful natural energy plant (Solar or Gas) for that slot. Where before they gave us a few options, the rebalance narrowed it down considerably: 

{: .success} 
> #### Astro Selection Recommendation
> Plant on Rocky Planet or Moon, or Asteroids in Slots 3 or 4

If you are a Free player, focus on Rocky only. You are capped at the amount of space available due to the advanced structure limit. I would suggest when you are maxed out that you spend a month's subscription and spend that month building all those advanced structures.

Rocky Planets and Moons have _four more available area than any other Metal-4 astro_. In Slot-2/5, Rocky astros have six fewer slots than Slot-3/4. Astroids have seven more slots in Slot-3/4 than they do in Slot-2/5, and _21 more_ than Slot 1. Whatever you do, don't plant in Slot-1. I made that mistake on Babylon relying on my old v1.5 advice, and I'm undoing that now. 

Given the difference between a Rocky and the other Metal-4 astros is one Terraform, this is a soft recommendation. The difference between Slot-2/-5 and Slot-3/4 is one or two Terraforms. A Rocky astro has 12/20 (moon/planet) more slots than an Asteroid, three or four terraforms.

Metal-3 astros are trash. The best Metal-3 moons are Slot-3 Arid, Gaia and Toxic. The best Metal-3 Planets are Slot-2 Arid and Tundra. But, the best Metal-3 Planet has one more slot than a Rocky planet. The best Metal-3 moon has 3 more slots. You surrender a lot of construction and production for less than a Terraform of slots.

What do I do? From now on, I'm only building on Slot-3/4 Asteroids.

## Base Structure

It is up to you whether you specialize. My personal minimum goals are:

* Three Dread-Capable Production bases. All other bases should build to your fleet standard
* Three Lab-20 Research bases, with one at Lab-26
* Planetary Rings (Pring) & Shields in a 3:2 ratio. Always have one more Pring than Pshield.
* Before Prings, build three of your best turret. Disband lessor turrets because AE's mechanics dings you for their obsolence.

### Why Dread-Capable?

My [Base Defense Guide](/astro-empires/base-defense-guide/) talks about how a Base's defenses protect the base. Fleet protects your trades. If you have 4 long-distance trade routes, then a Dread is usually enough to protect them. The Dread is in turn protected by one of your Prings, so make sure you have one more set of prings than you need for base defense.

### Why Lab-20/-26?

I push hard for Prings early. This requires on base have Lab-16 to research Photon. Disruptor, the best turret tech before prings, requires Lab-20. Done right, there will be a 2-3 week gap between when you are D-Turret-capable and Pring-capable. You'll want a set of D-Turrets.

The Lab-26 covers all the technology. For Dreads you'll need Lab-22 to research the Cybernetics needed for Orbital Shipyards; required to build Dreads.

## Defense Goals

{:.info}
> Before Prings, Build 3 of your best Turret, disband lessor turrets.
> After Prings, Build a minimum of 3 prings and have 1 less pshield.

As you build your bases, you want to have enough turret power to protect your base's economy. The [Base Defense Guide](/astro-empires/base-defense-guide) provides more detail. Don't waste space by retaining obsolete turrets, or turrets without shields.

I discuss this in greater detail in [Planetary Ring Construction Guide](/astro-empires/planetary-ring-construction-guide/). To simplify, I have three Lab-20 bases. One researches Photon continuously. Photon research is the [critical path](https://en.wikipedia.org/wiki/Critical_path_method) for Prings. Another base can research Armour and Shielding full-time and complete before Photon. The third base is for all the other research you'll want, such as Disruptor, Ion, Warp, etc.

## Fleet Standard

I talk about fleet efficency in [Small Fleet Doctrine](/astro-empires/small-fleet-doctrine/). I currently advocate for a simple fleet comprising Fighters and combat-capable transportation. That can be Cruisers, Heavy Cruisers or Battleships. I'll have to update this guide again when I get into more fleet action. Recyclers should be 10 percent of your fleet so you can harvest in one tick.

* Fighters are efficient against all Meat units, drop enough to clear the Meat in one go
* Ion Bombers are efficient against Frigates, Cruisers, Heavy Cruisers and Battleships
* Cruisers are efficient against Heavy Cruisers and Battleships, so a decent deterrant for Small Fleet
* Heavy Cruisers are efficent against Dreads, so are essential for cracking a Dread-protected base
* Battleships are efficient against everything _but_ Cruisers and Heavy Cruisers. They have good Fighter capacity.

## Analysis 

### Efficency Table v3.0

Efficiency is mesured

<pre>
<code>
Ratio<sub>A</sub> = (Power<sub>A</sub> - Shield<sub>D</sub>) / Armour<sub>D</sub>
Ratio<sub>D</sub> = (Power<sub>D</sub> - Shield<sub>A</sub>) / Armour<sub>A</sub>

true if Ratio<sub>A</sub> > Ratio<sub>D</sub>
</code>
</pre>

<div class='fixed-table'>
{% capture my_include %}{% include astro-empires/efficiency.md %}{% endcapture %}
{{ my_include | markdownify }}
</div>

## Kill Ratio

The following table shows either the number of units killed by the attacking unit (1:X) or the number of units required to kill the defending unit (X:1):
kon
<div style='overflow-x: scroll'>
{% capture my_include %}{% include astro-empires/kill-ratios.md %}{% endcapture %}
{{ my_include | markdownify }}
</div>