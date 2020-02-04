
class Gradient {
  ArrayList<GradientPoint> points = new ArrayList<GradientPoint>();
  
  Gradient(color start, color end){
    GradientPoint srt = new GradientPoint(start,0);
    GradientPoint en = new GradientPoint(end,1);
    points.add(srt);
    points.add(en);
  }
  
  color getLerpColor(float pos){
   if (pos <= 0)
     return points.get(0).c;
   if (pos >= 1)
     return points.get(points.size()-1).c;
   for(int i = 0; i < points.size()-1; i++){
     GradientPoint cur = points.get(i);
     GradientPoint next = points.get(i+1);
     if (!(cur.pos < pos && pos < next.pos))
       continue;
     color c1 = cur.c;
     color c2 = next.c;
     float p1 = cur.pos;
     float p2 = next.pos;
     float range = p2 - p1;
     float amt = (pos - p1) / range;
     return lerpColor(c1,c2,amt);
   }
   return color(0);
  }

  color getLerpColorStrong(float pos, float buffer){
   if (pos <= 0)
     return points.get(0).c;
   if (pos >= 1)
     return points.get(points.size()-1).c;
   for(int i = 0; i < points.size()-1; i++){
     GradientPoint cur = points.get(i);
     GradientPoint next = points.get(i+1);
     if (!(cur.pos < pos && pos < next.pos))
       continue;
     color c1 = cur.c;
     color c2 = next.c;
     float p1 = cur.pos;
     float p2 = next.pos;
     float range = p2 - p1;
     float amt = (pos - p1) / range;
     if (amt < buffer)
       return c1;
     if(amt > 1-buffer)
       return c2;
     float lerpAmt = 2 * (amt-buffer)/buffer;
     return lerpColor(c1,c2,lerpAmt);
   }
   return color(0);
  }
  
  color getColor(float pos){
   if (pos <= 0)
     return points.get(0).c;
   if (pos >= 1)
     return points.get(points.size()-1).c;
   for(int i = 0; i < points.size()-1; i++){
     GradientPoint cur = points.get(i);
     GradientPoint next = points.get(i+1);
     if (!(cur.pos < pos && pos < next.pos))
       continue;
     return cur.c;
   }
   return color(0);
  }
  
  boolean addColor(color c, float pos){
   if (pos <=0 || pos >= 1)
     return false;
   for(int i = 0; i < points.size()-1; i++){
     GradientPoint cur  = points.get(i  );
     GradientPoint next = points.get(i+1);
     if(cur.pos  >  pos)
       continue;
     if(cur.pos  == pos)
       return false;
     if(pos  > next.pos)
       continue;
     if(next.pos == pos)
       return false;
     
     GradientPoint now = new GradientPoint(c,pos);
     points.add(i+1,now);
   }
   return false;
  }
}

class GradientPoint{
  color c;
  float pos;
  
  GradientPoint(color c, float pos){
    this.c = c;
    this.pos = pos;
  }
}
