#! /usr/bin/perl
use Font::TTF::Font;

unless (defined $ARGV[0]) {
    die << 'EOT';
glyphcount.pl <fontfile> …
Prints glyph count for each input font file
EOT
}

foreach (@ARGV) {
    $font = Font::TTF::Font -> open($_) || die "Unable to open font file $_";
    $count = $font -> {'maxp'}{'numGlyphs'};
    printf "File: %s\nCount: %d\n", $_, $count;
    $font -> release;
}
