---

title: "Production Structures"
date: 2008-11-02T15:13:41+00:00
updated_at: 2021-01-18T07:08:45+05:00
comments: true
sharing: true
footer: true
category: "Calculators"
---

Many players like to balance the development of their infrastructure by their relative cost. The  normal way of doing this is either through a haphazard ordering of structures in the construction queue, or to go on advice of others. This page provides the players with an at-a-glance view of the relative cost (and value) of manufacturing structures at that tier.


## Balanced Structure Table

The following table lists the six key manufacturing structures: Metal Refineries, Robotic Factories, Nanite Factories, Android Factories, Shipyards and Orbital Shipyards. They are organized on tiers of their relative cost, with the cost column baselined on the price of Metal Refineries at that tier. The other structure costs are relatively the same.

{% include fixed-table.html file='astro-empires/production-table.md' %}

## Calculator

The following production calculator shows you what structures you need for balance, and what the relative construction and production values, Metal-4 bases only. Adjustments for Cybernetics is included.


## Production Calculator (Non-functioning)

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

