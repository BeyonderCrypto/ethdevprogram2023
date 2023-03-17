// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract PokemonFactory {
////////// RETO 1 ///////////
event eventNewPokemon(string _msgeventnvopokemon,string _pokemoncreado);

////////// RETO 3 ///////////
 struct pokemonHabilites {
    string nameHabilities;
    string descHabilities;
  }

  struct Pokemon {
    uint id;
    string name;
    string[] pokeHabilidad;
  }

  

    Pokemon[] private pokemons;
    pokemonHabilites[] private habilities;


    mapping (uint => address) public pokemonToOwner;
    mapping (address => uint) ownerPokemonCount;

     function createPokemon (string memory _name, uint _id,string[] memory _habilidad) public {

        ////////////// RETO 2 /////////////////
        require(_id > 0,"El id debe ser mayor a 0");
        require(bytes(_name).length > 2,"El nombre del nuevo pokemon no debe estar vacio o menor a 3 carcteres.");
        pokemons.push(Pokemon(_id, _name,_habilidad));
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
         emit eventNewPokemon("Un nuevo pokemon ha sido creado.",_name);
    }
       

    function getAllPokemons() public view returns (Pokemon[] memory) {
      return pokemons;
    }


    function getResult() public pure returns(uint product, uint sum){
      uint a = 1; 
      uint b = 2;
      product = a * b;
      sum = a + b; 
   }


}