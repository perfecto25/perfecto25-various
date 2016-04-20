define hello_define ($contentvar) {
  file {"title":
    ensure => file,
    content => $contentvar,
  }
}

class various::definedTypes {

  hello_define { '/tmp/hello1':
    contentvar => "hello there 1",
  }


  hello_define { '/tmp/hello2':
    contentvar => "you this is 2",
  }


}
