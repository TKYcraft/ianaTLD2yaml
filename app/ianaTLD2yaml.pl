#!/usr/local/bin/perl

use strict;
use warnings;
use LWP::UserAgent;
use YAML::Tiny;
require HTTP::Request;

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

    return @tld_list
}

sub dump_yaml_list {
    my (@tld_list) = @_;
    my $filename = "tld_list.yaml";

    my $data = {
        TLD => \@tld_list,
    };

    my $yaml = YAML::Tiny->new($data, { QuoteNumericStrings => 1 });
    $yaml->write($filename);
}

sub main {
    my @tld_list = get_iana_tld_list();
    dump_yaml_list(@tld_list);
}
