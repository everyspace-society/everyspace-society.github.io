---
layout: page
title: "Details"
date: 2008-10-09T22:42:10+00:00
comments: true
sharing: true
footer: true
group: InteractiveHistoryRules
---

## INTERACTIVE HISTORY - PETTY DETAILS

All values given below are subject to change if the situation so warrants and the GM so decrees.

* Conversion from Aria to FUDGE
* FUDGE dice
* Military values
* Disasters and critical junctures
* Number of actions
* Strategic actions
* Resolution
* Technological advancement

### Conversion from Aria to FUDGE

In Aria, system attributes had values either in 1-20 scale (isolation, interaction, resources, trade, exploitation, humanities) or in 0-10 (technological rate of advancement / assimilation, skills) scale. The conversion table from them to FUDGE values is given below. Please note that converting the game from Aria to FUDGE did not preserve the game intact. This is because the probability distributions of Aria and FUDGE dice are very different. However, since the original system was very interpretative, and so is the converted one, this is not a big problem.

1-20  | 0-10 | FUDGE Value
------|------|-------------
19-20 | 10   | Legendary +4
17-18 | 9    | Superb  +3
15-16 | 8    | Great  +2
13-14 | 7    | Good  +1
9-12  | 5-6  | Fair  0
7-8   | 4    | Mediocre  -1
5-6   | 3    | Poor  -2
3-4   | 2    | Terrible  -3
1-2   | 0-1  | Miserable -4

The dice distributions are a problem. If a straight equality of +4 = Legendary (Mythic) success is used, the Legendary successes suddenly become annoyingly numerous. Fortunately there is a simple solution to this. It appears that if the FUDGE results are divided by two and rounded (away from zero), a probability distribution pretty much like that of Aria is achieved. Therefore results are transformed to success values as follows:

Result | Success value         | Effects
-------|-----------------------|-----------------------------------
+7     | Mythic success        | cool...
+6,+5  | Extraordinary success | special/permanent effects possible
+4,+3  | Superior success      | +2 increase possible
+2,+1  | Complete success      | +1 to one or two determinants
0      | Marginal result       | none, or balanced modifiers
-1,-2  | Complete failure      | -1 to one or two determinants
-3,-4  | Severe failure        | -2 increase possible
-5,-6  | Miserable failure     | special/permanent effects possible
%3c -7 | Catastrophic failure  | cool...

This also implies that all Aria modifiers are divided by 2 before applied to FUDGE values.

### FUDGE dice

One fudge dice (1DF) is a normal D6 with two sides labeled -1, two sides 0 and two sides +1, ie. there is equal probability for -1, 0 and +1. Normally four dices are rolled and summed. This gives the range of values from -4 to +4. In the open-ended version of 4DF in case of +4 (or -4) another 4DF is rolled and in case it is positive (or negative) it is added to the result. And so on.

Value (prob.) | Skill (benchmark)   | Task                      | Size
--------------|---------------------|---------------------------|-----------
+4 (1%25)     | Legendary (guru)    | Epic                      | Vast
+3 (5%25)     | Superb (master)     | Huge                      | Huge
+2 (13%25)    | Great (expert)      | Very hard                 | Great
+1 (19%25)    | Good (professional) | Hard                      | Big/large
0 (24%25)     | Fair (journeyman)   | Normal                    | Fair
-1 (19%25)    | Mediocre (amateur)  | Easy                      | Mediocre
-2 (13%25)    | Poor (beginner)     | Routine                   | Small
-3 (5%25)     | Terrible (ungifted) | Trivial                   | Very small
-4 (1%25)     | Miserable (cursed)  | Insignificant Catastrophe | Tiny

### Military values

Base for military force and size:
Military type  Force  Size
Standing  Fair  Scope-1
Provisional  Mediocre  Scope+1

Modifiers:

Philosophical orientation | Force         | Size
--------------------------|---------------|-----
Survival                  | 0             | +2
War                       | +1            | +1
Conquest                  | +1            | +1
Equilibrium               | 0             | 0
Peace                     | 0             | -1
Knowledge                 | -1            | -1
Military infrastructure   | Force         | Size
Professional              | +2            | 0
Mercenary                 | +1            | 0
Feodal                    | +1            | 0
Conscript                 | 0             | 0
Volunteer, militia        | +-1 (Phl.or.) | 0
All-inclusive             | +-2 (Phl.or.) | +2

Note: standing professional army requires money, money and money. Ie. at least Good wealth. Otherwise the economy becomes strained.

Note: the mancount of an army does not multiply by 10 for each size increase, but only by 3. The peg is ... hmmm ... that the smaller the total population, the bigger part of the people can take part in military effort - distances are smaller. Right? Doesn't sound really plausible, does it?

Anyway here are some kind of figures of what different sized armies are like. Size is the size of the society. Population is the population of the society and military%25 is the percentage of the population involved in military service. Nominal is the nominal army size for that society and also shows how big is an army of size 'Fair'. Since the size of standing forces is scope-1 and the size of provisional forces is scope+1, the mancount for standing and (maximum) provisional forces is also given for different sized societies.

Size       | Population | Military%25 | Nominal  | Standing# | Provisional
-----------|------------|-------------|----------|-----------|------------
Vast       | >500 mil   | 0.1%25      | >500'000 | >200'000  | >2 mil
Huge       | 500 mil    | 0.1%25      | 500'000  | 200'000   | 2 mil
Great      | 200 mil    | 0.1%25      | 200'000  | 100'000   | 500'000
Big        | 20 mil     | 0.5%25      | 100'000  | 30'000    | 200'000
Fair       | 2 mil      | 1.5%25      | 30'000   | 10'000    | 100'000
Mediocre   | 200'000    | 5%25        | 10'000   | 3'000     | 30'000
Small      | 20'000     | 15%25       | 3'000    | 1'000     | 10'000
Very small | 2'000      | 50%25       | 1'000    | 300       | 2'000
Tiny       | 200        | 100%25      | 200      | 20        | 200

#### Secondary forces

A nation typically has primary forces (standing, in arms all or most of the time) and secondary forces (provisional, raised in times of crisis). During peace time, nations do not have armed secondary forces.

By using an action, a nation can raise (the) secondary forces. Forces equal to one less than the specified size can be raised without problems. However, each size increament after that decreases exploitation (or e.g. resources) of the society by -1 for that year. In case of severe losses in battle, these decreaments start to effect future years, too.

#### Supply

In battle, an army without a secure supply line suffers a -1 to force for every year it is cut off. The exceptions are small armies capable of 'living off the land' and rare instances where an entire clan moves with the army.

#### Recovering

When the army is struck by casualities, its mother society can replenish the army by up to base size -1 of the army type (primary/secondary). An army without a secure supply line to its mother society will not be able to recover.
Military conflict resolution

1. Battle force
    First determine the largest military unit on battle field. Then reduce the Force of all other military units by their size difference with that unit. The actual Force value of each side is the maximum of the Force values of its military units after reduction.
2. Modifiers
    Take special modifiers into account: fortifications, military leaders, relative magic force, moral. If on its own ground, the defending army gets +1.
3. Winning
    Roll 4DF for both sides. Best result wins. The win-loose ratio in manforce is 1:(Result+1). For example on winning result of +2, the win-loose ratio is 1:3. What this means is that for every dead on the winning side, there is 3 dead on the loosing side.
4. Casualities
    To determine the actual casualities, decide what are the casualities of the winning side. As a default take the average of total army size on both sides and reduce it by two. This is modified by the bloodiness of the battle: for very savage battle reduce only by one, for a formal battle reduce by three. This is the amount of casualities taken by the winning side. The loosing side takes casualities as indicated by the win-loose ratio. The ratio can be translated to unit Size values by taking into account that the mancount triples for every Size-increase, ie. for 1:3 ratio there is +1, for 1:9 there is +2.
5. Other results
    Besides casualities, there may be other effects: tactical advantages or special effects.

### Disasters and critical junctures

There are several different kind of natural environmental disasters: an epidemic is the most common, with famine coming close second. Other disasters include a flood, hurricane, earthquake, tornado and drought. The disaster is always assumed to be worst of its kind, so the task should be appropriately difficult. The action determinant is the scope of the society +1, and the task level should be Huge or Epic (-3 or -4). In Elyria game the rounds are 1 year each. To get to the 10%25 for a 5 year period, a ~2%25 per year chance is used, or +-4 on 4DF.

Critical junctures are societal/political situations of depression or unrest. An internal critical juncture appears if:

* the ruling agency tyrannizes its people (Power - Authority >= +2)
* consent or power is very low (Consent / Power %3c= Poor)
* tolerance of any humanity is very low (Tolerance %3c= Terrible and Prevalence >= Mediocre)
* severe economic depression (Wealth %3c= Terrible)
* a severe political scandal has occured, like a negotations pledge is broken, an intrigue attempt is failed, ...

External critical juncture occures if some society has severily meddled in some other societies actions, or their relations have dropped below Poor (Relations %3c= Terrible). The difficulity of a critical juncture is either Hard or Very hard (-1 or -2).

### Number of actions

The basic number of actions per society is 4. This can be varied, however:

   1. extra: -1 to the extra action
   2. extras: -1 to both extras, and a -1 to one additional
   3. extras: -1 to all extras, and -1 to two additionals
   4. extras: all at -1

You can try to remove the action penalty (on a per action basis) by stating that you go cautiously or try something small (relavetive to society scope, of course). The effects won't be that great in the case, though. You can also submit fewer actions, ie. expend extra effort to some actions:

   1. less: +1 on one action (also called a "double" action)
   2. less: +1 on two actions
   3. less: +2 on one action

### Strategic actions

Strategic actions are announced with the keyword 'strategic'. They stretch over a longer period of time, at least two years, at the end of which they are resolved. However, the length of the strategic action need not be declared beforehand. The player just continues the action until he feels that it is ripe time to resolve it. As specific steps, the resolution goes as follows:

   1. Player declares strategic action, giving the goal or time estimation.
   2. GM determines basic difficulity or gives a time estimation.
   3. The player need not adhere to his chosen time limit, however if he uses less time, he'll get penalties:

* 1/4 of time -> -3
* 1/2 of time -> -2
* 3/4 of time -> -1

Extra time will grant positive modifiers, for example:

* 1.5x the time -> +1
* 2x the time -> +2
* 3x of time -> +3

   4. Each round the GM rolls 1DF and tells the player how the project fares. The player may also get modifiers to the strategic action by making appropriately linked normal actions.
   5. On the resolve year, decided by the player, 4DF is rolled. This is summed with all previous rolls (and other possible modifiers) and this is multiplied by 4/(N+4) where N is the number of years.

### Resolution

Task resolution in FUDGE is very simple: Result = Skill - Task + Dice

In IH context the Skill equals the average of the respective determinants. The task is Normal (0) by default. Both of these can be modified if the situation so warrants. Consult the list below for guidelines on modifiers:

* 0 for unsignificant change in Task/Skill or a small effect from a separately determined random component
* +-1 for a significant change or a normal effect (think about increasing task level from normal to hard)
* +-2 for a big change (task level from normal to very hard) or several (>2) significant changes
* +-3 for an overwhelming change (task level from normal to huge) or several big changes

In Elyria the actions will get bonuses for extensive planning/descriptions in the actions description.

### Technological advancement

Depending on the goal the task of making technological advancement is from very hard (-2) to epic (-4) with a tactical action. With strategic action of appropriate length this is lessened to normal in proportion to basic probability:

* Very hard (-2) task becomes normal with 1/0.18 = 5 years,
* Huge (-3) task becomes normal with 1/0.06 = 17 years
* Epic task (-4) task becomes normal with 1/0.01 = 100 years

Scope naturally effects the difficulity. Determinants include wealth, resources, scholastics (and possibly magic) prevalence and diversity. The social attitude towards research are governed by scholastics (and/or magic) tolerance.

The results of innovation action may be determined as follows: the success value is used as a base point pool. The various effects have point values and the GM picks out a suitable set.

* +1    the attempt succeeds!
* +1    there is naturally a great demand for it
* +1    no need to spread the innovation - just by existing it benefits everyone
* +1    it spreads the customer base of the society
* +1    a celebrated artist/crafter who uses the new technique
* +1    a genuine technology advance
* -1    opponents can easily adapt to it (e.g. in warfare)
* -1    it is easy to plagiarize (e.g. a new model/fashion)
* -1    it's a great innovation, but it has no real (apparent) use
* -1    penalties to spreading attempt (e.g. morally questionable)
* -1    setbacks in resources/consent/wealth, shift in power balance
* -1    there is a hidden flaw (e.g. it isn't profitable after all due to large amount of work/equipment/training)
