


#amtrak512all {
   
  [RouteName='Northeast Regional'] {
    //[TrainNum != '188'] {
  
     marker-width: [sqrt]*[sqrt]*.5;
  [zoom <= 10] { marker-width: [sqrt]*[sqrt]*.2; }
     marker-opacity: .2;
     marker-allow-overlap: true;
     marker-ignore-placement: true;

  //text-size: 20;
  //text-avoid-edges: true;
  //text-placement-type: list;
      //text-allow-overlap: true;
[TrainNum='188'] {
      marker-fill: #FF0000;
      marker-width: 0;
 
   }
    }
}

#amtrak512all {
   
  [RouteName='Northeast Regional'] {
    //[TrainNum != '188'] {
  
  text-name: '[Velocity]';
  text-face-name: @sans_bold;
  text-fill: #000;
  text-size: 10;
  //text-size: 20;
  //text-avoid-edges: true;
  //text-placement-type: list;
      //text-allow-overlap: true;
[TrainNum='188'] {
           marker-width: [sqrt]*[sqrt]*.5;
  [zoom <= 10] { marker-width: [sqrt]*[sqrt]*.2; }

     marker-allow-overlap: true;
     marker-ignore-placement: true;
      //marker-line-width: 0;

      
      marker-fill: #FF0000;
      marker-opacity: .75;
      text-dy: -35;
      text-size: 20;
      text-label-position-tolerance: 100;
      [zoom >= 11][Velocity != '0'] { text-allow-overlap: true;}
      [zoom <= 10] { text-dy: -20; }
      text-halo-fill: #fff;
      text-halo-radius: 3;
      //[Velocity='106'] { text-dy: -35; }
   }
    }
}

// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';

// Fonts //
@sans: 'Arial Unicode MS Regular';
@sans_bold: 'Arial Unicode MS Bold';

/*
This style is designed to be easily recolored by adjusting the color
variables below. For predicatable feature relationships,
maintain or invert existing value (light to dark) scale.
*/

// Color palette //
@road:  #fff;
@land:  #eee;

@fill1: #fff;
@fill2: #bbb;
@fill3: #777;
@fill4: #000;

@text: #777;

Map { background-color: @land; }

// Political boundaries //
#admin[admin_level=2][maritime=0] {
  line-join: round;
  line-color: mix(@fill3,@fill2,50);
  line-width: 1;
  [zoom>=5] { line-width: 1.4; }
  [zoom>=6] { line-width: 1.8; }
  [zoom>=8] { line-width: 2; }
  [zoom>=10] { line-width: 3; }
  [disputed=1] { line-dasharray: 4,4; }
}

#admin[admin_level>2][maritime=0] {
  line-join: round;
  line-color: @fill2;
  line-width: 1;
  line-dasharray: 3,2;
  [zoom>=6] { line-width: 1.5; }
  [zoom>=8] { line-width: 1.8; }
}

// Land Features //
#landuse[class='cemetery'],
#landuse[class='park'],
#landuse[class='wood'],
#landuse_overlay {
  polygon-fill: darken(@land,3);
  [zoom>=15] { polygon-fill:mix(@land,@fill4,95); }
}

#landuse[class='pitch'],
#landuse[class='sand'] { 
  polygon-fill: mix(@land,@fill4,90);
}

#landuse[class='hospital'],
#landuse[class='industrial'],
#landuse[class='school'] { 
  polygon-fill: mix(@land,@fill1,95);
}

#building { 
  polygon-fill: mix(@fill2,@land,25);
  [zoom>=16]{ polygon-fill: mix(@fill2,@land,50);}
}

#aeroway {
  ['mapnik::geometry_type'=3][type!='apron'] { 
    polygon-fill: mix(@fill2,@land,25);
    [zoom>=16]{ polygon-fill: mix(@fill2,@land,50);}
  }
  ['mapnik::geometry_type'=2] { 
    line-color: mix(@fill2,@land,25);
    line-width: 1;
    [zoom>=13][type='runway'] { line-width: 4; }
    [zoom>=16] {
      [type='runway'] { line-width: 6; }
      line-width: 3;
      line-color: mix(@fill2,@land,50);
    }
  }
}

// Water Features //
#water {
  ::shadow {
    polygon-fill: mix(@land,@fill4,75);
  }
  ::fill {
    // a fill and overlay comp-op lighten the polygon-
    // fill from ::shadow.
    polygon-fill: @land;
    comp-op: soft-light;
    // blurring reveals the polygon fill from ::shadow around
    // the edges of the water
    image-filters: agg-stack-blur(10,10);
  }
}

// Water color is calculated by sampling the resulting color from
// the soft-light comp-op in the #water layer style above. 
@water: #d1d1d1;

#waterway {
  [type='river'],
  [type='canal'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  [type='stream'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
}
