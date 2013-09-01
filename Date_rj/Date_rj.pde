
DATE(rj) { return "Design, Arte e Tecnologias Emergentes – Rio de Janeiro"; }

////////////////////////////////////////////////////////////////////////////////////

void when() {
if ( day >= 17 && day <= 22 && month == 06 && year == 2014 ) { start(); } }

/* That’s right! During the World Cup!  */

/////////////////////////////////////////////////////////////////////////////////////

String[] what = [ "Tangible Interfaces", "Generative Art", "Creative Coding", "Interaction Design",
"Interactive Instalations", "Map Projection", "Robotics", "Augmented Reality", "3D Printing", "and much more" ];

/////////////////////////////////////////////////////////////////////////////////////

String where = "Fudição Progresso, Lapa, Rio de Janeiro";

/////////////////////////////////////////////////////////////////////////////////////

String[] speakers = [

   "Daniel Morena – 32bits"
   "Lucas Werthein – Superuber",
   "João Bonelli – LIFE, ITP, PUC-Rio",
   "Clelio de Paula – WeSense",
   "Marcelo - Caos!",
   "Jorge Lopes – NEXT, RCA", 
   "Rejane Splitz – NAE, PUC-Rio",
   "Cadu Lacerda – AppMobCom, Ana Couto Branding",
   "Marco Meggiolaro – RioBots",
   "Marcelo Coelho – MIT Media Lab",
   "Katia Vega – PUC-Rio",
   "Davidson Fellipe – Globo.com, BrasilJS"
   
];

}
//////////////////////////////////////////////////////////////////////////////////////

/* Possible Supporters: Globo, PUC-Rio, RCA, Superuber, 32bits, Caos, FILE, Multiplicidade, 
SIGGRAPH, Defcon, Maker Magazine, Sparkfun, Adafruit, CreativeApplications, ArsEletronica, 
ITP, MIT Media Lab, Multilógica, Laboratório de Garagem, Parsons, Pratt, Google Glass, Meta, 
Leap Motion, OculusRift, Microsoft Kinect, Apple, Disney, CIID, IDEO, Oi Futuro, ReinoStudio, 
Domus Academy, Hub9,  */

//////////////////////////////////////////////////////////////////////////////////////

void try() {
  
  //These technologies will be available for tests:
  
  while(date) {
    
    LeapMotion();
    OculusRift();
    4kDisplay();
    FlexibleScreens();
    Meta();
    GoogleGlass();
    Kinect2();
    3DPrinters();
    
  }
  
}

//////////////////////////////////////////////////////////////////////////////////////
  
void workshops() {

  // Workshops available during the event

  while(date) {

    Processing();
    Arduino();
    RaspberryPi();
    Unity3D();
    OpenFrameworks();

    }

}

//////////////////////////////////////////////////////////////////////////////////////

void application() {

  int price = 200.00; // Brazilian Reais (R$);

  if(student) {

    price = 100.00 // Brazilian Reais (R$);

  }

}

//////////////////////////////////////////////////////////////////////////////////////

/* AND MUCH MORE!! Student challenges, best projects awards, craziest parties, ... */

///////////////////////////////////////////////////////////////////////////////////////

void contact() {

  String email = "rafaelgcrespo@gmail.com";
  int phone = +55-21-9753-5219;

}

//////////////////////////////////////////////////////////////////////////////////////

void thankYou() {

  println(" Thank you for your support! See you there! ;) ");

}


  
  
  
  

