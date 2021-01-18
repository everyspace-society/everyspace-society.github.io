---

title: "Production Structures"
date: 2008-11-02T15:13:41+00:00
comments: true
sharing: true
footer: true
category: "Calculators"
---

Many players like to balance the development of their infrastructure by
their relative cost. The  normal way of doing this is either through a
haphazard ordering of structures in the construction queue, or to go on
advice of others. This page provides the players with an at-a-glance
view of the relative cost (and value) of manufacturing structures at
that tier.

The following production calculator shows you what structures you need
for balance, and what the relative construction and production values
are of Metal-2 and Metal-3 bases. Adjustments for Cybernetics is
included.

<div class="toc">
  <a name="toc" id="toc"></a><b>On this page&#8230;</b> (<a id="tocidtog" href="javascript:toggle('tocid');">hide</a>)<ul class="toc" id="tocid"><li><a href="#toc1">Production Calculator</a></li><li><a href="#toc2">Balanced Structure Table</a></li><li><a href="#toc3">Cost/Time Scale</a></li><li><a href="#toc4">Comments</a></li></ul></div>

<h2><a name="toc1" id="toc1"></a>Production SSS Calculator</h2>

<form id="prod" method="post">
<table class="table table-condensed"><tr>
  <td> Metal Refinery </td>
  <td> <input type="text" name="MF" value="19" id="MF" class="form-control col-xs-2" size="3" /> </td>
  <td> Cybernetics </td>
  <td> <input type="text" name="CY" value="0" id="CY" class="form-control col-xs-2" size="3" /> </td>
</tr>
<tr>
  <td> Robotic Factory </td>
  <td> <input type="text" name="RF" value="15" id="RF" class="form-control col-xs-2" size="3" /> </td>
  <td> Construction Metal-2 </td>
  <td> <input type="text" name="CM2" value="19" id="CM2" class="form-control col-xs-2" size="3" /> </td>
</tr>
<tr>
  <td> Nanite Factory </td>
  <td> <input type="text" name="NF" value="8" id="NF" class="form-control col-xs-2" size="3" /> </td>
  <td> Construction Metal-3 </td>
  <td> <input type="text" name="CM3" value="19" id="CM3" class="form-control col-xs-2" size="3" /> </td>
</tr>
<tr>
  <td> Android Factory </td>
  <td> <input type="text" name="AF" value="2" id="AF" class="form-control col-xs-2" size="3" /> </td>
  <td> Production Metal-2 </td>
  <td> <input type="text" name="PM2" value="19" id="PM2" class="form-control col-xs-2" size="3" /> </td>
</tr>
<tr>
  <td> Shipyard </td>
  <td> <input type="text" name="SY" value="20" id="SY" class="form-control col-xs-2" size="3" /> </td>
  <td> Production Metal-3 </td>
  <td> <input type="text" name="PM3" value="19" id="PM3" class="form-control col-xs-2" size="3" /> </td>
</tr>
<tr>
  <td> Orbital Shipyard </td>
  <td> <input type="text" name="OSY" value="1" id="OSY" class="form-control col-xs-2" size="3" /> </td>
</tr>
<tr>
  <td> Balanced Structures </td>
  <td>
    <select name="BAL" id="balanced" class="form-control col-xs-2">
      <option value="1" selected="selected">YES</option>
      <option value="0">NO</option>
    </select>
  </td>
</tr>
</table>
</form>

<h2><a name="toc2" id="toc2"></a>Balanced Structure Table</h2>

The following table lists the six key manufacturing structures: Metal Refineries, Robotic Factories, Nanite Factories, Android Factories, Shipyards and Orbital Shipyards. They are organized on tiers of their relative cost, with the cost column baselined on the price of Metal Refineries at that tier. The other structure costs are relatively the same.

<div class="note">

The parenthetical value represents the construction value of that tier,
**based on a Metal-2 astro**. Add an additional 1 per level of Metal
Refinery at that tier to get the construction value of that tier.
</div>

The italicized value represents the ten percent increase in production
created by having Cybernetics-2, which is the minimum technology
necessary to build Orbital Shipyards. That suggests that at this level
and beyond, the true value is different from the estimated value. This
is also the case if you have a Construction or Production commander
assigned to that base. So, remember to adjust these numbers according to
your specific situation.

{% include astro-empires/production-table.md %}
