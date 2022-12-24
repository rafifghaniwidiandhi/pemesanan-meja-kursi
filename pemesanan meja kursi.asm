.model small 
.code 
org 100h 
start: 
        jmp mulai 
nama        db 13,10,'MASUKKAN NAMA ANDA  : $' 
hp          db 13,10,'No. HP/TeLP   : $' 
tampung_nama    db 30,?,30 dup(?) 
tampung_hp      db 13,?,13 dup(?) 
 

daftar: 
	db 13,10,'   '     
      	db 13,10,'====================================================== '
      	db 13,10,'|                  KURSI DAN MEJA KAYU                ||'                                      
        db 13,10,'====================================================== '
        db 13,10,'||No |      JENIS     |     TIPE     |    HARGA       ||'
        db 13,10,'------------------------------------------------------ '
        db 13,10,'||01 | KURSI KAYU     |  PAHATAN     |  Rp. 1.000.000 ||' 
        db 13,10,'------------------------------------------------------, '
        db 13,10,'||02 | KURSI KAYU     |  POLOS       |  Rp. 600.000   || '
        db 13,10,'------------------------------------------------------ '
        db 13,10,'||03 | KURSI PLASTIK  |  BERWARNA    |  Rp. 300.000   ||'
        db 13,10,'------------------------------------------------------ '
        db 13,10,'||04 | MEJA KAYU      |  PAHATAN     |  Rp. 5.000.000 || '
        db 13,10,'------------------------------------------------------' 
        db 13,10,'||05 | MEJA KAYU      |  POLOS       |  Rp. 4.000.000 ||'
        db 13,10,'======================================================','$'
        
daftar2: 
	db 13,10,'   '   
        db 13,10,'====================================================== '
        db 13,10,'||                   PAKETAN MEJA KURSI               ||'                                      
        db 13,10,'====================================================== '
        db 13,10,'||No |     JENIS      |     TIPE     |     HARGA      ||'
        db 13,10,'------------------------------------------------------ '
        db 13,10,'||06 | MEJA KURSI     |  PAHATAN     |  Rp. 5.700.000 || '
        db 13,10,'------------------------------------------------------'
        db 13,10,'||07 | MEJA KURSI     |PAHATAN ,POLOS|  Rp. 5.400.000 || '
        db 13,10,'------------------------------------------------------ '
        db 13,10,'||08 | MEJA KURSI     |POLOS ,PAHATAN|  Rp. 4.700.000 ||'
        db 13,10,'------------------------------------------------------ '
        db 13,10,'||09 | MEJA KURSI     |  POLOS       |  Rp. 4.300.000 || '
        db 13,10,'------------------------------------------------------ '
        db 13,10,'||10 | MEJA KURSI     |POLOS ,PLASTIK|  Rp. 4.100.000 ||'
        db 13,10,'======================================================','$'
        
lanjut db 13,10,'TEKAN y UNTUK MELANJUTKAN PILIHAN :  $' 
error  db 13,10,'KODE YG ANDA MASUKAN SALAH,COBA LAGI $'       
pilih  db 13,10,'Silahkan masukkan NO BARANG yang Anda pilih : $'  

               
        mulai: 
        mov ah,09h 
        lea dx,nama 
        int 21h 
        mov ah,0ah 
        lea dx,tampung_nama 
        int 21h
        mov ah,09h 
        lea dx,hp 
        int 21h 
        mov ah,0ah 
        lea dx,tampung_hp
        int 21h  
        push dx  
        mov ah,09h 
        mov dx,offset daftar  
        int 21h 
        mov ah,09h 
        mov dx,offset lanjut  
        int 21h 
        mov ah,01h 
        int 21h 
        cmp al,'y' 
        je page2    
        jne error_msg 
 
page2:         
        mov ah,09h 
        mov dx,offset daftar2 
        int 21h 
        mov ah,09h
        mov dx,offset lanjut  
        int 21h 
        mov ah,01h 
        int 21h 
        cmp al,'y' 
        jmp proses
        jne error_msg 
        
error_msg: 
        mov ah,09h 
        mov dx,offset error 
        int 21h 
       
        
proses: 
        mov ah,09h 
        mov dx,offset pilih
        int 21h    
        mov ah,1 
        int 21h 
        mov bh,al 
        mov ah,1 
        int 21h 
        mov bl,al 
        cmp bh,'0' 
        cmp bl,'1' 
        je hasil1 
      
         
         
        cmp bh,'0' 
        cmp bl,'2' 
        je hasil2 
         
        cmp bh,'0' 
        cmp bl,'3' 
        je hasil3 
         
        cmp bh,'0' 
        cmp bl,'4' 
        je hasil4 
         
        cmp bh,'0' 
        cmp bl,'5' 
        je hasil5 
         
        cmp bh,'0' 
        cmp bl,'6' 
        je hasil6 
         
        cmp bh,'0' 
        cmp bl,'7' 
        je hasil7 
         
        cmp bh,'0' 
        cmp bl,'8' 
        je hasil8 
         
        cmp bh,'0' 
        cmp bl,'9' 
        je hasil9 
        
        cmp bh,'1' 
        cmp bl,'0' 
        je hasil10
        
        jne error_msg
        
          
;------------------------------------------------------------------         
 
hasil1: 
       
        mov ah,09h 
        lea dx,teks1 
        int 21h 
        int 20h 
        
hasil2: 
        mov ah,09h 
        lea dx,teks2 
        int 21h 
        int 20h 
         
hasil3: 
        mov ah,09h 
        lea dx,teks3 
        int 21h 
        int 20h 
         
 
hasil4: 
        mov ah,09h 
        lea dx,teks4 
        int 21h 
        int 20h 
         
hasil5: 
        mov ah,09h 
        lea dx,teks5 
        int 21h 
        int 20h 
         
hasil6: 
        mov ah,09h 
        lea dx,teks6 
        int 21h 
        int 20h 
         
hasil7: 
        mov ah,09h 
        lea dx,teks7 
        int 21h 
        int 20h 
         
hasil8: 
        mov ah,09h 
        lea dx,teks8 
        int 21h 
        int 20h 
         
hasil9: 
        mov ah,09h 
        lea dx,teks9 
        int 21h 
        int 20h 
         
hasil10: 
        mov ah,09h 
        lea dx,teks10 
        int 21h 
        int 20h        

         
;------------------------------------------------------------------ 
         
teks1   db 13,10,'PESANAN ANDA KURSI KAYU PAHATAN  '                 
        db 13,10,'Total Harga yang harus Anda Bayar: Rp. 1.000.000 ' 
        db 13,10,'Terima Kasih ,pesanan  anda akan di proses :) $' 
            
teks2   db 13,10,'PESANAN ANDA KURSI KAYU POLOS '                
        db 13,10,'Total Harga yang harus Anda Bayar:Rp. 600.000 ' 
        db 13,10,'Terima Kasih ,pesanan  anda akan di proses :) $'  

teks3   db 13,10,'PESANAN ANDA KURSI PLASTIK BERWARNA'                 
        db 13,10,'Total Harga yang harus Anda Bayar:  Rp. 300.000 ' 
        db 13,10,'Terima Kasih ,pesanan  anda akan di proses :) $' 
        
teks4   db 13,10,'PESANAN ANDA MEJA KAYU PAHATAN  '                 
        db 13,10,'Total Harga yang harus Anda Bayar:Rp. 5.000.000' 
        db 13,10,'Terima Kasih ,pesanan  anda akan di proses :) $' 
         
teks5   db 13,10,'PESANAN ANDA MEJA KAYU POLOS  '                 
        db 13,10,'Total Harga yang harus Anda Bayar: Rp. 4.000.000 ' 
        db 13,10,'Terima Kasih ,pesanan  anda akan di proses :) $' 
         
teks6   db 13,10,'PESANAN ANDA (MEJA KURSI) PAHATAN   '                 
        db 13,10,'Total Harga yang harus Anda Bayar: Rp. 5.700.000 ' 
        db 13,10,'Terima Kasih ,pesanan  anda akan di proses :) $' 
            
teks7   db 13,10,'PESANAN ANDA (MEJA KURSI) PAHATAN,POLOS  '                 
        db 13,10,'Total Harga yang harus Anda Bayar: Rp. 5.400.000 ' 
        db 13,10,'Terima Kasih ,pesanan  anda akan di proses :) $' 
           
teks8   db 13,10,'PESANAN ANDA (MEJA KURSI) POLOS,PAHATAN '                
        db 13,10,'Total Harga yang harus Anda Bayar: Rp. 4.700.000 ' 
        db 13,10,'Terima Kasih ,pesanan  anda akan di proses :) $' 
            
teks9   db 13,10,'PESANAN ANDA (MEJA KURSI) POLOS '                 
        db 13,10,'Total Harga yang harus Anda Bayar: Rp. 4.300.000 ' 
        db 13,10,'Terima Kasih ,pesanan  anda akan di proses :) $' 
         
teks10  db 13,10,'PESANAN ANDA (MEJA KURSI) POLOS,PLASTIK '                
        db 13,10,'Total Harga yang harus Anda Bayar: Rp. 4.100.000' 
        db 13,10,'Terima Kasih ,pesanan  anda akan di proses :) $' 
        
end start