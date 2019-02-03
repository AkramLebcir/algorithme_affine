class Affine {

  Affine(){}

  String crypt(String msg, int a, int c) {
    List<int> list = [];
    for (int i = 0; i < (msg.length); i++) {
      int n =
      ((a * (26 + (msg[i].codeUnitAt(0)) - ('a'.codeUnitAt(0))) + c) % 26);
      list.add((n + 'a'.codeUnitAt(0)));
    }
    return new String.fromCharCodes(list);
  }

  String decript(String msg, int a, int b) {
    List<int> list = [];
    int i;
    for (i = 0; i < (msg.length); i++) {
      int n =
          (a * (26 + (msg[i].codeUnitAt(0)) - ('a'.codeUnitAt(0)) - b)) % 26;
      list.add((n + 'a'.codeUnitAt(0)));
    }
    return new String.fromCharCodes(list);
  }

  int inversMod(int r0, int r1) {
    // ta3 a-1

    int u0 = 1, u1 = 0, v0 = 0, v1 = 1, r = 0, u = 0, v = 0;

    int a, b;
    a = r0;
    b = r1;
    while (pgcd(r0, r1) > 1) {
      r = r0 - ((r0 / r1).toInt() * r1);
      u = u0 - ((r0 / r1).toInt() * u1);
      v = v0 - ((r0 / r1).toInt() * v1);

      r0 = r1;
      r1 = r;

      u0 = u1;
      u1 = u;

      v0 = v1;
      v1 = v;
    }
    // printf("%d  %d \n",u,v);

    return (u + 26) % 26;
  }

  int pgcd(int a, int b) {
    //ppcm
    int x, t = 0, m;

    if (b > a) {
      x = b;
      b = a;
      a = x;
    }

    if (a % b != 0) {
      t = (a * b);
      while (b != 0) {
        x = a % b;
        a = b;
        b = x;
      }
      m = (t / a).toInt();
    }
    while (b != 0) {
      x = a % b;
      a = b;
      b = x;
    }
    //printf("\nLe PGCD est :\t%d", a);
    return t;
  }

  List<String> brufforce(String msg) {
    List<String> litems = [];
    int i, j, a1, k = 1;
    String msg2;
    for (i = 1; i <= 26; i++) {
      for (j = 1; j <= 26; j++) {
        if (pgcd2(i, 26) == 1) {
          a1 = inversMod(i, 26);
          msg2 = decript(msg, a1, j);
          litems.add('(a,c)=( $i , $j ) k= $k \n message : $msg2 \n');
          //litems = litems +'\n'+ '(a,c)=( $i , $j ) k= $k \n message : $msg2 \n';
          k++;
        }
      }
    }
    return litems;
  }

  int pgcd2(int a, int b) {
    int x, t = 0, m;

    if (b > a) {
      x = b;
      b = a;
      a = x;
    }

    if (a % b != 0) {
      t = (a * b);
      while (b != 0) {
        x = a % b;
        a = b;
        b = x;
      }
      m = (t / a).toInt();
    }
    while (b != 0) {
      x = a % b;
      a = b;
      b = x;
    }
    //printf("\nLe PGCD est :\t%d", a);
    return a;
  }

  List<String> frequency(String msg) {
    String tabc = "";
    List<String> litems = [];
    //tabc[1000];
    int i, j, k = 0, c = 0;
    List<double> tabf = new List(26);
    int d;
    d = msg.length;

    for (i = 'a'.codeUnitAt(0); i <= 'z'.codeUnitAt(0); i++) {
      for (j = 0; j < d; j++) {
        if (String.fromCharCode(i) == msg[j]) {
          c++;
        }
      }
      print(c);
      //	printf("f = %d ",c);
      tabf[k] = 10.0 * (c / d);
      print(tabf[k]);
      c = 0;
      k++;
    }

    List<int> l = [];
    for (i = 'a'.codeUnitAt(0); i <= 'z'.codeUnitAt(0); i++) {
      l.add(i);
    }
    tabc = String.fromCharCodes(l);

    //printf("table fr frequence :\n\n");
    litems.add("table fr frequence :\n");
    for (j = 0; j < 26; j++) {
      //printf("%c  | ", tabc[j]);
      //printf("%.2f | ", tabf[j]);
      litems.add("| ${tabc[j]}  | ${tabf[j].toDouble()} |\t");
    }
    return litems;
  }

  int inversMod2(int r0, int r1, int y1) {
    // la fonction de inverse  modifie pour exo 4

    int u0 = 1, u1 = 0, v0 = 0, v1 = 1, r = 0, u = 0, v = 0;
    //if(pgcd(r0,r1)==1) return -1;
    // printf("test \n");
    int a, b;
    a = r0;
    b = r1;
    while (pgcd(r0, r1) > (y1)) {
      //  printf("pgcd=%d \n",pgcd(r0,r1));
      r = r0 - ((r0 / r1).toInt() * r1);
      u = u0 - ((r0 / r1).toInt() * u1);
      v = v0 - ((r0 / r1).toInt() * v1);

      r0 = r1;
      r1 = r;

      u0 = u1;
      u1 = u;

      v0 = v1;
      v1 = v;
    }
    //  printf("%d  %d \n",u,v);
    int p = ((y1) / (pgcd2(a, 26))).toInt();
    //  printf("p = %d , y = %d",p,y1);
    return u * p;
  }

  int modulo(int x, int N) {
    return (x % N + N) % N;
  }

  List<String> trouverCle(int x, int y, int x1, int y1, String msg) {
    int a, b, a0, k = 0, r;
    List<String> litems = [];
    String msg2 = "";
    // etap1:

    if (x > x1) {
      a = x - x1;
      b = y - y1;
    } else {
      a = x1 - x;
      b = y1 - y;
    }
    b = modulo(b, 26);

    if (pgcd2(a, 26) != 1) {
      // si modulo de x-x1 != 1

      a0 = inversMod2(a, 26, b);
      //printf("a0 = %d \n\n", a0);
      litems.add('a0 = $a0 \n\n');

      r = a0;

      while (r <= 26) {
        if ((pgcd2(r, 26) == 1) && (r > 0)) {
          //printf("q= %d   ", k);
          litems.add('q= $k \n\n');

          b = modulo((y - (r * x)), 26); // trouver b

          //printf("le clef (%d , %d ) condidat ", r, b);
          litems.add('Le clef ($r , $b ) condidat');

          if (modulo((r * x + b), 26) == y) {
            //printf("\t le cle valid \n");
            litems.add('\t le cle valid \n');
            msg2 = decript(msg, r, b);
            return litems;
          } else {
            //printf("\t le cle n est pas valid \n");
            litems.add('\t le cle n est pas valid \n');
          }
        } else {
          //printf("q= %d   pas solution\n", k);
          litems.add('q= $k   pas solution\n');
        }

        r = 13 * k + a0; // en cherche tout les a posible
        k++;
      }
      return litems;
    } else {
      // si modulo de x-x1 = 1

      a0 = inversMod(a, 26); // a-1
      //printf("a0 = %d \n\n", a0);
      litems.add('a0 = $a0 \n\n');
      r = a0;
      a = modulo(b, 26) * r;

      //printf("le clef (%d , %d ) \n", modulo(a, 26), modulo((y - (a * x)), 26));
      litems.add('le clef (${modulo(a, 26)} , ${modulo((y - (a * x)), 26)} ) \n');

      if (pgcd2(modulo(a, 26), 26) == 1) {
        //printf("\t le cle valid \n");
        litems.add('\t le cle valid \n');
        msg2 = decript(msg, r, b);
        return litems;
      } else {
        //printf("\t le cle n est pas valid \n");
        litems.add('\t le cle n est pas valid \n');
        return litems;
      }
    }
    return litems;
  }

  String dechefrement_sans_cl(String msg) {
    String msg2 = "";
    String tabc = "";

    List<String> litems = [];
    List<String> litems2 = [];
    litems = frequency(msg);
    int x, x1, y, y1, i = 0,j=0;
    bool b = false;

    while (!b) {
      y = ((26 + msg[i].codeUnitAt(0) - 'a'.codeUnitAt(0)) % 26);
      y1 = ((26 + msg[i + 1].codeUnitAt(0) - 'a'.codeUnitAt(0)) % 26);

      litems2 = trouverCle(4, 19, y, y1, msg);
      j++;
      if(j>311){
        return msg2;
      }
    }
  }
}