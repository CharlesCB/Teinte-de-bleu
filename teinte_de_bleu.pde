import rwmidi.*;
import processing.opengl.*;
import toxi.geom.*;
import plethora.core.*;
import peasy.*;

MidiInput bus;

PImage imgFace, face, imgGarcon, garcon, imgJu, ju, imgPaysage, paysage;
PImage imgFace2, face2, imgGarcon2, garcon2, imgJu2, ju2, imgPaysage2, paysage2;
float rand = 2;
float alpha = 35;
float blancAlpha = 0;
float noirAlpha = 0;
float un, deux, trois, quatre;
float plus, moins;
boolean faceBool = true, garconBool = true, juCamp = true, paysageCamp = true;
boolean paysageBack = false, garconBack = false, faceBack=false, juBack = false; 
boolean face2Camp = false, garcon2Camp = false, ju2Camp = false, paysage2Camp = false;
boolean paysage2Back = false, garcon2Back = false, face2Back=false, ju2Back = false; 
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

  imgPaysage = loadImage("paysage.jpg");
  imgPaysage.resize(width, height);
  paysage = createImage(displayWidth, displayHeight, RGB);
  imgPaysage.loadPixels();
  paysage = imgPaysage.get();

  imgFace = loadImage("julietteFace.jpg");
  imgFace.resize(width, height);
  face = createImage(displayWidth, displayHeight, RGB);
  imgFace.loadPixels();
  face = imgFace.get();

  imgGarcon = loadImage("garcon.jpg");
  imgGarcon.resize(width, height);
  garcon = createImage(displayWidth, displayHeight, RGB);
  imgGarcon.loadPixels();
  garcon = imgGarcon.get();

  imgJu = loadImage("binoche30.jpg");
  imgJu.resize(width, height);
  ju = createImage(displayWidth, displayHeight, RGB);
  imgJu.loadPixels();
  ju = imgJu.get();

  imgPaysage2 = loadImage("paysage.jpg");
  imgPaysage2.resize(width, height);
  paysage2 = createImage(displayWidth, displayHeight, RGB);
  imgPaysage2.loadPixels();
  paysage2 = imgPaysage2.get();

  imgFace2 = loadImage("julietteFace.jpg");
  imgFace2.resize(width, height);
  face2 = createImage(displayWidth, displayHeight, RGB);
  imgFace2.loadPixels();
  face2 = imgFace2.get();

  imgGarcon2 = loadImage("garcon.jpg");
  imgGarcon2.resize(width, height);
  garcon2 = createImage(displayWidth, displayHeight, RGB);
  imgGarcon2.loadPixels();
  garcon2 = imgGarcon2.get();

  imgJu2 = loadImage("binoche30.jpg");
  imgJu2.resize(width, height);
  ju2 = createImage(displayWidth, displayHeight, RGB);
  imgJu2.loadPixels();
  ju2 = imgJu2.get();

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
      //face
      if (faceBool) {
        faceBool = false;
      } else {
        faceBool = true;
      }
    }
    if (note.getPitch() == 37) {
      //garcon
      if (garconBool) {
        garconBool = false;
      } else {
        garconBool = true;
      }
    }
    if (note.getPitch() == 38) {
      //ju
      if (juCamp) {
        juCamp = false;
      } else {
        juCamp = true;
      }
    }
    if (note.getPitch() == 39) {
      //paysage
      if (paysageCamp) {
        paysageCamp = false;
      } else {
        paysageCamp = true;
      }
    }
    if (note.getPitch() == 40) {
      if (faceBack) {
        faceBack = false;
      } else {
        faceBack = true;
      }
    }
    if (note.getPitch() == 41) {
      if (garconBack) {
        garconBack = false;
      } else {
        garconBack = true;
      }
    }
    if (note.getPitch() == 42) {
      if (juBack) {
        juBack = false;
      } else {
        juBack = true;
      }
    }
    if (note.getPitch() == 43) {
      if (paysageBack) {
        paysageBack = false;
      } else {
        paysageBack = true;
      }
    }
  } else {
    if (note.getPitch() == 36) {
      //face
      if (face2Camp) {
        face2Camp = false;
      } else {
        face2Camp = true;
      }
    }
    if (note.getPitch() == 37) {
      //garcon
      if (garcon2Camp) {
        garcon2Camp = false;
      } else {
        garcon2Camp = true;
      }
    }
    if (note.getPitch() == 38) {
      //ju
      if (ju2Camp) {
        ju2Camp = false;
      } else {
        ju2Camp = true;
      }
    }
    if (note.getPitch() == 39) {
      //paysage
      if (paysage2Camp) {
        paysage2Camp = false;
      } else {
        paysage2Camp = true;
      }
    }
    if (note.getPitch() == 40) {
      if (face2Back) {
        face2Back = false;
      } else {
        face2Back = true;
      }
    }
    if (note.getPitch() == 41) {
      if (garcon2Back) {
        garcon2Back = false;
      } else {
        garcon2Back = true;
      }
    }
    if (note.getPitch() == 42) {
      if (ju2Back) {
        ju2Back = false;
      } else {
        ju2Back = true;
      }
    }
    if (note.getPitch() == 43) {
      if (paysage2Back) {
        paysage2Back = false;
      } else {
        paysage2Back = true;
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
    faceBool = false;
    garconBool = false;
    juCamp = false;
    paysageCamp = false;
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
    if (paysageCamp) {
      rand(paysage);
    } 
    if (paysageBack) {
      contour(imgPaysage, paysage);
    }
    if (faceBool) {
      rand(face);
    }
    if (faceBack) {
      contour(imgFace, face);
    }
    if (garconBool) {
      rand(garcon);
    }
    if (garconBack) {
      contour(imgGarcon, garcon);
    }

    if (juCamp) {
      rand(ju);
    }
    if (juBack) {
      contour(imgJu, ju);
    }
  } else {
    if (paysage2Camp) {
      randFin(paysage2);
    } 
    if (paysage2Back) {
      contour(imgPaysage2, paysage2);
    }
    if (face2Camp) {
      randFin(face2);
    }
    if (face2Back) {
      contour(imgFace2, face2);
    }
    if (garcon2Camp) {
      randFin(garcon2);
    }
    if (garcon2Back) {
      contour(imgGarcon2, garcon2);
    }
    if (ju2Camp) {
      randFin(ju2);
    }
    if (ju2Back) {
      contour(imgJu2, ju2);
    }
  }

  if (fin == false) {
    println("faceBack : "+faceBack, "| garconBack : "+garconBack, "| juBack : "+juBack, "| paysageBack : "+paysageBack);
    println("face     : "+faceBool, "|  garcon    : "+garconBool, "| ju     : "+juCamp, "| paysage     : "+paysageCamp);
  } else {
    println("FIN : faceBack : "+face2Back, "| garconBack : "+garcon2Back, "| juBack : "+ju2Back, "| paysageBack : "+paysage2Back);
    println("FIN : face     : "+face2Camp, "|  garcon    : "+garcon2Camp, "| ju     : "+ju2Camp, "| paysage     : "+paysage2Camp);
  }
  println(frameRate);
  println(fin);

  fill(250, blancAlpha);
  rect(0, 0, width, height);

  fill(0, noirAlpha);
  rect(0, 0, width, height);
}
