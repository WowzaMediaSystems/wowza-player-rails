# Wowza Player

The Wowza Player in a friendly Rails wrapper.

##Prerequisites
A Wowza Player license is required. To obtain a license or learn more, see the [Wowza Player webpage](https://www.wowza.com/products/player).

## Installation

To install the Wowza Player Rails wrapper:

1. Add the following line to your application's Gemfile:

```ruby
gem 'wowza_player', git: 'git@github.com:WowzaMediaSystems/wowza-player-rails.git'
```

2. Execute the following command:

```$ bundle install```

3. Then use the following command to run the generator and inject the Wowza Player source script into your application layout:

```$ rails generate wowza_player```

## Usage

This gem provides two helper methods available to your rails templates.

####'wowza_player_script'
The 'wowza_player_script' helper enables you to manually locate the Wowza Player source script. This is not needed if you ran the generator during installation.

```
  <%= wowza_player_script_tag %>
```

####'wowza_player_tag'
After installing the Wowza Player source script using either the generator or the helper above, the `wowza_player_tag` helper enables you to embed the Wowza Player in your views

```
  <% = wowza_player_tag(license: <your-wowza-player-license>, sourceURL: <hls-source-url>) %>
```

This helper supports all of the [Player Builder configuration settings for Wowza Player](https://www.wowza.com/forums/content.php?860-Getting-Started-with-Wowza-Player#builderref). To use these configuration options, convert the parameters from JSON notation to Ruby hash syntax and pass that to the `wowza_player_tag` helper.

##More resources
[How to get started with Wowza Player](https://www.wowza.com/forums/content.php?860-Getting-Started-with-Wowza-Player)

## Contact
[Wowza Media Systems, LLC](https://www.wowza.com/contact)

## License

This code is distributed under the [Wowza Public License](https://github.com/WowzaMediaSystems/%5Bgithub-project-name%5D/blob/master/LICENSE.txt).
