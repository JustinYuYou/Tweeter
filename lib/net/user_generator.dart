import 'dart:math';

import 'package:tweeter/model/domain/user.dart';

class UserGenerator {
  UserGenerator._();

  static UserGenerator instance;

  static final MALE_IMAGE_URL =
      "https://faculty.cs.byu.edu/~jwilkerson/cs340/tweeter/images/donald_duck.png";
  static final FEMALE_IMAGE_URL =
      "https://faculty.cs.byu.edu/~jwilkerson/cs340/tweeter/images/daisy_duck.png";
  static List<String> maleNames = [
    "Kevin",
    "Zack",
    "Ken",
    "Benjamin",
    "Alonzo",
    "Sam",
    "Stanley",
    "Kermit",
    "Augustine",
    "Silas",
    "Sol",
    "Franklyn",
    "Clement",
    "Ezra",
    "Lee",
    "Hal",
    "Bruce",
    "Clifford",
    "Wilbert",
    "Lonny",
    "Marco",
    "Vaughn",
    "Brandon",
    "Odell",
    "Rudolf",
    "Teodoro",
    "Rico",
    "Tyree",
    "Eliseo",
    "Brice",
    "Jacinto",
    "Hunter",
    "Errol",
    "Bernardo",
    "Hayden",
    "Duncan",
    "Darron",
    "Tyler",
    "Haywood",
    "Lazaro",
    "Charles",
    "Maynard",
    "Everette",
    "Roosevelt",
    "Allen",
    "Willie",
    "Abraham",
    "Elijah",
    "Jody",
    "Stefan",
    "Bennett",
    "Rodger",
    "Xavier",
    "Osvaldo",
    "Rigoberto",
    "Kareem",
    "Chi",
    "Mohammed",
    "Justin",
    "Al",
    "Victor",
    "Spencer",
    "Irving",
    "Paris",
    "Theodore",
    "Malcom",
    "Houston",
    "Nick",
    "Jerald",
    "Huey",
    "Wade",
    "Paul",
    "Toby",
    "Mauricio",
    "Gino",
    "Valentin",
    "Santiago",
    "Son",
    "Seeger",
    "Daniel",
    "Larry",
    "Robbie",
    "Arthur",
    "Stuart",
    "Jeffry",
    "Blaine",
    "Jerrod",
    "Lyman",
    "Carey",
    "Giuseppe",
    "Ahmad",
    "Warner",
    "Thanh",
    "Cleveland",
    "Riley",
    "Carlo",
    "Richie",
    "Carmen",
    "Freddie",
    "Roberto",
    "Tyrell",
    "Sidney",
    "Christopher",
    "Stewart",
    "Dylan",
    "Scott",
    "Reuben",
    "Junior",
    "Jarrett",
    "Levi",
    "Irwin",
    "Hollis",
    "Agustin",
    "Dave",
    "Dalton",
    "Tracey",
    "Earnest",
    "Jewell",
    "Chauncey",
    "Gaylord",
    "Francisco",
    "Jake",
    "Everett",
    "Fabian",
    "Ezekiel",
    "Arden",
    "Stacy",
    "Marlon",
    "Lucien",
    "Woodrow",
    "Elvin",
    "Davis",
    "Ricardo",
    "Hilton",
    "Jasper",
    "Barton",
    "Anthony",
    "Lucio",
    "Deshawn",
    "Granville",
    "Burton",
    "Lawrence",
    "Santo"
  ];
  static List<String> femaleNames = [
    "Jolynn",
    "Maryland",
    "Marjorie",
    "Arletta",
    "Sanda",
    "Kyong",
    "Rosette",
    "Tera",
    "Spencer",
    "Jannette",
    "Gladys",
    "Nichole",
    "Terisa",
    "Tenesha",
    "Rebecca",
    "Alpha",
    "Elena",
    "Marsha",
    "Kelle",
    "Deedee",
    "Celsa",
    "Marget",
    "Anette",
    "Cicely",
    "Burma",
    "Madge",
    "Harriette",
    "Carlita",
    "Savanna",
    "Sharon",
    "Terresa",
    "Sharilyn",
    "Neida",
    "Idella",
    "Guillermina",
    "Kylee",
    "Dona",
    "Tilda",
    "Cher",
    "Belinda",
    "Danna",
    "Alexia",
    "Reynalda",
    "Dani",
    "Caroyln",
    "Celeste",
    "Zenaida",
    "Hailey",
    "Roxanna",
    "Pinkie",
    "Caitlin",
    "Karlene",
    "Myung",
    "Julianne",
    "Carin",
    "Tenisha",
    "Mariela",
    "Jeniffer",
    "Tawny",
    "Suzanna",
    "Corrina",
    "Lorena",
    "Joni",
    "Leola",
    "Deja",
    "Jeni",
    "Charmain",
    "Ardelia",
    "Kristy",
    "Chan",
    "Karan",
    "Venus",
    "Vernetta",
    "Lucina",
    "Bette",
    "Kimberli",
    "Elna",
    "Hiedi",
    "Venetta",
    "Latasha",
    "Marlen",
    "Leia",
    "Josette",
    "Marie",
    "Jaunita",
    "See",
    "Cheryle",
    "Leonore",
    "Vivan",
    "Wendolyn",
    "Maragaret",
    "Freda",
    "Christie",
    "Tonya",
    "Marylou",
    "Arletha",
    "Taren",
    "Doloris",
    "Lisa",
    "Evelynn",
    "Dionne",
    "Mallie",
    "Stephaine",
    "Shayna",
    "Iona",
    "Yuonne",
    "Ila",
    "Marquitta",
    "Lorene",
    "Sharyl",
    "Lonna",
    "Haley",
    "Leota",
    "Tiana",
    "Myrtle",
    "Shae",
    "Luana",
    "Judi",
    "Lucy",
    "Magaly",
    "Karie",
    "Andree",
    "Shanta",
    "Daysi",
    "Brande",
    "Sanora",
    "Carmelina",
    "Delilah",
    "Yvone",
    "Leann",
    "Ching",
    "Gearldine",
    "Dell",
    "Aurora",
    "Farrah",
    "Jenifer",
    "Shin",
    "Luetta",
    "Criselda",
    "Alene",
    "Salina",
    "Drusilla",
    "Freeda",
    "Elnora",
    "Cierra",
    "Jolanda",
    "Ludivina"
  ];

  static List<String> surnames = [
    "Torgeson",
    "Maston",
    "Lisenby",
    "Ocheltree",
    "Cadden",
    "Garden",
    "Delcastillo",
    "Mccawley",
    "Albertson",
    "Chiang",
    "Sydnor",
    "Mcnulty",
    "Bowdoin",
    "Quiroz",
    "Waechter",
    "Schaber",
    "Nalley",
    "Voris",
    "Kliebert",
    "Woosley",
    "Mandelbaum",
    "Lindahl",
    "Freitag",
    "Van",
    "Vinyard",
    "Heidelberg",
    "Petrosino",
    "Kissee",
    "Heckel",
    "Gutierez",
    "Compton",
    "Stehlik",
    "Curington",
    "Lockley",
    "Wilhite",
    "Meuser",
    "Marko",
    "Critchfield",
    "Kelm",
    "Favreau",
    "Ivie",
    "Demarco",
    "Ingalls",
    "Holoman",
    "Livingston",
    "Mcdougald",
    "Darner",
    "Mcpheeters",
    "Dooling",
    "Blo",
    "Crain",
    "Caffee",
    "Cubbage",
    "Music",
    "Honea",
    "Chait",
    "Sorensen",
    "Westerlund",
    "Paxton",
    "Klocke",
    "Nicola",
    "Lazaro",
    "Seeger",
    "Northington",
    "Nibert",
    "Coachman",
    "Wishon",
    "Mccants",
    "Zieman",
    "Simien",
    "Gaudet",
    "Stringfellow",
    "Maus",
    "Byer",
    "Liao",
    "Cullinan",
    "Messmer",
    "Mcroberts",
    "Cardiel",
    "Pink",
    "Ogorman",
    "Minott",
    "Lightfoot",
    "Hornung",
    "Amsler",
    "Kelson",
    "Mcfarlain",
    "Rakes",
    "Wasinger",
    "Cessna",
    "Emory",
    "Mccane",
    "Fluellen",
    "Cosgrove",
    "Laford",
    "Taggert",
    "Hudkins",
    "Anker",
    "Hardt",
    "Lemus",
    "Simington",
    "Carmouche",
    "Larusso",
    "Warnick",
    "Estell",
    "Turck",
    "Jeppesen",
    "Nigro",
    "Chirico",
    "Murchison",
    "Rule",
    "Beal",
    "Broman",
    "Lugo",
    "Silverman",
    "Redmond",
    "Pera",
    "Orlowski",
    "Zemlicka",
    "Ackerley",
    "Gies",
    "Bleich",
    "Medina",
    "Housman",
    "Goggans",
    "Silvey",
    "Goguen",
    "Mcpeek",
    "Brace",
    "Hetherington",
    "Smolen",
    "Dennis",
    "Ruark",
    "Line",
    "Meiers",
    "Schroyer",
    "Clear",
    "Hellard",
    "Buckalew",
    "Tu",
    "Schill",
    "Ridge",
    "Sacco",
    "Babbitt",
    "Durrell",
    "Vitagliano",
    "Mullan",
    "Villegas",
    "Kehr",
    "Pleasant",
    "Loss",
    "Mitten"
  ];

  static UserGenerator getInstance() {
    if (instance == null) {
      instance = UserGenerator._();
    }

    return instance;
  }

  List<User> generateUsers(int count) {
    List<User> users = new List();

    Random random = new Random();

    while (users.length < count) {
      // Randomly determine if the user will be male or female and generate a gender
      // specific first name
      var firstName;
      var imageULR;
      if (random.nextInt(2) == 0) {
        firstName = maleNames[random.nextInt(maleNames.length)];
        imageULR = MALE_IMAGE_URL;
      } else {
        firstName = femaleNames[random.nextInt(femaleNames.length)];
        imageULR = FEMALE_IMAGE_URL;
      }

      var lastName = surnames[random.nextInt(surnames.length)];
      User user = new User(
          firstName: firstName, lastName: lastName, photoURL: imageULR);
      if (!users.contains(user)) {
        users.add(user);
      }
    }

    print(users);

    return users;
  }
}