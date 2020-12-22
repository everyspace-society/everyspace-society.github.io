---

title: "Universal Astro Profile"
date: 2007-12-31T20:13:01+00:00
comments: true
sharing: true
footer: true
category: "Old Content Queue"
---

One difficult task in Astro Empires is capturing the details of a base and reporting those details in an easy to read format. To remedy this, a 10-character code was developed called the **Universal Astro Profile**  (UAP).  The idea for the profile derives from the role-playing game, Traveller, which solved the problem of universal description of characters, vehicles and places using a series of universal profiles.



The Code Explained
==================

The basic format of the code is [@ 0APPB-0BBB0 @]. In this notation, '0'
is decimal, 'A' is a letter, 'P' is a specific code, and 'B' is Base 34.


<table class='table'><tr>
  <td>Slot</td>
  <td>Which orbit the base is in.</td>
</tr>
<tr>
  <td><strong>A</strong></td>
  <td>Type</td>
  <td>The astro type. See table below for mapping between astro type and code.</td>
</tr>
<tr>
  <td><strong>P</strong></td>
  <td>Production</td>
  <td>The largest unit type it can produce, in two-letter code. See table below for mapping.</td>
</tr>
<tr>
  <td><strong>P</strong></td>
  <td>Capacity</td>
  <td></td>
</tr>
<tr>
  <td><strong>B</strong></td>
  <td>Occupation Value</td>
  <td>Hourly revenue from occupation in tens of credits (dekacredits).</td>
</tr>
<tr>
  <td><strong>-</strong></td>
  <td></td>
</tr>
<tr>
  <td><strong>0</strong></td>
  <td>P-Rings</td>
  <td>Number of P-Rings on the base.</td>
</tr>
<tr>
  <td><strong>B</strong></td>
  <td>Shields</td>
  <td>D-Shields [0-9] or P-Shields [A-J].</td>
</tr>
<tr>
  <td><strong>B</strong></td>
  <td>Turrets</td>
  <td>Photon [0-9] or Disrupter [A-J] Turrets.</td>
</tr>
<tr>
  <td><strong>B</strong></td>
  <td>Command Centers</td>
  <td>Number of Command Centers.</td>
</tr>
<tr>
  <td><strong>0</strong></td>
  <td>Jump Gates</td>
  <td>Number of jump gates.</td>
</tr>
</table>

Explanation of Base34 and codes is offered below. However, a translation
of the code may help explain it until I figure out how to explain it
myself. The following is an astro entry: [+[@5KHC4-1ABA3@]+] Based on this entry, we know the following:
* (5) The slot is 20.
* (K) The type is Rocky.
* (HC) The base can produce Heavy Cruisers.
* (4) The base generates 40 credits per hour during occupation.
* (1) The base has one P-Ring.
* (A) The base has one P-Shield. If it was a Deflection Shield, it woudl be 1 instead of A.
* (B) The base has two D-Turrets. If it was Photon turrets, it would be 2 instead of B.
* (A) The base has ten Command Centers
* (3) The base has Jump-Gate 3.

From reviewing the attributes of the UAP, you may notice this helps
quickly note value of the base and its inherent defenses.

Astro Type Codes
================


<table class='table'><tr>
  <td><strong>O</strong> Oceanic</td>
</tr>
<tr>
  <td><strong>C</strong> Craters</td>
  <td><strong>R</strong> Radioactive</td>
</tr>
<tr>
  <td><strong>D</strong> Arid</td>
  <td><strong>T</strong> Tundra</td>
</tr>
<tr>
  <td><strong>E</strong> Earthly</td>
  <td><strong>W</strong> Magma</td>
</tr>
<tr>
  <td><strong>G</strong> Gaia</td>
  <td><strong>V</strong> Volcanic</td>
</tr>
<tr>
  <td><strong>K</strong> Rocky</td>
  <td><strong>X</strong> Toxic</td>
</tr>
<tr>
  <td><strong>L</strong> Glacial</td>
  <td><strong>Y</strong> Crystaloid</td>
</tr>
<tr>
  <td><strong>M</strong> Metallic</td>
</tr>
</table>

What is Base34?
===============

Base 34 is an extension of Base16 which lets us use a single digit as
much as possible. Here is a mapping between Base34 and decimal.


<table class='table'><tr>
  <td><strong>0</strong></td>
  <td>0</td>
  <td><strong>H</strong></td>
  <td>17</td>
</tr>
<tr>
  <td><strong>1</strong></td>
  <td>1</td>
  <td><strong>J</strong></td>
  <td>18</td>
</tr>
<tr>
  <td><strong>2</strong></td>
  <td>2</td>
  <td><strong>K</strong></td>
  <td>19</td>
</tr>
<tr>
  <td><strong>3</strong></td>
  <td>3</td>
  <td><strong>L</strong></td>
  <td>20</td>
</tr>
<tr>
  <td><strong>4</strong></td>
  <td>4</td>
  <td><strong>M</strong></td>
  <td>21</td>
</tr>
<tr>
  <td><strong>5</strong></td>
  <td>5</td>
  <td><strong>N</strong></td>
  <td>22</td>
</tr>
<tr>
  <td><strong>6</strong></td>
  <td>6</td>
  <td><strong>P</strong></td>
  <td>23</td>
</tr>
<tr>
  <td><strong>7</strong></td>
  <td>7</td>
  <td><strong>Q</strong></td>
  <td>24</td>
</tr>
<tr>
  <td><strong>8</strong></td>
  <td>8</td>
  <td><strong>R</strong></td>
  <td>25</td>
</tr>
<tr>
  <td><strong>9</strong></td>
  <td>9</td>
  <td><strong>S</strong></td>
  <td>26</td>
</tr>
<tr>
  <td><strong>A</strong></td>
  <td>10</td>
  <td><strong>T</strong></td>
  <td>27</td>
</tr>
<tr>
  <td><strong>B</strong></td>
  <td>11</td>
  <td><strong>U</strong></td>
  <td>28</td>
</tr>
<tr>
  <td><strong>C</strong></td>
  <td>12</td>
  <td><strong>V</strong></td>
  <td>29</td>
</tr>
<tr>
  <td><strong>D</strong></td>
  <td>13</td>
  <td><strong>W</strong></td>
  <td>30</td>
</tr>
<tr>
  <td><strong>E</strong></td>
  <td>14</td>
  <td><strong>X</strong></td>
  <td>31</td>
</tr>
<tr>
  <td><strong>F</strong></td>
  <td>15</td>
  <td><strong>Y</strong></td>
  <td>32</td>
</tr>
<tr>
  <td><strong>G</strong></td>
  <td>16</td>
  <td><strong>Z</strong></td>
  <td>33</td>
</tr>
</table>

Color Coding
============

The Census uses color coding for key defense values. The color code is based on the best-practices in base defenses learned from the older galaxies. Specifically, UAP color coding assumes the following defenses as ideal&mdash;and are colored <span class='text-success'>green</span> in the UAP:

* Planetary Rings (2)
* Planetary Shields (2)
* Disrupter Turrets (3)
* Command Centers (15)

A minimal acceptable value is also present, and colored <span class=''>blue</span>. Any other value is colored <span class='text-danger'>red</span>.

* Planetary Rings (1)
* Planetary Shields (1)
* Disrupter Turrets (2)
* Command Centers (10)


