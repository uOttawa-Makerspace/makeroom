%w(
  .ruby-version
  .ruby-version-vars
  tmp/restart.txt
  tmp/caching-dev.txt
).each { |path| Spring.watch(path) }
