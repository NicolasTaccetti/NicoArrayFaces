int numCols = 3;
int numRows= 3;// Number of columns of faces
int faceSize = 100; // Size of each face
int total;        // Total value of all expressions
String courtCase;
PImage alito, roberts, jackson, gorsuch, barrett, thomas, kagan, sotomayor, kavanaugh;
String[] justices={"roberts", "thomas", "alito", "sotomayor", "kagan", "gorsuch", "kavanaugh", "barrett", "jackson"};
double[] leanings={0.42,2.358,2.568,-4.09,-2.067,1.077,0.446,0.821, -1.704};
double[] caseVals={1.0,2.2,3.0,3.0};
 String[] rulingList={"Engel v. Vitale", "Brown v. Board", "Gideon v. Wainwright", "Mapp v. Ohio"}; 
String courtRuling;

void setup() {
    size(700, 700);  // Set window size
    noLoop();        // Ensures draw() only runs once


    roberts=loadImage("roberts.png");
     thomas=loadImage("thomas.png");
       alito=loadImage("alito.png");
       sotomayor=loadImage("sotomayor.png");
         kagan=loadImage("kagan.png");
        gorsuch=loadImage("gorsuch.png");
        kavanaugh=loadImage("kavanaugh.png");
        barrett=loadImage("barrett.png");
        jackson=loadImage("jackson.png");
    

    // Debugging: Check if images loaded
    //if (f1 == null) println("Error loading 1.png");
    //if (f2 == null) println("Error loading 2.png");
    //if (f3 == null) println("Error loading 3.png");
    //if (f4 == null) println("Error loading 4.png");
    //if (f5 == null) println("Error loading 5.png");
}

void draw() {
  noLoop();
    background(0);  // Black background
    total = 0;      // Reset total for each draw
    courtRuling = "";
    int caseNumber=(int)(Math.random() * rulingList.length);
    String caseName = rulingList[caseNumber];

    // Generate and display faces directly
    for (int i = 0; i < numRows; i++) {
        for (int j = 0; j < numCols; j++) {
            Justice justice = new Justice(3*i+j);
            justice.show();
            if(justice.getLeaning()<=caseVals[caseNumber])
            {
            
            fill(31, 148, 41,150);
            rect(200+(justice.getWhichOne()%3)*100,200+(justice.getWhichOne()-(justice.getWhichOne()%3))*33.33,100,100);
            
            total++;
            }
            else
            fill(201, 26, 26,150);
            rect(200+(justice.getWhichOne()%3)*100,200+(justice.getWhichOne()-(justice.getWhichOne()%3))*33.33,100,100);
            
        }
    }
    
    fill(255);
    text(caseName,100,100);
    textSize(24);

    // Assign correct vibe level
}

void mousePressed() {
    redraw(); // Reset face expression when the mouse is pressed
}

class Justice {
    int whichOne;
    double leaning;
    String name;
   

    Justice(int x) {
        // The "this" keyword distinguishes instance variables from parameters with the same name
        whichOne=x;
        name=justices[x];
        leaning=leanings[x];
    }
 double getLeaning()
 {
   return leaning;
 }
int getWhichOne()
{
  return whichOne;
}

    void show() {
        PImage img = null;
        if (whichOne == 0) img = roberts;
        else if (whichOne == 1) img = thomas;
        else if (whichOne == 2) img = alito;
        else if (whichOne == 3) img = sotomayor;
        else if (whichOne == 4) img = kagan;
        else if (whichOne==5) img = gorsuch;
        else if (whichOne==6) img = kavanaugh;
        else if (whichOne==7) img = barrett;
        else if (whichOne==8) img = jackson;
        
        if (img != null) {
            image(img, 200+(whichOne%3)*100, 200+(whichOne-(whichOne%3))*33.33, faceSize, faceSize);
        }
    }
    }
