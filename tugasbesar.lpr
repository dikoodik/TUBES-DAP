{file           :tugasbesar.pas}
{desc           :Tugas Besar DAP, Daftar Harga JNE}
{startdate      :20112016}
{lastrevision   :06122016}

program tugasbesar;

uses
        crt,sysutils;

type
        tes=record
          jasa    :integer;
          asu     :integer;
          ber     :integer;
end;
type
         tis=record
           js      :array[1..99]of char;
           sa      :array[1..99]of char;
           bre     :array[1..10]of char;
end;
type
          kot=record
            kota    :array[1..5]of string[20];
            pulau   :array[1..5]of string[20];
end;
type
            nam=array[1..5]of kot;
type
          admin=record
             username,password:string; {username: admin, password: diko}
end;

var
      i, j, xs, loginan          :integer;
      jumlahpulau, jumlahkota    :integer;
      x, x1, y, y1, l, l1        :string;
      p_harga                    :tes;
      p_jasa                     :tis;
      administrator              :array[1..1]of admin;
      nama                       :nam;
procedure jasa;
var
  a, b, c, n:integer;
begin
clrscr;
a:=5000;
b:=8000;
c:=10000;
repeat
clrscr;
write('----Pilih Jasa Yang Akan Digunakan----');
writeln;
writeln('(1.) REG');
writeln('(2.) YES');
writeln('(3.) SS');
writeln;
write('--------------------------------------');
writeln;
write('Masukkan No. Pilihan: ');
readln(n);

if (n > 3) then
   begin
   writeln('Pilihan Tidak Tersedia');
   readln;
   end

   else
          case n of
               1:p_harga.jasa:=a;
               2:p_harga.jasa:=b;
               3:p_harga.jasa:=c;
               end;

          case n of
               1:p_jasa.js:='REG';
               2:p_jasa.js:='YES';
               3:p_jasa.js:='SS';
               end;
          until(n<4);
end;
procedure asuransi;
var
  n, a:integer;
begin
clrscr;
a:=5000;
repeat
clrscr;
write('Menggukanakn Asuransi?');
writeln;
Writeln('(1.)YA');
writeln('(2.)Tidak');
write('Pilihan: ');
readln(n);
    if (n > 2) then
       begin
       writeln('Pilihan Tidak Tersedia');
       readln;
       end
    ELSE
          if n=1 then
                 p_harga.asu:=a
          else
          if n=2 then
                 p_harga.asu:=0;

                 case n of
                  1:p_jasa.sa:='YA';
                  2:p_jasa.sa:='TIDAK';
                  end;
     until (n < 3);
end;
procedure berat;
var
  n, a, i:integer;
  strN :string;
begin
clrscr;
       repeat
             write('Masukkan Jumlah Berat (<=10 KG): ');readln(n);

             if (n>10) then
                write('Melebihi Batas Maksimum! Masukkan Kembali Berat (<=10KG): ');
       until (n <=10);

a:=0;

     for i:=1 to n do
         begin
              a:=a+1000;
              end;

  p_harga.ber:=a;
  str(n,strN);
  write(n);
  write(strn);
  p_jasa.bre:=strn;
 end;
procedure tampilharga;
begin
clrscr;
writeln('Harga Total');
writeln('Dari          : ',y);
writeln('Menuju        : ',y1);
writeln('Jasa          : ',p_jasa.js);
writeln('Harga         : ','Rp. ',p_harga.jasa);
writeln;
writeln('Asuransi      : ',p_jasa.sa);
writeln('Harga         : ','Rp. ',p_harga.asu);
writeln;
writeln('Berat         : ',p_jasa.bre,' KG');
writeln('Harga         : ','Rp. ',p_harga.ber);
writeln;
      if (l <> l1) then
          xs:=3000
      else
          xs:=0;
writeln('Total         : ','Rp. ',p_harga.jasa+p_harga.asu+p_harga.ber+xs);
readln;
end;
procedure cleardata;
var
  i       :integer;
begin
clrscr;
write('Menghapus Data');
for i:=1 to 5 do
begin
  delay(15);
  write('. ');
  delay(700);
end;

     p_harga.jasa:=0;
     p_harga.asu:=0;
     p_harga.ber:=0;
     y:='NOT DEFINIED';
     y1:='NOT DEFINIED';
     L:='NOT DEFINIED';
     L1:='NOT DEFINIED';
     p_jasa.js:='NOT DEFINIED';
     p_jasa.sa:='NOT DEFINIED';
     p_jasa.bre:='0';
     xs:=0;

end;
procedure kotapengiriman;
var
  found:boolean;
begin
   clrscr;
   found:=false;
   while(found=false) do
      begin
           write('Masukkan Kota Pengirim: ');readln(x);
              for i:=1 to jumlahpulau do
                  begin
                       for j:=1 to jumlahkota do
                           begin
                                 if (x=nama[i].kota[j]) then
                                    begin
                                         y:=(nama[i].kota[j]);
                                         l:=(nama[i].pulau[i]);
                                         FOUND:=TRUE;
                                    end;
                           end;
                  end;

   if (found=true) then
      writeln('Found!,Press [ENTER] to continue')
   else
       writeln('Not Found,Please Search Again');
   end;
READLN;
end;
procedure kotatujuan;
var
  found:boolean;
begin
   clrscr;
   found:=false;
   while(found=false) do
     begin
        writeln('Masukkan Kota Tujuan: ');readln(x1);
            for i:=1 to jumlahpulau do
                begin
                   for j:=1 to jumlahkota do
                       begin
                            if (x1=nama[i].kota[j]) then
                               begin
                                    y1:=(nama[i].kota[j]);
                                    l1:=(nama[i].pulau[i]);
                                    FOUND:=TRUE;
                               end;
                       end;
                end;

   if (found=true) then
      writeln('Found!,Press [ENTER] to continue')
   else
       writeln('Not Found,Please Search Again');
       end;
readln;
end;
procedure inputdata;
begin
clrscr;

write('Jumlah Pulau            : ');readln(jumlahpulau);
write('Jumlah Kota per Pulau   : ');readln(jumlahkota);

   if (jumlahpulau > 5) then
      begin
        clrscr;
        writeln('Melebihi Batas Maksimal!');
      end

   else

   if (jumlahkota > 5) then
      begin
        clrscr;
        writeln('Melebihi Batas Maksimal!');
      end

   else
       begin
          for i:=1 to jumlahpulau do
          begin
                writeln;
                write('Nama Pulau: ');readln(nama[i].pulau[i]);
                writeln;
                for j:=1 to jumlahkota do
                    begin
                    write('Nama Kota: ');readln(nama[i].kota[j])
                    end;
          end;
       end;
end;

procedure deletedata;
begin
clrscr;
write('Menghapus Data');
   for i:=1 to 5 do
   begin
        delay(15);
        write('. ');
        delay(700);
   end;

       for i:=1 to jumlahpulau do
           begin
                nama[i].pulau[i]:=' ';
                   for j:= 1 to jumlahkota do
                      begin
                           nama[i].kota[j]:=' ';
                      end;
           end;
    exit;
end;
procedure sortstring;
var
  sort,k     :integer;
  temp       :string;

begin
    writeln('Mengurut Nama Kota Sesuai Abjad');
    writeln('(1). Ascending');
    writeln('(2). Descending');
    write('Pilihan: ');readln(sort);

    if (sort = 1 ) then
       begin
            FOR k:=1 to jumlahpulau do
                begin
                for i:= jumlahkota downto 2 do
                    begin
                    for j:= 2 to i do
                        begin
                             if (nama[k].kota[j-1] > nama[k].kota[j]) then
                                begin
                                temp:= nama[k].kota[j-1];
                                nama[k].kota[j-1]:=nama[k].kota[j];
                                nama[k].kota[j]:=temp;
                                end;
                        end;
                    end;
                end;
       end;
   if (sort = 2) then
      begin
              FOR k:=1 to jumlahpulau do
                begin
                for i:= jumlahkota downto 2 do
                    begin
                    for j:= 2 to i do
                        begin
                             if (nama[k].kota[j-1] < nama[k].kota[j]) then
                                begin
                                temp:= nama[k].kota[j-1];
                                nama[k].kota[j-1]:=nama[k].kota[j];
                                nama[k].kota[j]:=temp;
                                end;
                        end;
                    end;
                end;
      end;

   for k:=1 to jumlahpulau do
       begin
            writeln;
            writeln('Pulau: ',nama[k].pulau[k]);
            writeln;
            for j:=1 to jumlahkota do
              begin
                   writeln('Kota: ',nama[k].kota[j]);
              end;
       end;
end;
procedure tampilkota;
begin
CLRSCR;
sortstring;
readln;
end;
procedure login;
var
  x,y:string;
  found:boolean;
  G,s: integer;
begin
clrscr;

    administrator[1].username:='admin';
    administrator[1].password:='diko';
    found:=false;
    repeat
    CLRSCR;
    writeln('(1.) Login Panel');
    writeln('(0.) EXIT');
    Writeln;
    write('Pilihan       : ');readln(s);
    if (s > 1) then
       begin
            writeln('Pilihan Tidak Tersedia');
            readln;
       end
    until (s < 2);

    if(s = 0) then
       exit

    else

    if (s = 1 ) then
       begin
            REPEAT
                  clrscr;
                  write('Username: ');readln(x);
                  write('Password: ');readln(y);

                     if (x <> administrator[1].username) then
                        found:=false

                     else

                     if(y <> administrator[1].password) then
                        found:=false

                     else
                         found:=true;

    if (found=false)then
       begin
            writeln('Username / Password Salah!!');
            readln;
       end

    until (found=true);

    repeat
    clrscr;
    writeln('(1.) Input Data ');
    writeln('(2.) Delete All Data');
    writeln('(0.) EXIT');
    writeln('Pilihan: ');readln(G);
     case G of
        1: inputdata;
        2: deletedata;
        0: exit;
        end;
    if (G > 2) then
       begin
            clrscr;
            writeln('Pilihan Tidak Tersedia');
            readln;
       end;

                   until (G < 3);

                  end;
end;
procedure halamanutama;
var
  z       : integer;
begin

REPEAT
clrscr;
writeln('---------------------------------------');
writeln('          Harga Ekspedisi JNE          ');
writeln('                    By: Riandi Kartiko ');
writeln('---------------------------------------');
writeln('(1.)      : PILIH JASA');
writeln('(2.)      : PILIH ASURANSI');
writeln('(3.)      : BERAT KIRIMAN');
writeln('(4.)      : TAMPILKAN SELURUH KOTA');
writeln('(5.)      : KOTA PENGIRIM');
writeln('(6.)      : KOTA TUJUAN');
writeln('(7.)      : TAMPILKAN HARGA');
writeln('(8.)      : CLEAR DATA');
writeln('(9.)      : CHANGE USER');
writeln('(0.)      : EXIT');
writeln;
writeln;
write('Pilihan Anda      : ');readln(z);
      if(z > 10) then
      BEGIN
           clrscr;
           writeln('Pilihan Tidak Tersedia, klik [ENTER] untuk Kembali Ke Halaman Awal');
           readln;
      end

      else

 case z of
      1:jasa;
      2:asuransi;
      3:berat;
      4:tampilkota;
      5:kotapengiriman;
      6:kotatujuan;
      7:tampilharga;
      8:cleardata;
      0:exit;
 end;
      if (z = 9) then
      begin
           exit;
      end;
      until (z=0);

end;
procedure caselogin;
begin

     repeat
     clrscr;
            writeln('(1.)Admin');
            writeln('(2.)Guest');
            writeln('(0.)EXIT');
            write('Pilihan: ');readln(loginan);

            if ( loginan > 2) then
               begin
                    writeln('Pilihan Tidak Tersedia');
                    readln;
               end

            else

            if (loginan=1) then

               login

            else

            if (loginan=2) then
               begin
                    if (nama[1].pulau[1]=' ') then
                       begin
                            clrscr;
                            writeln('Admin Belum Menginput Data, Silahkan Kontak Administrator');
                            readln;
                            caselogin;
                       end

            else

                halamanutama;

                END;

     until (loginan=0);

end;
                               {Program Utama}
begin
clrscr;
y:='NOT DEFINIED';
y1:='NOT DEFINIED';
L:='NOT DEFINIED';
L1:='NOT DEFINIED';
nama[1].pulau[1]:=' ';
caselogin;
end.
