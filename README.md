# Sample Villager for Aiwolf 4.x

This is a sample implementation villager for Aiwolf 4.x using [aiwolf-client](https://github.com/Tei1988/aiwolf-client-ruby) gem.  
Please see http://aiwolf.org if you want to know more.

[aiwolf-client](https://github.com/Tei1988/aiwolf-client-ruby) gem を使ったAiwolf 4.x用のサンプル実装村人です。  
人狼知能についてもっと知りたい方は http://aiwolf.org をご覧ください。


## Installation

Execute:

    $ bundle --binstubs

## Usage

1. Start the aiwolf server. (See http://aiwolf.org/server)

2. Connect the sample implementation villager to the aiwolf server.  
Execute:

        $ bin/aiwolf execute SampleVillager

  To change the aiwolf server, you can use options.  
  `-h host -p port`  
  Use `-h 127.0.0.1 -p 10000` as default.

3. Click "Start Game" button on the aiwolf server.

-----

1. 人狼知能サーバを起動させます。 (http://aiwolf.org/server 参照)

2. 起動させたサーバにサンプル実装村人を接続します。  
  Execute:

        $ bin/aiwolf execute SampleVillager

  人狼知能サーバへの接続先はオプション引数で指定できます。  
  `-h host -p port`  
  デフォルトは`-h 127.0.0.1 -p 10000`です。

3. 人狼知能サーバの"Start Game"ボタンを押します。


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Tei1988/aiwolf-player-sample-villager .

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
