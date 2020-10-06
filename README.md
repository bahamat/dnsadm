# dnsadm

A small shell script to make DNS management slightly easier.

## Requirements

* nsupdate (comes with `bind`).
* Permission to read `/var/run/named/session.key`.
* Needs to be run locally on the DNS master.
* `update-policy local;` added to each zone.

E.g.:

    zone "example.com" {
        type master;
        file "db.example.com";
        update-policy local;
    };

## Usage

`dnsadm` accepts the following subcommands:

* add - Add a record.
* delete - Delete a record.
* update - Delete, then add a record.

## Examples

IPv6

    # dnsadm add AAAA foo.example.com 2001:db8::200
    ;RESULTS
    ;foo.example.com.            IN      A
    foo.example.com.     3600    IN      A       2001:db8::200

    # dnsadm update AAAA foo.example.com 2001:db8::201
    ;RESULTS
    ;foo.example.com.            IN      A
    foo.example.com.     3600    IN      A       2001:db8::201

    # dnsadm del AAAA foo.example.com
    ;RESULTS
    ;foo.example.com.            IN      A

IPv4

    # dnsadm add A foo.example.com 198.51.100.200
    ;RESULTS
    ;foo.example.com.            IN      A
    foo.example.com.     3600    IN      A       198.51.100.200

    # dnsadm update A foo.example.com 198.51.100.201
    ;RESULTS
    ;foo.example.com.            IN      A
    foo.example.com.     3600    IN      A       198.51.100.201

    # dnsadm del A foo.example.com
    ;RESULTS
    ;foo.example.com.            IN      A

PTR in-addr.arpa

    # dnsadm add PTR foo.example.com 198.51.100.200
    ;RESULTS
    ;200.100.51.198.in-addr.arpa.       IN      PTR
    200.100.51.198.in-addr.arpa. 3600   IN      PTR     foo.example.com.

    # dnsadm update PTR foo.example.com 198.51.100.201
    ;RESULTS
    ;201.100.51.198.in-addr.arpa.       IN      PTR
    201.100.51.198.in-addr.arpa. 3600   IN      PTR     foo.example.com.

    # dnsadm del PTR foo.example.com 198.51.100.201
    ;RESULTS
    ;201.100.51.198.in-addr.arpa.       IN      PTR

PTR ip6.arpa

    # dnsadm add PTR foo.example.com 2001:db8::200
    ;RESULTS
    ;0.0.2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. IN PTR
    0.0.2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. 3600 IN PTR foo.example.com.

    # dnsadm update PTR foo.example.com 2001:db8::201
    ;RESULTS
    ;1.0.2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. IN PTR
    1.0.2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. 3600 IN PTR foo.example.com.

    # dnsadm del PTR foo.example.com 2001:db8::201
    ;RESULTS
    ;1.0.2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa. IN PTR
