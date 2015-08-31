Package {
  allow_virtual => true,
}

include ::firewall_impl

stage { 'pre':
  before => Stage["main"],
}

class{ '::ebrc_yum_repo':
  stage => 'pre'
}
class{ '::epel':
  stage => 'pre'
}
