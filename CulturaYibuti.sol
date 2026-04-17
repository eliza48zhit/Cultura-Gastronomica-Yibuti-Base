// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaYibuti
 * @dev Registro de procesos de infusion de especias y absorcion de lipidos.
 * Serie: Sabores de Africa (29/54)
 */
contract CulturaYibuti {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 densidadCardamomo;  // Nivel de infusion aromatica (1-10)
        uint256 absorcionLipidos;   // Capacidad del arroz para retener grasa (1-100)
        bool esCoccionLenta;        // Validador de proceso termico prolongado
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Skoudehkaris (Ingenieria de la Fusion)
        registrarPlato(
            "Skoudehkaris", 
            "Cordero, arroz, cardamomo, canela, tomates.",
            "Coccion lenta del cordero con especias para liberar colageno, seguido de la adicion de arroz para absorcion total de liquidos.",
            9, 
            85, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _cardamomo, 
        uint256 _absorcion,
        bool _lenta
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        
        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            densidadCardamomo: _cardamomo,
            absorcionLipidos: _absorcion,
            esCoccionLenta: _lenta,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
