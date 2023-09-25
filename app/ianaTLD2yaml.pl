require HTTP::Request;
use LWP::UserAgent;

main();
exit;

sub get_iana_tld_list {
    my $iana_tld_list_url = "https://data.iana.org/TLD/tlds-alpha-by-domain.txt";
    my $ua = LWP::UserAgent->new;
    $ua->agent("perl_ianaTLD2yaml/0.1");
    
    my $req = HTTP::Request->new(GET => $iana_tld_list_url);
    my $res = $ua->request($req);
    
    my @tld_list = split(/\n/, $res->content);
    @tld_list = grep { !/^#/ } @tld_list; # コメント行の除外
    @tld_list = grep { !/^XN--/ } @tld_list; # `XN--`で始まる行の除外

    foreach my $line (@tld_list) {
        print "$line\n";
    }
}

sub main {
    get_iana_tld_list();

}
