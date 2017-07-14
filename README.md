# KubeSecretsEncode

This gem is a quick script to encode and decode secrets in a kubernetes yaml file.

## Installation

```bash
gem install kube_secrets_encode
```

## Usage

The command line to run is as follows

```
kube_secrets filename
```

This will encode the secrets in the file specified and render the result to screen.

### Options

#### --decode

This will perform the reverse of encode

```
kube_secrets filename --decode
```


#### --yes

By default no action is taken on the file you specify other than reading its contents, if you specify --yes, it will write the result shown on screen to the file.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/stewartmckee/kube_secrets_encode. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the KubeSecretsEncode project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/stewartmckee/kube_secrets_encode/blob/master/CODE_OF_CONDUCT.md).
