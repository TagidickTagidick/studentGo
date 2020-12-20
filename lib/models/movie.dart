class Movie {
  final int id, year, numOfRatings, criticsReview, metascoreRating;
  final double rating;
  final List<String> genra;
  final String plot, plot1, title, poster, backdrop;
  final List<Map> cast;

  Movie({
    this.poster,
    this.backdrop,
    this.title,
    this.id,
    this.year,
    this.numOfRatings,
    this.criticsReview,
    this.metascoreRating,
    this.rating,
    this.genra,
    this.plot,
    this.plot1,
    this.cast,
  });
}

// our demo data movie data
List<Movie> movies = [
  Movie(
    id: 1,
    title: "Волонтерское направление",
    year: 2020,
    poster: "images/волонтерское_направление.jpg",
    backdrop: "images/волонтерское_направление.jpg",
    numOfRatings: 150212,
    rating: 7.3,
    criticsReview: 50,
    metascoreRating: 76,
    genra: ["Актив", "Развлечения"],
    plot: plotText,
    plot1: plotText1,
    cast: [
      {
        "orginalName": "Мария Андреева",
        "movieName": "Руководитель",
        "image": "images/Maria.jpg",
      },
      {
        "orginalName": "Ирина Смирнова",
        "movieName": "Участник",
        "image": "images/avatar.jpg",
      },
      {
        "orginalName": "Махад",
        "movieName": "Участник",
        "image": "images/Mahad.jpg",
      },
      {
        "orginalName": "Дык",
        "movieName": "Участник",
        "image": "images/Dyk.jpg",
      },
      {
        "orginalName": "Анастасия",
        "movieName": "Участник",
        "image": "images/Anastasia.jpg",
      },
    ],
  ),
  Movie(
    id: 2,
    title: "Ford v Ferrari ",
    year: 2019,
    poster: "assets/images/poster_21313133331313.jpg",
    backdrop: "assets/images/backdrop_23333313.jpg",
    numOfRatings: 150212,
    rating: 8.2,
    criticsReview: 50,
    metascoreRating: 76,
    genra: ["Action", "Biography", "Drama"],
    plot: plotText,
    plot1: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: 1,
    title: "Onward",
    year: 2020,
    poster: "assets/images/poster_312311323112213132.jpg",
    backdrop: "assets/images/backdrop_3123132123123321213213312.jpg",
    numOfRatings: 150212,
    rating: 7.6,
    criticsReview: 50,
    metascoreRating: 79,
    genra: ["Action", "Drama"],
    plot: plotText,
    plot1: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
];

String plotText =
    "Тебе нравится помогать другим? Хочешь стать частью крупнейших событий Ярославской области? Тогда тебе к нам!";

String plotText1 = "Чтобы присоединиться к волонтерскому направлению ПО ЯОМОО Союз студентов ЯрГУ им. П. Г. Демидова, просто позвони руководителю";