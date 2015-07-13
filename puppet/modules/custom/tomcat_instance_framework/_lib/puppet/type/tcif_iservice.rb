Puppet::Type.newtype(:tcif_iservice, :self_refresh => true) do
  desc "Manage instances of Tomcat"

  newparam(:name) do
    desc "The instance name."
    isnamevar
  end

  def refresh 
   debug "ISNTANCE REFRESH"
  end
  
end