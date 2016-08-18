{Torres de Hanoi - con elementos gráficos en PASCAL DOS}

PROGRAM TORRES_DE_HANOI;
USES CRT,GRAPH;
CONST MAX=7;
      AZU=1;
      AMA=14;
      ROJ=4;
      MAG=5;

TYPE ARR=ARRAY[1..MAX] OF INTEGER;
     STR13=ARRAY[1..13] OF CHAR;
VAR  V1,V2,V3,GD,GM,SAL,CONTA,CONT:INTEGER;
     A,B,C:ARR;
     FANTASMA :POINTER;
     CONTSTR:STRING[3];

FUNCTION VALIDA(C:CHAR):INTEGER;
VAR V:INTEGER;
BEGIN
   CASE (C) OF
     'A','B','C':BEGIN
                   V:=1;
                  END;
     'S':BEGIN
          V:=2;
         END;
     ELSE
       BEGIN
        V:=0;
       END;
   END;
  VALIDA:=V;
END;

PROCEDURE INICIAA;
VAR I:INTEGER;
BEGIN
 FOR I:=1 TO MAX DO
 BEGIN
  A[I]:=0;
 END;
END;

PROCEDURE INICIAB;
VAR I:INTEGER;
BEGIN
 FOR I:=1 TO MAX DO
 BEGIN
  B[I]:=0;
 END;
END;

PROCEDURE INICIAC;
VAR I:INTEGER;
BEGIN
 FOR I:=1 TO MAX DO
 BEGIN
  C[I]:=0;
 END;
END;

FUNCTION TOPE(PILA:ARR):INTEGER;
VAR I,TOP:INTEGER;
BEGIN
 TOP:=0;
 FOR I:=1 TO MAX DO
 BEGIN
  IF (PILA[I]<>0) THEN
   BEGIN
    TOP:=I;
   END;
 END;
 TOPE:=TOP;
END;

FUNCTION VACIA(PILA:ARR):INTEGER;
VAR I,V:INTEGER;
BEGIN
  I:=TOPE(PILA);
  IF (I=0) THEN
   V:=0
  ELSE
   V:=I;
  VACIA:=V;
END;

PROCEDURE SUPRIMEA(PILA:ARR);
VAR I:INTEGER;
BEGIN
   I:=TOPE(PILA);
   A[I]:=0;
END;

PROCEDURE SUPRIMEB(PILA:ARR);
VAR I:INTEGER;
BEGIN
   I:=TOPE(PILA);
   B[I]:=0;
END;

PROCEDURE SUPRIMEC(PILA:ARR);
VAR I:INTEGER;
BEGIN
   I:=TOPE(PILA);
   C[I]:=0;
END;

PROCEDURE METEA(PILA:ARR;X:INTEGER);
VAR C:INTEGER;
BEGIN
 C:=TOPE(PILA);
 A[C+1]:=X;
END;

PROCEDURE METEB(PILA:ARR;X:INTEGER);
VAR C:INTEGER;
BEGIN
 C:=TOPE(PILA);
 B[C+1]:=X;
END;

PROCEDURE METEC(PILA:ARR;X:INTEGER);
VAR C1:INTEGER;
BEGIN
 C1:=TOPE(PILA);
 C[C1+1]:=X;
END;

FUNCTION SACA(PILA:ARR):INTEGER;
VAR V:INTEGER;
BEGIN
  V:=PILA[TOPE(PILA)];
  SACA:=V;
END;

PROCEDURE INICIA_GRAFICOS;
BEGIN
     GD:=DETECT;
     InitGraph(GD, GM, 'C:\JUEGOS\THANOI');
     IF GraphResult <> grOk then Halt(1);
END;

PROCEDURE PREC;
BEGIN
     BEGIN
       SETCOLOR(BLACK);
       SETFILLSTYLE(1,BLACK);
       CIRCLE(GETMAXX DIV 2,GETMAXY DIV 2,100);
       FLOODFILL(GETMAXX DIV 2,GETMAXY DIV 2,BLACK);
       SETCOLOR(WHITE);
       ARC(GETMAXX DIV 2,GETMAXY DIV 2,180,360,60);
       SETFILLSTYLE(1,WHITE);
       FILLELLIPSE(GETMAXX DIV 2-30,GETMAXY DIV 2-40,10,20);
       FILLELLIPSE(GETMAXX DIV 2+30,GETMAXY DIV 2-40,10,20);
       SETTEXTSTYLE(10,0,3);
       SETCOLOR(GREEN);
       OUTTEXTXY(15,30,'PROGRAMACION ESTRUCTURDA I');
       SETTEXTSTYLE(4,0,5);
       SETCOLOR(RED);
       OUTTEXTXY(110,370,'TORRES DE HANOI');
     END;
READKEY;
CLOSEGRAPH;
END;

PROCEDURE GANO;
BEGIN
     BEGIN
       CLEARDEVICE;
       SETCOLOR(LIGHTBLUE);
       SETFILLSTYLE(1,LIGHTBLUE);
       ARC(40,40,0,180,20);
       LINE(20,40,20,60);
       LINE(20,60,25,55);
       LINE(25,55,30,60);
       LINE(30,60,35,55);
       LINE(35,55,40,60);
       LINE(40,60,45,55);
       LINE(45,55,50,60);
       LINE(50,60,55,55);
       LINE(55,55,60,60);
       LINE(60,60,60,40);
       SETCOLOR(WHITE);
       ARC(40,43,200,350,10);
       SETFILLSTYLE(1,WHITE);
       FILLELLIPSE(35,35,4,5);
       FILLELLIPSE(45,35,4,5);
       SETFILLSTYLE(1,BLUE);
       FILLELLIPSE(35,38,2,2);
       FILLELLIPSE(45,38,2,2);
       GETMEM(FANTASMA,IMAGESIZE(20,20,60,60));
       GETIMAGE(20,20,60,60,FANTASMA^);
       CLEARDEVICE;
       PUTIMAGE(((GETMAXX DIV 2)-20),((GETMAXY DIV 2)-20),FANTASMA^,XORPUT);
       SETTEXTSTYLE(10,0,3);
       SETCOLOR(GREEN);
       OUTTEXTXY(200,60,'FELICIDADES');
       SETTEXTSTYLE(2,0,5);
       SETCOLOR(MAGENTA);
       OUTTEXTXY(200,30,'LO HAS HECHO EN ');
       STR(CONT,CONTSTR);
       OUTTEXTXY(335,30,CONTSTR);
       OUTTEXTXY(360,30,'MOVIMIENTOS');
       SETTEXTSTYLE(4,0,5);
       SETCOLOR(RED);
       OUTTEXTXY(180,370,'HAS GANADO');
       BEGIN
        SOUND(970);DELAY(200);NOSOUND;
        SOUND(1100);DELAY(200);NOSOUND;
        SOUND(1230);DELAY(200);NOSOUND;
        SOUND(1330);DELAY(200);NOSOUND;
        SOUND(1472);DELAY(200);NOSOUND;
        SOUND(1650);DELAY(200);NOSOUND;
        SOUND(1830);DELAY(200);NOSOUND;
        SOUND(1960);DELAY(200);NOSOUND;
       END;
     END;
READLN;
CLOSEGRAPH;
END;

PROCEDURE INSTRUCCIONES;
BEGIN
 SETCOLOR(26);SETTEXTSTYLE(3,1,6);
 OUTTEXTXY(1,70,'INSTRUCCIONES');
 SETCOLOR(CYAN);SETTEXTSTYLE(7,0,6);
 OUTTEXTXY(95,10,'TORRES DE HANOI');
 SETCOLOR(9);SETTEXTSTYLE(7,0,6);
 OUTTEXTXY(100,12,'TORRES DE HANOI');
 SETCOLOR(RED);SETTEXTSTYLE(2,0,6);
 OUTTEXTXY(105,140,'PARA GANAR ESTE JUEGO DEBES :');
 OUTTEXTXY(105,160,'MOVER UNA PIEZA POR TURNO...');
 OUTTEXTXY(105,180,'NO SE PUEDE MONTAR UNA DE MAYOR');
 OUTTEXTXY(105,200,'TAMA¥O SOBRE UNA MAS PEQUE¥A. ');
 OUTTEXTXY(105,220,'EL JUEGO TERMINA AL LOGRAR COLOCAR');
 OUTTEXTXY(105,240,'TODOS LOS DISCOS DE LA TORRE "A"');
 OUTTEXTXY(105,260,'EN LA TORRE "C"');
 SETCOLOR(14);SETTEXTSTYLE(5,0,6);
 OUTTEXTXY(160,360,'BUENA SUERTE');
READKEY;
CLOSEGRAPH;
END;

PROCEDURE DIB_TORRES;
BEGIN
    TEXTCOLOR(AZU);
    GOTOXY(20,8);WRITE('A');DELAY(100);
    GOTOXY(20,10);WRITE('|');DELAY(50);
    GOTOXY(20,11);WRITE('|');DELAY(50);
    GOTOXY(20,12);WRITE('|');DELAY(50);
    GOTOXY(20,13);WRITE('|');DELAY(50);
    GOTOXY(20,14);WRITE('|');DELAY(50);
    GOTOXY(20,15);WRITE('|');DELAY(50);
    GOTOXY(20,16);WRITE('|');DELAY(50);
    GOTOXY(14,17);WRITE('-------------');DELAY(50);
    TEXTCOLOR(AMA);
    GOTOXY(40,8);WRITE('B');DELAY(100);
    GOTOXY(40,10);WRITE('|');DELAY(50);
    GOTOXY(40,11);WRITE('|');DELAY(50);
    GOTOXY(40,12);WRITE('|');DELAY(50);
    GOTOXY(40,13);WRITE('|');DELAY(50);
    GOTOXY(40,14);WRITE('|');DELAY(50);
    GOTOXY(40,15);WRITE('|');DELAY(50);
    GOTOXY(40,16);WRITE('|');DELAY(50);
    GOTOXY(34,17);WRITE('-------------');DELAY(50);
    TEXTCOLOR(ROJ);
    GOTOXY(60,8);WRITE('C');DELAY(100);
    GOTOXY(60,10);WRITE('|');DELAY(50);
    GOTOXY(60,11);WRITE('|');DELAY(50);
    GOTOXY(60,12);WRITE('|');DELAY(50);
    GOTOXY(60,13);WRITE('|');DELAY(50);
    GOTOXY(60,14);WRITE('|');DELAY(50);
    GOTOXY(60,15);WRITE('|');DELAY(50);
    GOTOXY(60,16);WRITE('|');DELAY(50);
    GOTOXY(54,17);WRITE('-------------');DELAY(50);
END;

PROCEDURE DIB_TORREA;
BEGIN
    TEXTCOLOR(AZU);
    GOTOXY(14,8);WRITE('      A      ');
    GOTOXY(14,10);WRITE('      |      ');
    GOTOXY(14,11);WRITE('      |      ');
    GOTOXY(14,12);WRITE('      |      ');
    GOTOXY(14,13);WRITE('      |      ');
    GOTOXY(14,14);WRITE('      |      ');
    GOTOXY(14,15);WRITE('      |      ');
    GOTOXY(14,16);WRITE('      |      ');
    GOTOXY(14,17);WRITE('-------------');
END;

PROCEDURE DIB_TORREB;
BEGIN
    TEXTCOLOR(AMA);
    GOTOXY(34,8);WRITE('      B       ');
    GOTOXY(34,10);WRITE('      |      ');
    GOTOXY(34,11);WRITE('      |      ');
    GOTOXY(34,12);WRITE('      |      ');
    GOTOXY(34,13);WRITE('      |      ');
    GOTOXY(34,14);WRITE('      |      ');
    GOTOXY(34,15);WRITE('      |      ');
    GOTOXY(34,16);WRITE('      |      ');
    GOTOXY(34,17);WRITE('-------------');
END;

PROCEDURE DIB_TORREC;
BEGIN
    TEXTCOLOR(ROJ);
    GOTOXY(54,8);WRITE('      C');
    GOTOXY(54,10);WRITE('      |      ');
    GOTOXY(54,11);WRITE('      |      ');
    GOTOXY(54,12);WRITE('      |      ');
    GOTOXY(54,13);WRITE('      |      ');
    GOTOXY(54,14);WRITE('      |      ');
    GOTOXY(54,15);WRITE('      |      ');
    GOTOXY(54,16);WRITE('      |      ');
    GOTOXY(54,17);WRITE('-------------');
END;

PROCEDURE TDISCO(T,COL,LIN:INTEGER);
VAR I,EB,EAE,C:INTEGER;
    IMP:STR13;
BEGIN
 EB:=7-T;
 EAE:=EB+1;

 FOR I:=1 TO 13 DO
 BEGIN
   IMP[I]:=' ';
 END;

 C:=0;
 FOR I:=EAE TO (13-EB) DO
 BEGIN
   C:=C+1;
   IMP[EAE]:='±';
   EAE:=EAE+2;
   IF (C=T) THEN
   BEGIN
    I:=13-EB;
   END;
 END;
   TEXTCOLOR(MAG);
   GOTOXY(COL,LIN);
   WRITE(IMP);
END;

PROCEDURE DIBDISCOS(PILA:ARR;COL,LIN:INTEGER);
VAR I,N,L,K,M,J:INTEGER;
BEGIN
    L:=LIN;
    M:=TOPE(PILA);
    TEXTCOLOR(MAG);
    FOR I:=1 TO M DO
     BEGIN
      TDISCO(PILA[I],COL,L);
      L:=L-1;
     END;
TEXTCOLOR(WHITE);
END;

PROCEDURE DISCOS;
VAR N,I,L,K,V:INTEGER;
    C:CHAR;
BEGIN
   REPEAT
    GOTOXY(16,20); TEXTCOLOR(CYAN);
    WRITE('INGRESE EL VALOR DE DISCOS A JUGAR(7MAX): ');
    C:=READKEY;
    VAL(C,N,V);
    GOTOXY(58,20);
    WRITE(C);
   UNTIL (N<=7) AND (V=0);

      FOR I:=1 TO N DO
        BEGIN
            METEA(A,((N+1)-I));
            TEXTCOLOR(13);
        END;
    L:=16;
    K:=N;
    TEXTCOLOR(MAG);
    FOR I:=1 TO N DO
     BEGIN
      TDISCO(K,14,L);
      L:=L-1;
      K:=K-1;
     END;
END;

PROCEDURE MOVIMIENTOS;
VAR MOVI,MOVF,I,F:CHAR;
    N,K,M,MI,MF:INTEGER;

BEGIN
     TEXTCOLOR(WHITE);
     GOTOXY(30,22);
     WRITE('   ');
     GOTOXY(35,23);
     WRITE('   ');
     GOTOXY(1,22);
     WRITE('INGRESE MOVIMIENTO DE INICIO: ');
     I:=READKEY;
     MOVI:=UPCASE(I);
     GOTOXY(31,22);
     WRITE(I);
     MI:=VALIDA(MOVI);
     IF MI<1 THEN
     BEGIN
           GOTOXY(43,22);TEXTCOLOR(30);
           WRITE('LETRA INCORRECTA!');
           READKEY;
           GOTOXY(43,22);TEXTCOLOR(10);
           WRITE('                   ');TEXTCOLOR(15);
     END;
     IF MI=2 THEN
     BEGIN
      SAL:=1;
     END
     ELSE
     BEGIN
     GOTOXY(1,23);
     WRITE('INGRESE MOVIMIENTO FINAL DE DISCO: ');
     F:=READKEY;
     MOVF:=UPCASE(F);
     GOTOXY(37,23);
     WRITE(F);
     MF:=VALIDA(MOVF);
     IF MF<1 THEN
     BEGIN
           GOTOXY(43,22);TEXTCOLOR(30);
           WRITE('LETRA INCORRECTA!');
           READKEY;
           GOTOXY(43,22);TEXTCOLOR(10);
           WRITE('                   ');TEXTCOLOR(15);
     END;
     IF MF=2 THEN
     BEGIN
      SAL:=1;
     END;

     CASE MOVI OF
     'A':BEGIN
          IF (TOPE(A)=0) THEN
           BEGIN
                GOTOXY(43,22);TEXTCOLOR(30);
                WRITE('LA TORRE A ESTA VACIA');
                READKEY;
                GOTOXY(43,22);TEXTCOLOR(10);
                WRITE('                       ');
           END;
          CASE MOVF OF
          'B':BEGIN
                IF (VACIA(B)=0) THEN
                  BEGIN
                       N:=SACA(A);
                       METEB(B,N);
                       SUPRIMEA(A);
                       DIB_TORREA;
                       DIB_TORREB;
                       DIBDISCOS(A,14,16);
                       DIBDISCOS(B,34,16);
                  END
                ELSE
                 BEGIN
                    IF (SACA(A) < SACA(B)) THEN
                       BEGIN
                            N:=SACA(A);
                            METEB(B,N);
                            SUPRIMEA(A);
                            DIB_TORREA;
                            DIB_TORREB;
                            DIBDISCOS(A,14,16);
                            DIBDISCOS(B,34,16);
                       END
                    ELSE
                       BEGIN
                            GOTOXY(43,22);TEXTCOLOR(30);
                            WRITE('ESTE MOVIMIENTO NO ESTA PERMITIDO.');
                            READKEY;
                            GOTOXY(43,22);TEXTCOLOR(10);
                            WRITE('                                    ');
                       END;
                 END;
              END;
          'C':BEGIN
                IF (VACIA(C)=0) THEN
                  BEGIN
                       N:=SACA(A);
                       METEC(C,N);
                       SUPRIMEA(A);
                       DIB_TORREA;
                       DIB_TORREC;
                       DIBDISCOS(A,14,16);
                       DIBDISCOS(C,54,16);
                  END
                ELSE
                 BEGIN
                    IF (SACA(A) < SACA(C)) THEN
                       BEGIN
                            N:=SACA(A);
                            METEC(C,N);
                            SUPRIMEA(A);
                            DIB_TORREA;
                            DIB_TORREC;
                            DIBDISCOS(A,14,16);
                            DIBDISCOS(C,54,16);
                       END
                    ELSE
                       BEGIN
                            GOTOXY(43,22);TEXTCOLOR(30);
                            WRITE('ESTE MOVIMIENTO NO ESTA PERMITIDO.');
                            READKEY;
                            GOTOXY(43,22);TEXTCOLOR(10);
                            WRITE('                                    ');
                       END;
                 END;
              END;
          END;
         END;
     END;
     CASE MOVI OF
     'B':BEGIN
          IF (TOPE(B)=0) THEN
           BEGIN
                GOTOXY(43,22);TEXTCOLOR(30);
                WRITE('LA TORRE B ESTA VACIA');
                READKEY;
                GOTOXY(43,22);TEXTCOLOR(10);
                WRITE('                       ');
           END;
          CASE MOVF OF
          'A':BEGIN
                IF (VACIA(A)=0) THEN
                  BEGIN
                       N:=SACA(B);
                       METEA(A,N);
                       SUPRIMEB(B);
                       DIB_TORREB;
                       DIB_TORREA;
                       DIBDISCOS(B,34,16);
                       DIBDISCOS(A,14,16);
                  END
                ELSE
                 BEGIN
                    IF (SACA(B) < SACA(A)) THEN
                       BEGIN
                            N:=SACA(B);
                            METEA(A,N);
                            SUPRIMEB(B);
                            DIB_TORREB;
                            DIB_TORREA;
                            DIBDISCOS(B,34,16);
                            DIBDISCOS(A,14,16);
                       END
                    ELSE
                       BEGIN
                            GOTOXY(43,22);TEXTCOLOR(30);
                            WRITE('ESTE MOVIMIENTO NO ESTA PERMITIDO.');
                            READKEY;
                            GOTOXY(43,22);TEXTCOLOR(10);
                            WRITE('                                    ');
                       END;
                 END;
              END;
          'C':BEGIN
                IF (VACIA(C)=0) THEN
                  BEGIN
                       N:=SACA(B);
                       METEC(C,N);
                       SUPRIMEB(B);
                       DIB_TORREB;
                       DIB_TORREC;
                       DIBDISCOS(B,34,16);
                       DIBDISCOS(C,54,16);
                  END
                ELSE
                 BEGIN
                    IF (SACA(B) < SACA(C)) THEN
                       BEGIN
                            N:=SACA(B);
                            METEC(C,N);
                            SUPRIMEB(B);
                            DIB_TORREB;
                            DIB_TORREC;
                            DIBDISCOS(B,34,16);
                            DIBDISCOS(C,54,16);
                       END
                    ELSE
                       BEGIN
                            GOTOXY(43,22);TEXTCOLOR(30);
                            WRITE('ESTE MOVIMIENTO NO ESTA PERMITIDO.');
                            READKEY;
                            GOTOXY(43,22);TEXTCOLOR(10);
                            WRITE('                                    ');
                       END;
                 END;
              END;
          END;
         END;
     END;
     CASE MOVI OF
     'C':BEGIN
          IF (TOPE(C)=0) THEN
           BEGIN
                GOTOXY(43,22);TEXTCOLOR(30);
                WRITE('LA TORRE C ESTA VACIA');
                READKEY;
                GOTOXY(43,22);TEXTCOLOR(10);
                WRITE('                       ');
           END;
          CASE MOVF OF
          'A':BEGIN
                IF (VACIA(A)=0) THEN
                  BEGIN
                       N:=SACA(C);
                       METEA(A,N);
                       SUPRIMEC(C);
                       DIB_TORREC;
                       DIB_TORREA;
                       DIBDISCOS(C,54,16);
                       DIBDISCOS(A,14,16);
                  END
                ELSE
                 BEGIN
                    IF (SACA(C) < SACA(A)) THEN
                       BEGIN
                            N:=SACA(C);
                            METEA(A,N);
                            SUPRIMEC(C);
                            DIB_TORREC;
                            DIB_TORREA;
                            DIBDISCOS(C,54,16);
                            DIBDISCOS(A,14,16);
                       END
                    ELSE
                       BEGIN
                            GOTOXY(43,22);TEXTCOLOR(30);
                            WRITE('ESTE MOVIMIENTO NO ESTA PERMITIDO.');
                            READKEY;
                            GOTOXY(43,22);TEXTCOLOR(10);
                            WRITE('                                    ');
                       END;
                 END;
              END;
          'B':BEGIN
                IF (VACIA(B)=0) THEN
                  BEGIN
                       N:=SACA(C);
                       METEB(B,N);
                       SUPRIMEC(C);
                       DIB_TORREC;
                       DIB_TORREB;
                       DIBDISCOS(C,54,16);
                       DIBDISCOS(B,34,16);
                  END
                ELSE
                 BEGIN
                    IF (SACA(C) < SACA(B)) THEN
                       BEGIN
                            N:=SACA(C);
                            METEB(B,N);
                            SUPRIMEC(C);
                            DIB_TORREC;
                            DIB_TORREB;
                            DIBDISCOS(C,54,16);
                            DIBDISCOS(B,34,16);
                       END
                    ELSE
                       BEGIN
                            GOTOXY(43,22);TEXTCOLOR(30);
                            WRITE('ESTE MOVIMIENTO NO ESTA PERMITIDO.');
                            READKEY;
                            GOTOXY(43,22);TEXTCOLOR(10);
                            WRITE('                                    ');
                       END;
                 END;
              END;
          END;
       END;
     END;
   END;

   IF ((VACIA(A)=0) AND (VACIA(B)=0)) THEN
   BEGIN
    SAL:=2;
   END;
END;

PROCEDURE CREDITOS;
BEGIN
CLRSCR;
       DELAY(1500);
       GOTOXY(25,2);TEXTCOLOR(9);
       WRITE('UNIVERDIDAD CATOLICA DE HONDURAS');
       GOTOXY(26,3);TEXTCOLOR(9);
       WRITE('NUESTRA SE¥ORA REINA DE LA PAZ');DELAY(150);
       GOTOXY(26,6);TEXTCOLOR(4);
       WRITE('<< PROGRAMACION ESTRUCTURADA I>>');DELAY(150);
       TEXTCOLOR(11);
       GOTOXY(34,8);WRITE('_');DELAY(150);
       GOTOXY(34,8);WRITE(' ');DELAY(150);
       GOTOXY(34,8);WRITE('_');DELAY(150);
       GOTOXY(34,8);WRITE(' ');DELAY(150);
       GOTOXY(34,8);WRITE('_');DELAY(150);
       GOTOXY(34,8);WRITE(' ');DELAY(150);
       GOTOXY(34,8);WRITE('_');DELAY(150);
       GOTOXY(34,8);WRITE(' ');DELAY(150);
       GOTOXY(35,8);WRITE('I_');DELAY(150);
       GOTOXY(36,8);WRITE('N_');DELAY(150);
       GOTOXY(37,8);WRITE('G_');DELAY(150);
       GOTOXY(38,8);WRITE('._');DELAY(150);
       GOTOXY(39,8);WRITE(' R_');DELAY(150);
       GOTOXY(41,8);WRITE('A_');DELAY(150);
       GOTOXY(42,8);WRITE('U_');DELAY(150);
       GOTOXY(43,8);WRITE('L_');DELAY(150);
       GOTOXY(44,8);WRITE(' Z_');DELAY(150);
       GOTOXY(46,8);WRITE('E_');DELAY(150);
       GOTOXY(47,8);WRITE('R_');DELAY(150);
       GOTOXY(48,8);WRITE('O_');DELAY(150);
       GOTOXY(49,8);WRITE('N');DELAY(150);
       GOTOXY(50,8);WRITE(' ');DELAY(150);
       GOTOXY(50,8);WRITE('_');DELAY(150);
       GOTOXY(50,8);WRITE('_');DELAY(150);
       GOTOXY(50,8);WRITE(' ');DELAY(150);
       GOTOXY(50,8);WRITE('_');DELAY(150);
       GOTOXY(50,8);WRITE('_');DELAY(150);
       GOTOXY(50,8);WRITE(' ');DELAY(150);
       GOTOXY(50,8);WRITE('.');DELAY(150);
       GOTOXY(28,10);TEXTCOLOR(6);
       WRITE('PROYECTO "TORRES DE HANOI"');DELAY(150);
       GOTOXY(3,12);TEXTCOLOR(30);
       WRITE('INTEGRANTES:');DELAY(300);
       GOTOXY(1,14);TEXTCOLOR(10);
       WRITELN('DENNIS GARCIA      TG-200310269');DELAY(200);
       GOTOXY(38,22);TEXTCOLOR(8);
       WRITE('AGOSTO DEL 2003');
READLN;
END;

PROCEDURE TITULO;
VAR X:INTEGER;
BEGIN
TEXTBACKGROUND(BLACK);
CLRSCR;
     X:=1;
     REPEAT
     CLRSCR;
     GOTOXY(X,2);TEXTCOLOR(9);WRITE('JUEGO TORRES DE HANOI');
     GOTOXY(1,1);TEXTCOLOR(BLACK);WRITE(' ');
     DELAY(50);
     X:=X+1;
     UNTIL X > 28;
     TEXTCOLOR(10);
     GOTOXY(58,3);WRITE('_');DELAY(150);
     GOTOXY(58,3);WRITE(' ');DELAY(150);
     GOTOXY(58,3);WRITE('_');DELAY(150);
     GOTOXY(58,3);WRITE(' ');DELAY(150);
     GOTOXY(58,3);WRITE('_');DELAY(150);
     GOTOXY(58,3);WRITE(' ');DELAY(150);
     GOTOXY(58,3);WRITE('_');DELAY(150);
     GOTOXY(58,3);WRITE(' ');DELAY(150);
     GOTOXY(57,3);WRITE('"_');DELAY(150);
     GOTOXY(58,3);WRITE('S_');DELAY(150);
     GOTOXY(59,3);WRITE('"_');DELAY(150);
     GOTOXY(60,3);WRITE(' P_');DELAY(150);
     GOTOXY(62,3);WRITE('A_');DELAY(150);
     GOTOXY(63,3);WRITE('R_');DELAY(150);
     GOTOXY(64,3);WRITE('A_');DELAY(150);
     GOTOXY(65,3);WRITE(' S_');DELAY(150);
     GOTOXY(67,3);WRITE('A_');DELAY(150);
     GOTOXY(68,3);WRITE('L_');DELAY(150);
     GOTOXY(69,3);WRITE('I_');DELAY(150);
     GOTOXY(70,3);WRITE('R_');DELAY(150);
     GOTOXY(71,3);WRITE('_');DELAY(150);
     GOTOXY(71,3);WRITE(' ');DELAY(150);
     GOTOXY(71,3);WRITE('_');DELAY(150);
     GOTOXY(71,3);WRITE('_');DELAY(150);
     GOTOXY(71,3);WRITE(' ');DELAY(150);
     GOTOXY(71,3);WRITE('_');DELAY(150);
     GOTOXY(71,3);WRITE('_');DELAY(150);
     GOTOXY(71,3);WRITE(' ');DELAY(150);
     GOTOXY(71,3);WRITE('.');DELAY(150);
END;

BEGIN
CLRSCR;
   INICIA_GRAFICOS;
   PREC;
   CREDITOS;
   INICIA_GRAFICOS;
   INSTRUCCIONES;
   DELAY(1500);
   TITULO;
   DIB_TORRES;
   INICIAA;
   INICIAB;
   INICIAC;
   DISCOS;
   REPEAT
     MOVIMIENTOS;
     CONT:=CONT+1;
     GOTOXY(57,25);TEXTCOLOR(9);
     WRITELN('LLEVAS ',CONT,' MOVIMIENTOS.');TEXTCOLOR(WHITE);
   UNTIL (SAL>=1);

   IF SAL = 1 THEN
   BEGIN
    INICIA_GRAFICOS;
    SETCOLOR(RED);SETTEXTSTYLE(2,0,8);
    OUTTEXTXY(80,((GETMAXY DIV 2)-20),'GRACIAS POR DARNOS EL VISTO BUENO');
    READKEY;
   END
   ELSE
   BEGIN
    INICIA_GRAFICOS;
    GANO;
   END;

END.



