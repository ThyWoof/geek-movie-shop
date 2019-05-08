//
// Products
//
db = db.getSiblingDB('catalogue');
db.products.insertMany([{
        sku: 'star-wars-iv',
        name: 'Star Wars: Episode IV - A New Hope',
        description: '',
        year: '1977',
        imdbID: 'tt0076759',
        categories: ['Star Wars'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'
    }, {
        sku: 'star-wars-v',
        name: 'Star Wars: Episode V - The Empire Strikes Back',
        description: '',
        year: '1980',
        imdbID: 'tt0080684',
        categories: ['Star Wars'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'
    }, {
        sku: 'star-wars-vi',
        name: 'Star Wars: Episode VI - Return of the Jedi',
        description: '',
        year: '1983',
        imdbID: 'tt0086190',
        categories: ['Star Wars'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BOWZlMjFiYzgtMTUzNC00Y2IzLTk1NTMtZmNhMTczNTk0ODk1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg'
    }, {
        sku: 'star-wars-vii',
        name: 'Star Wars: The Force Awakens',
        description: '',
        year: '2015',
        imdbID: 'tt2488496',
        categories: ['Star Wars'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BOTAzODEzNDAzMl5BMl5BanBnXkFtZTgwMDU1MTgzNzE@._V1_SX300.jpg'
    }, {
        sku: 'star-wars-i',
        name: 'Star Wars: Episode I - The Phantom Menace',
        description: '',
        year: '1999',
        imdbID: 'tt0120915',
        categories: ['Star Wars'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BYTRhNjcwNWQtMGJmMi00NmQyLWE2YzItODVmMTdjNWI0ZDA2XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg'
    }, {
        sku: 'star-wars-iii',
        name: 'Star Wars: Episode III - Revenge of the Sith',
        description: '',
        year: '2005',
        imdbID: 'tt0121766',
        categories: ['Star Wars'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BNTc4MTc3NTQ5OF5BMl5BanBnXkFtZTcwOTg0NjI4NA@@._V1_SX300.jpg'
    }, {
        sku: 'star-wars-ii',
        name: 'Star Wars: Episode II - Attack of the Clones',
        description: '',
        year: '2002',
        imdbID: 'tt0121765',
        categories: ['Star Wars'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BMDAzM2M0Y2UtZjRmZi00MzVlLTg4MjEtOTE3NzU5ZDVlMTU5XkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg'
    }, {
        sku: 'star-wars-story-i',
        name: 'Rogue One: A Star Wars Story',
        description: '',
        year: '2016',
        imdbID: 'tt3748528',
        categories: ['Star Wars Stories'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BMjEwMzMxODIzOV5BMl5BanBnXkFtZTgwNzg3OTAzMDI@._V1_SX300.jpg'
    }, {
        sku: 'star-wars-viii',
        name: 'Star Wars: The Last Jedi',
        description: '',
        year: '2017',
        imdbID: 'tt2527336',
        categories: ['Star Wars'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BMjQ1MzcxNjg4N15BMl5BanBnXkFtZTgwNzgwMjY4MzI@._V1_SX300.jpg'
    }, {
        sku: 'star-wars-story-ii',
        name: 'Solo: A Star Wars Story',
        description: '',
        year: '2018',
        imdbID: 'tt3778644',
        categories: ['Star Wars Stories'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BOTM2NTI3NTc3Nl5BMl5BanBnXkFtZTgwNzM1OTQyNTM@._V1_SX300.jpg'
    },
    {
        sku: 'lord-rings-i',
        name: 'The Lord of the Rings: The Fellowship of the Ring',
        description: '',
        year: '2001',
        imdbID: 'tt0120737',
        categories: ['The Lord of the Rings'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SX300.jpg'
    }, {
        sku: 'lord-rings-ii',
        name: 'The Lord of the Rings: The Return of the King',
        description: '',
        year: '2003',
        imdbID: 'tt0167260',
        categories: ['The Lord of the Rings'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'
    }, {
        sku: 'lord-rings-iii',
        name: 'The Lord of the Rings: The Two Towers',
        description: '',
        year: '2002',
        imdbID: 'tt0167261',
        categories: ['The Lord of the Rings'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BNGE5MzIyNTAtNWFlMC00NDA2LWJiMjItMjc4Yjg1OWM5NzhhXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'
    }, {
        sku: 'harry-potter-8',
        name: 'Harry Potter and the Deathly Hallows: Part 2',
        description: '',
        year: '2011',
        imdbID: 'tt1201607',
        categories: ['Harry Potter'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BMjIyZGU4YzUtNDkzYi00ZDRhLTljYzctYTMxMDQ4M2E0Y2YxXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg'
    }, {
        sku: 'harry-potter-1',
        name: 'Harry Potter and the Sorceres Stone',
        description: '',
        year: '2001',
        imdbID: 'tt0241527',
        categories: ['Harry Potter'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BNjQ3NWNlNmQtMTE5ZS00MDdmLTlkZjUtZTBlM2UxMGFiMTU3XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg'
    }, {
        sku: 'harry-potter-5',
        name: 'Harry Potter and the Chamber of Secrets',
        description: '',
        year: '2002',
        imdbID: 'tt0295297',
        categories: ['Harry Potter'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BMTcxODgwMDkxNV5BMl5BanBnXkFtZTYwMDk2MDg3._V1_SX300.jpg'
    }, {
        sku: 'harry-potter-6',
        name: 'Harry Potter and the Prisoner of Azkaban',
        description: '',
        year: '2004',
        imdbID: 'tt0304141',
        categories: ['Harry Potter'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BMTY4NTIwODg0N15BMl5BanBnXkFtZTcwOTc0MjEzMw@@._V1_SX300.jpg'
    }, {
        sku: 'harry-potter-4',
        name: 'Harry Potter and the Goblet of Fire',
        description: '',
        year: '2005',
        imdbID: 'tt0330373',
        categories: ['Harry Potter'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BMTI1NDMyMjExOF5BMl5BanBnXkFtZTcwOTc4MjQzMQ@@._V1_SX300.jpg'
    }, {
        sku: 'harry-potter-2',
        name: 'Harry Potter and the Order of the Phoenix',
        description: '',
        year: '2007',
        imdbID: 'tt0373889',
        categories: ['Harry Potter'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BMTM0NTczMTUzOV5BMl5BanBnXkFtZTYwMzIxNTg3._V1_SX300.jpg'
    }, {
        sku: 'harry-potter-7',
        name: 'Harry Potter and the Deathly Hallows: Part 1',
        description: '',
        year: '2010',
        imdbID: 'tt0926084',
        categories: ['Harry Potter'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BMTQ2OTE1Mjk0N15BMl5BanBnXkFtZTcwODE3MDAwNA@@._V1_SX300.jpg'
    }, {
        sku: 'harry-potter-3',
        name: 'Harry Potter and the Half-Blood Prince',
        description: '',
        year: '2009',
        imdbID: 'tt0417741',
        categories: ['Harry Potter'],
        price: 30,
        instock: 15,
        poster: 'https://m.media-amazon.com/images/M/MV5BNzU3NDg4NTAyNV5BMl5BanBnXkFtZTcwOTg2ODg1Mg@@._V1_SX300.jpg'
    }
]);

// full text index for searching
db.products.createIndex({
    name: "text",
    description: "text"
});

// unique index for product sku
db.products.createIndex({
    sku: 1
}, {
    unique: true
});