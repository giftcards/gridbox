## Synopsis

Puppet module to setup selenium/phantomjs grid boxes

## Code Example

    class { 'gridbox':
      phantom  => true,
      workers  => 5,
      host     => '127.0.0.1',
      proxy    => 'none',
      selenium => true,
      timeout  => 60
    }

## Motivation

Required for abvs and internal testing

## Installation

Tested on CentOS 6

## API Reference

    phantom - setup phantom
    workers - how many phantom workers to start
    host - selenium host to point the phantom workers at
    proxy - http proxy address:port for the phantom workers
    selenium - setup selenium
    timeout - set selenium timeout and browserTimeout in seconds

## Contributors

Ryan Munz June 2015 for Giftcards.com
