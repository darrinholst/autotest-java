Autotest.add_discovery do
  style = []
  style << "maven" if File.exist? 'pom.xml'
  style
end
