# ypdf-writer

Gem force from https://rubygems.org/gems/pdf-writer, as ywesee does not want to
rewrite its code to move to ruby 2.x

# PDF::Writer for Ruby
This library provides the ability to create PDF documents using only native
Ruby libraries. There are several demo programs available in the demo/
directory. The canonical documentation for PDF::Writer is "manual.pdf", which
can be generated using bin/techbook (just "techbook" for RubyGem users) and
the manual file "manual.pwd".

Homepage::  http://rubyforge.org/projects/ruby-pdf/
Copyright:: 2003—2005, Austin Ziegler

This software is based on Adobe's PDF Reference, Fifth Edition, version 1.6.
This and earlier editions are available from Adobe's PDF developer
website[http://partners.adobe.com/public/developer/pdf/index_reference.html].

## Ruby 2.0 Compatibility

This gem version has been updated to work with Ruby 2.0.  This is a maintenance
effort only to support moving existing projects from Ruby 1.8 to 2.0.  New project
development should use Prawn[1] over PDF-Writer as it is actively maintained and
is also the successor/rewrite of this library.

[1] http://prawn.majesticseacreature.com/

## LICENCE NOTES
Please read the file LICENCE for licensing restrictions on this library, as
well as important patent considerations.

## Requirements
PDF::Writer requires Ruby 1.8.2 or better, Color 1.4.0 or better, and
Transaction::Simple 1.3.0 or better.

