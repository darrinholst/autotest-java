autotest-java
=============

Adds the ability to run java tests with autotest.

### Installation

    gem install ZenTest
    gem install autotest-java

### Usage

    cd /my-java-project
    autotest

### What your .autotest file might want to look like
    require 'autotest/growl'
    require 'autotest/fsevent'
    Autotest.add_hook :initialize do |at|
      at.add_exception '.git'
      at.add_exception 'src'
      at.add_exception 'lib'
    end

### Limitations

* only works with single maven projects
* only looks for .class files in target, i.e. you need something else to compile like your ide
* only works with junit tests
* only tested with junit 4.5

### Copyright

Copyright (c) 2009 Darrin Holst. See LICENSE for details.

