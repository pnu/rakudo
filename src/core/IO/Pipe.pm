A:
class IO::Pipe does IO does PIO {
    has Str $.command;

    method BUILD(:$!command,Mu :$PIO,:$chomp,:$bin,:$encoding,:$nl) {
        $!chomp = $chomp // True;
        nqp::bind($!PIO, nqp::decont($PIO));
        self.encoding($bin ?? 'binary' !! $encoding // 'utf8');
        self.nl($nl // "\n");
    }
}

# vim: ft=perl6 expandtab sw=4