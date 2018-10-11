import rwmidi.*;
import processing.opengl.*;
import toxi.geom.*;
import plethora.core.*;
import peasy.*;

MidiInput bus;

PImage imgLaura, laura, imgSimon, simon, imgEstelle, estelle, imgHudson, hudson;
PImage imgLaura2, laura2, imgSimon2, simon2, imgEstelle2, estelle2, imgHudson2, hudson2;
float rand = 2;
float alpha = 35;
float blancAlpha = 0;
float noirAlpha = 0;
float un, deux, trois, quatre;
float plus, moins;
boolean lauraCamp = true, simonCamp = true, estelleCamp = true, hudsonCamp = true;
boolean hudsonBack = false, simonBack = false, lauraBack=false, estelleBack = false; 
boolean laura2Camp = false, simon2Camp = false, estelle2Camp = false, hudson2Camp = false;
boolean hudson2Back = false, simon2Back = false, laura2Back=false, estelle2Back = false; 
int tete = 1;
boolean juliette = false, cafe = false;
boolean fin = false;
float jAlpha;

float[][] data;

Ple_Terrain sol;

int DIMX = 100;
int DIMY = 100;

void setup() {
  //size(960, 540);
  fullScreen(P3D);
  noCursor();
  frameRate(24);

  //cam = new PeasyCam(this, 1100);

  Vec3D loc = new Vec3D(0, 0, 0);

  sol = new Ple_Terrain(this, loc, 280, 150, 5, 5);

  imgHudson = loadImage("paysage.jpg");
  imgHudson.resize(width, height);
  hudson = createImage(displayWidth, displayHeight, RGB);
  imgHudson.loadPixels();
  hudson = imgHudson.get();

  imgLaura = loadImage("julietteFace.jpg");
  imgLaura.resize(width, height);
  laura = createImage(displayWidth, displayHeight, RGB);
  imgLaura.loadPixels();
  laura = imgLaura.get();

  imgSimon = loadImage("garcon.jpg");
  imgSimon.resize(width, height);
  simon = createImage(displayWidth, displayHeight, RGB);
  imgSimon.loadPixels();
  simon = imgSimon.get();

  imgEstelle = loadImage("binoche30.jpg");
  imgEstelle.resize(width, height);
  estelle = createImage(displayWidth, displayHeight, RGB);
  imgEstelle.loadPixels();
  estelle = imgEstelle.get();

  imgHudson2 = loadImage("paysage.jpg");
  imgHudson2.resize(width, height);
  hudson2 = createImage(displayWidth, displayHeight, RGB);
  imgHudson2.loadPixels();
  hudson2 = imgHudson2.get();

  imgLaura2 = loadImage("julietteFace.jpg");
  imgLaura2.resize(width, height);
  laura2 = createImage(displayWidth, displayHeight, RGB);
  imgLaura2.loadPixels();
  laura2 = imgLaura2.get();

  imgSimon2 = loadImage("garcon.jpg");
  imgSimon2.resize(width, height);
  simon2 = createImage(displayWidth, displayHeight, RGB);
  imgSimon2.loadPixels();
  simon2 = imgSimon2.get();

  imgEstelle2 = loadImage("binoche30.jpg");
  imgEstelle2.resize(width, height);
  estelle2 = createImage(displayWidth, displayHeight, RGB);
  imgEstelle2.loadPixels();
  estelle2 = imgEstelle2.get();

  bus = RWMidi.getInputDevices()[3].createInput(this);
  background(0);
}

void noteOnReceived(Note note) {
  //pad1 = 36
  //pad2 = 37
  //pad3 = 38
  //pad4 = 39
  //pad5 = 40
  //pad6 = 41
  //pad7 = 42
  //pad8 = 43
  println(note.getPitch());
  if (fin == false) {
    if (note.getPitch() == 36) {
      //laura
      if (lauraCamp) {
        lauraCamp = false;
      } else {
        lauraCamp = true;
      }
    }
    if (note.getPitch() == 37) {
      //simon
      if (simonCamp) {
        simonCamp = false;
      } else {
        simonCamp = true;
      }
    }
    if (note.getPitch() == 38) {
      //estelle
      if (estelleCamp) {
        estelleCamp = false;
      } else {
        estelleCamp = true;
      }
    }
    if (note.getPitch() == 39) {
      //hudson
      if (hudsonCamp) {
        hudsonCamp = false;
      } else {
        hudsonCamp = true;
      }
    }
    if (note.getPitch() == 40) {
      if (lauraBack) {
        lauraBack = false;
      } else {
        lauraBack = true;
      }
    }
    if (note.getPitch() == 41) {
      if (simonBack) {
        simonBack = false;
      } else {
        simonBack = true;
      }
    }
    if (note.getPitch() == 42) {
      if (estelleBack) {
        estelleBack = false;
      } else {
        estelleBack = true;
      }
    }
    if (note.getPitch() == 43) {
      if (hudsonBack) {
        hudsonBack = false;
      } else {
        hudsonBack = true;
      }
    }
  } else {
    if (note.getPitch() == 36) {
      //laura
      if (laura2Camp) {
        laura2Camp = false;
      } else {
        laura2Camp = true;
      }
    }
    if (note.getPitch() == 37) {
      //simon
      if (simon2Camp) {
        simon2Camp = false;
      } else {
        simon2Camp = true;
      }
    }
    if (note.getPitch() == 38) {
      //estelle
      if (estelle2Camp) {
        estelle2Camp = false;
      } else {
        estelle2Camp = true;
      }
    }
    if (note.getPitch() == 39) {
      //hudson
      if (hudson2Camp) {
        hudson2Camp = false;
      } else {
        hudson2Camp = true;
      }
    }
    if (note.getPitch() == 40) {
      if (laura2Back) {
        laura2Back = false;
      } else {
        laura2Back = true;
      }
    }
    if (note.getPitch() == 41) {
      if (simon2Back) {
        simon2Back = false;
      } else {
        simon2Back = true;
      }
    }
    if (note.getPitch() == 42) {
      if (estelle2Back) {
        estelle2Back = false;
      } else {
        estelle2Back = true;
      }
    }
    if (note.getPitch() == 43) {
      if (hudson2Back) {
        hudson2Back = false;
      } else {
        hudson2Back = true;
      }
    }
  }
  if (note.getPitch() == 0) {
    juliette = true;
  }
  if (note.getPitch() == 1) {
    cafe = true;
  }
  if (note.getPitch() == 2) {
    if (fin) {
      fin = false;
    } else {
      fin = true;
    }
  }
}

void controllerChangeReceived(Controller cc) {
  if (cc.getCC() == 1) {
    un = cc.getValue();
  }
  if (cc.getCC() == 2) {
    deux = cc.getValue();
  }
  if (cc.getCC() == 3) {
    trois = cc.getValue();
  }
  if (cc.getCC() == 4) {
    quatre = cc.getValue();
  }
}

void rand(PImage img) {
  img.loadPixels();
  for (int x = 0; x< img.width; x++) {
    for (int y = 0; y< img.height; y++) {
      int loc = x+y*img.width;
      int loc2 = x + int(random(-rand, rand)) + y + int(random(-rand, rand)) * img.width;
      if (loc2 < img.pixels.length && loc2 >= 0) {
        color temp = img.pixels[loc];
        img.pixels[loc] = img.pixels[loc2] += 400;
        img.pixels[loc2] = temp += moins;
      }
    }
  }
  img.updatePixels();
  tint(255, alpha);
  image(img, 0, 0);
}

void randFin(PImage img) {
  img.loadPixels();
  for (int x = 0; x< img.width; x++) {
    for (int y = 0; y< img.height; y++) {
      int loc = x+y*img.width;
      int loc2 = x + int(random(-rand, rand)) + y + int(random(-rand, rand)) * img.width;
      if (loc2 < img.pixels.length && loc2 >= 0) {
        color temp = img.pixels[loc];
        img.pixels[loc] = img.pixels[loc2];
        img.pixels[loc2] = temp;
      }
    }
  }
  img.updatePixels();
  tint(255, alpha);
  image(img, 0, 0);
}

void contour(PImage ori, PImage process) {
  process.loadPixels();
  for (int x = 0; x< process.width; x++) {
    for (int y = 0; y< process.height; y++) {
      int loc = x+y*process.width;
      int loc2 = x+y*process.width + 1;
      if (loc2 < process.pixels.length && loc2 >= 0) {
        int diff1 = abs(process.pixels[loc] - ori.pixels[loc]);
        int diff2 = abs(process.pixels[loc2] - ori.pixels[loc]); 
        if (diff1 > diff2) {
          color temp = process.pixels[loc];
          process.pixels[loc] = process.pixels[loc2];
          process.pixels[loc2] = temp ;
        }
      }
    }
  }
  process.updatePixels();
  tint(255, alpha);
  image(process, 0, 0);
}

void draw() {

  alpha = map(un, 0, 127, 0, 50);
  //alpha = 20;
  moins = map(deux, 0, 127, -10, 1000);
  blancAlpha = map(trois, 0, 127, 0, 255);
  noirAlpha = map(quatre, 0, 127, 0, 255);

  if (frameCount == 50) {
    lauraCamp = false;
    simonCamp = false;
    estelleCamp = false;
    hudsonCamp = false;
  }

  if (juliette == true) {
    if (tete <= 156) {
      data = sol.loadImageToBuffer("binoche"+ tete +".jpg");
      sol.loadBufferasHeight(data, 250, 0);
      stroke(0, jAlpha);
      strokeWeight(1);
      sol.drawLines(true, false, true);
      sol.display();
      if (tete < 136 && jAlpha < 255) {
        jAlpha += 10;
      }
      if (tete > 126 && jAlpha > 0) {
        jAlpha -= 15;
      }
      tete ++;
    } else {
      juliette = false;
      tete = 1;
    }
  }

  if (cafe == true) {
    if (tete <= 823) {
      data = sol.loadImageToBuffer("cafe"+ tete +".jpg");
      sol.loadBufferasHeight(data, 250, 0);
      stroke(180, jAlpha);
      strokeWeight(1);
      sol.drawLines(true, false, true);
      sol.display();
      if (tete < 136 && jAlpha < 255) {
        jAlpha += 10;
      }
      if (tete > 700 && jAlpha > 0) {
        jAlpha -= 15;
      }
      tete ++;
    } else {
      cafe = false;
      tete = 1;
    }
  }
  if (fin == false) {
    if (hudsonCamp) {
      rand(hudson);
    } 
    if (hudsonBack) {
      contour(imgHudson, hudson);
    }
    if (lauraCamp) {
      rand(laura);
    }
    if (lauraBack) {
      contour(imgLaura, laura);
    }
    if (simonCamp) {
      rand(simon);
    }
    if (simonBack) {
      contour(imgSimon, simon);
    }

    if (estelleCamp) {
      rand(estelle);
    }
    if (estelleBack) {
      contour(imgEstelle, estelle);
    }
  } else {
    if (hudson2Camp) {
      randFin(hudson2);
    } 
    if (hudson2Back) {
      contour(imgHudson2, hudson2);
    }
    if (laura2Camp) {
      randFin(laura2);
    }
    if (laura2Back) {
      contour(imgLaura2, laura2);
    }
    if (simon2Camp) {
      randFin(simon2);
    }
    if (simon2Back) {
      contour(imgSimon2, simon2);
    }
    if (estelle2Camp) {
      randFin(estelle2);
    }
    if (estelle2Back) {
      contour(imgEstelle2, estelle2);
    }
  }

  if (fin == false) {
    println("lauraBack : "+lauraBack, "| simonBack : "+simonBack, "| estelleBack : "+estelleBack, "| hudsonBack : "+hudsonBack);
    println("laura     : "+lauraCamp, "|  simon    : "+simonCamp, "| estelle     : "+estelleCamp, "| hudson     : "+hudsonCamp);
  } else {
    println("FIN : lauraBack : "+laura2Back, "| simonBack : "+simon2Back, "| estelleBack : "+estelle2Back, "| hudsonBack : "+hudson2Back);
    println("FIN : laura     : "+laura2Camp, "|  simon    : "+simon2Camp, "| estelle     : "+estelle2Camp, "| hudson     : "+hudson2Camp);
  }
  println(frameRate);
  println(fin);

  fill(250, blancAlpha);
  rect(0, 0, width, height);

  fill(0, noirAlpha);
  rect(0, 0, width, height);
}
