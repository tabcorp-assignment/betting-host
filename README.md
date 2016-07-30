Hello!

The following are the steps to run this program:

1. git clone https://github.com/tabcorp-assignment/betting-host.git
2. Install ruby (skip to 3, if you already have ruby installed)
  - I am currently using ruby-2.1.10,
  - You can install it following instructions from https://www.ruby-lang.org/en/documentation/installation/
3. cd betting-host
4. ruby betting_host.rb


The following is the overview of the design:

I think messages(methods) & data struture is the key for a project. Then we can do logical grouping of messages in class, so that each class has single responsibilty.

Messages: prompt_input, validate_input, store_input(store_data, store_result), display_output, win_divident, place_dividents

DataStruture: two hashes
1. win_bets, Hash with key as horse and value as array of bets
2. place_bets, Hash with key as horse and value as array of bets

Class: <public methods>

1. UserInterface: prompt_input, display_output
2. InputValidator: validate_input
3. DataInterface: store_data
4. WinDivident: win_divident
5. PlaceDivident: place_divident

The flow of the program is as follow's

1. bettin_host.rb is the base file it calls user_interface.rb
2. UserInterface check's valid input from InputValidator(input_validator.rb)
3. Stores in DataInterface(data_interface.rb)
4. Computes result from ResultInterface(result_interface.rb)
5. ResultInterface interacts with WinDivident & PlaceDivident (win_divident.rb & place_divident.rb) to compute the output
