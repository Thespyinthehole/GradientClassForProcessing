# GradientClassForProcessing
A gradient class for Processing

<h2>Usage</h2>
<p>
```java \n
  //Make a new gradient object with black as the lower bound and white as upper bound
  Gradient g = new Gradient(color(0),color(255)); 
  
  //Add a new color at a given bound (needs to be between 0 and 1 exclusive on both ends)
  g.addColor(color(255,0,0),0.5);
  
  //Read data from the lower bound of the of value given
  //If there are only 2 color selected, all non 0 value will be lower bound and 1 will be upper bound
  color c = g.getColor(0.1);
  
  //Read data from a given value lerped between the given range
  color c = g.getLerpColor(0.25);
  
  //Read data with lerping, but there is an added buffer so there is a dead zone for the color
  color c = g.getLerpColorStrong(0.8);
  ```
</p>
