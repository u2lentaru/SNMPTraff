#!/bin/perl

$r=system("date");
$year=$ARGV[0];
$month=$ARGV[1];
#if ($month<10)
#   {
#   $month="0".$month;
#   };
$old_month=$month-1;
if ($old_month<10)
   {
   $old_month="0".$old_month;
   };
$old_year=$year-1;
print $year, " ", $month, " ", $old_month, "\n";
open(PARAMFILE, "< /export/home/u2/work/params")
or die "Couldn't open /export/home/u2/work/params";
while (<PARAMFILE>)
   {
   @pl=split(/\,/);
   $cln=$pl[0];
   $rtr=$pl[1];
   $prt=$pl[2];
   $quote=$pl[3];
   $price=$pl[4];
   print $cln, " ", $rtr, " ", $prt, "\n";
#   print "fgrep 'ifHCOutOctets.".$prt." =' /export/home/u2/MIBS/".$rtr."/".$rtr."_".$year.$month."*>/export/home/u2/work/tmp_out.txt", "\n";
   $r=system("fgrep 'ifHCOutOctets.".$prt." =' /export/home/u2/MIBS/".$rtr."/".$rtr."_".$year.$month."*>/export/home/u2/work/tmp_out.txt");
   if ($month==1)
      {
      $r=system("fgrep 'ifHCOutOctets.".$prt." =' /export/home/u2/MIBS/".$rtr."/".$rtr."_".$old_year."12*>/export/home/u2/work/tmp_old_out.txt");
      }
   else
      {
      $r=system("fgrep 'ifHCOutOctets.".$prt." =' /export/home/u2/MIBS/".$rtr."/".$rtr."_".$year.$old_month."*>/export/home/u2/work/tmp_old_out.txt");
      };   
   $r=system("fgrep 'ifHCInOctets.".$prt." =' /export/home/u2/MIBS/".$rtr."/".$rtr."_".$year.$month."*>/export/home/u2/work/tmp_in.txt");
   if ($month==1)
      {
      $r=system("fgrep 'ifHCInOctets.".$prt." =' /export/home/u2/MIBS/".$rtr."/".$rtr."_".$old_year."12*>/export/home/u2/work/tmp_old_in.txt");
      }
   else
      {
      $r=system("fgrep 'ifHCInOctets.".$prt." =' /export/home/u2/MIBS/".$rtr."/".$rtr."_".$year.$old_month."*>/export/home/u2/work/tmp_old_in.txt");
      };
   open(TMPOLDOUT, "< /export/home/u2/work/tmp_old_out.txt")
   or die "Couldn't open /export/home/u2/work/tmp_old_out.txt";
   while (<TMPOLDOUT>)
      {
      @tool=split(/\:/);
      $lv=$tool[4];
      };
   close(TMPOLDOUT)
   or die "Couldn't close /export/home/u2/work/tmp_old_out.txt";
   open(TMPOUT, "< /export/home/u2/work/tmp_out.txt")
   or die "Couldn't open /export/home/u2/work/tmp_out.txt";
   open(OUT, "> /export/home/u2/work/out/".$cln."_".$year.$month."_out.txt")
   or die "Couldn't open /export/home/u2/work/out/".$cln."_".$year.$month."_out.txt";
   $old_fh=select(OUT);
   $fv=1;
   $allout=0;
   while (<TMPOUT>)
      {
#      $r=system("echo > /export/home/u2/work/out/".$cln."_".$year.$month."_out.txt");
      @tol=split(/\:/);
      $toy=substr($tol[0], index($tol[0],_)+1, 4);
      $tom=substr($tol[0], index($tol[0],_)+5, 2);
      $tod=substr($tol[0], index($tol[0],_)+7, 2);
      $toh=substr($tol[0], index($tol[0],_)+9, 2);
      $ooct=$tol[4];
      if ($fv==1)
         {
         if ($ooct>=$lv)
            {
            $sv=$ooct-$lv;
            $lv=$ooct;
            }
         else
            {
            $sv=$ooct;
            $lv=$ooct;
            };
         $lv=$ooct;
         $cd=$tod;
         $fv=0; 
         }
      else
         {
         if ($tod > $cd)
            {
            print $cd.".".$tom.".".$toy.",".$sv, "\n";
            $allout=$allout+$sv;
            $cd=$tod;
               if ($ooct>=$lv)
               {
               $sv=$ooct-$lv;
               $lv=$ooct;
               }
            else
               {
               $sv=$ooct;
               $lv=$ooct;
               };
            }
         else
            {
            if ($ooct>=$lv) 
               {
               $sv=$sv+$ooct-$lv;
               $lv=$ooct;
               }
            else
               {
               $sv=$sv+$ooct;
               $lv=$ooct; 
               };
            }
         };
      };
   print $cd.".".$tom.".".$toy.",".$sv, "\n";
   $allout=$allout+$sv;
   print $allout, "\n";
   if ($allout>$quote)
   {
   $coast=($allout-$quote)*$price/1000000000;
   }   
   else
   {
   $coast=0;
   };
   print $quote, " ", $price, "\n";
   print $coast, "\n";
   select($old_fh);
   close(OUT)
   or die "Couldn't close /export/home/u2/work/out/".$cln."_".$year.$month."_out.txt";
   close(TMPOUT)
   or die "Couldn't close /export/home/u2/work/tmp_out.txt";
   open(TMPOLDIN, "< /export/home/u2/work/tmp_old_in.txt")
   or die "Couldn't open /export/home/u2/work/tmp_old_in.txt";
   while (<TMPOLDIN>)
      {
      @toil=split(/\:/);
      $lv=$toil[4];
      };
   close(TMPOLDIN)
   or die "Couldn't close /export/home/u2/work/tmp_old_in.txt";
   open(TMPIN, "< /export/home/u2/work/tmp_in.txt")
   or die "Couldn't open /export/home/u2/work/tmp_in.txt";
   open(IN, "> /export/home/u2/work/out/".$cln."_".$year.$month."_in.txt")
   or die "Couldn't open /export/home/u2/work/out/".$cln."_".$year.$month."_in.txt";
   $old_fh=select(IN);
   $fv=1;
   $allin=0;
   while (<TMPIN>)
      {
      @til=split(/\:/);
      $tiy=substr($til[0], index($tol[0],_)+1, 4);
      $tim=substr($til[0], index($tol[0],_)+5, 2);
      $tid=substr($til[0], index($tol[0],_)+7, 2);
      $tih=substr($til[0], index($tol[0],_)+9, 2);
      $ioct=$til[4];
      if ($fv==1)
         {
         if ($ioct>=$lv)
            {
            $sv=$ioct-$lv;
            $lv=$ioct;
            }
         else
            {
            $sv=$ioct;
            $lv=$ioct;
            };
         $lv=$ioct;
         $cd=$tid;
         $fv=0;
         }
      else
         {
         if ($tid > $cd)
            {
            print $cd.".".$tim.".".$tiy.",".$sv, "\n";
            $allin=$allin+$sv;
            $cd=$tid;
               if ($ioct>=$lv)
               {
               $sv=$ioct-$lv;
               $lv=$ioct;
               }
            else
               {
               $sv=$ioct;
               $lv=$ioct;
               };
            }
         else
            {
            if ($ioct>=$lv)
               {
               $sv=$sv+$ioct-$lv;
               $lv=$ioct;
               }
            else
               {
               $sv=$sv+$ioct;
               $lv=$ioct;
               };
            }
         };
      };
   print $cd.".".$tim.".".$tiy.",".$sv, "\n";
   $allin=$allin+$sv;
   print $allin, "\n";
   if ($allin>$quote)
   {
   $coast=($allin-$quote)*$price/1000000000;
   }
   else
   {
   $coast=0;
   };
   print $quote, " ", $price, "\n";
   print $coast, "\n";
   select($old_fh);
   close(IN)
   or die "Couldn't close /export/home/u2/work/out/".$cln."_".$year.$month."_in.txt";
   close(TMPIN)
   or die "Couldn't close /export/home/u2/work/tmp_in.txt";

   };
close(PARAMFILE)
or die "Couldn't close /export/home/u2/work/params";

$r=system("date");
