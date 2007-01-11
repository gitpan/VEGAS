require 5.004;
use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	   => 'VEGAS',
    'VERSION_FROM' => 'VEGAS.pm',
    'dist'         => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
);
