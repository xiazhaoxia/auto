############################################################################################
#Author: DARSHAN KUMAR
#Date Created: 07/23/02
############################################################################################
$readfile;
$omdefs = 'omdefs';
$srvrdefs = 'srvrdefs';
$omdefs_sia = 'omdefs_sia';
$srvrdefs_sia = 'srvrdefs_sia';
$datfiles = "$srvrdefs.dat, w32ud\\enu\\$omdefs.dat";
for (`dir/s/b $datfiles`)
{
   chomp;
   $file = $_;
   $tmpfile = "$file.tmp";
   $bakfile = "$file.bak";
   $count = 0;
   @tags;
   if ($tmpfile =~ /.*srvrdefs.*/)
   {
      $readfile = "$srvrdefs_sia.dat";
   }
   elsif ($tmpfile =~ /$omdefs/)
   {
       $readfile = "w32ud\\enu\\$omdefs_sia.dat";
   }
   print "\nReading from: ", $readfile, "\n";
   
   open(FILE, "> $tmpfile") or die "Cannot open file: ", $tmpfile;
   #################################################################
   ##The following code merges common section in the source and
   ##destination files
   #################################################################
   for (`type $file`)
   {
      $line = $_;
      $printsection = 1;
      if ($line =~ /\[.*\]/)
      {
         $tag = $line;
         $tags[$count] = $tag;
         $count++;
         print FILE $tag;
         for (`type $readfile`)
         {
            $rLine = $_;
            if ($rLine =~ /\[.*\]/)
            {
               $rTag = $rLine;
               $printsection = 1;
            }
            if  (($tag eq $rTag) && 
                 ($rTag ne $rLine) &&
                 (($rLine !~ /^\s/) ||
                  ($rLine !~ /^\n/)))
            {
               if ($printsection == 1)
               {
                  print "\nMerging section: ", $rTag;
                  $printsection = 0;
               }
               print "Inserting: ", $rLine;
               print FILE $rLine;
            }
         }
      }
      else
      {
         print FILE $line;
      }
   }
   #################################################################
   ##The following code inserts all sections that are unique to the
   ##source files (SIA files). 
   #################################################################
   $printsection = 1;
   for (`type $readfile`)
   {
      $rLine = $_;
      if ($rLine =~ /\[.*\]/)
      {
         $printsection = 1;
         $rTag = $rLine;
         foreach $_ (@tags)
         {
            if ($_ eq $rTag)
            {
               #print "Skipping already merged section: ", $rTag, "\n";
               $printsection = 0;
            }
         }
      }
      if ($printsection == 1)
      {
         #print "Printing Section: ", $rTag, $rLine;
         print FILE $rLine;
      }
   }
   #################################################################
   ##Close all the opened files and exit gracefully.
   #################################################################
   close ($file);
   close (FILE);
   rename $file, $bakfile;
   rename $tmpfile, $file;
   print "\n***********************************************************\n";
   print "Successfully merged file - ", $file, " with ", $readfile;
   print "\n***********************************************************\n";
}