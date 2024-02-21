class Movie < ApplicationRecord
    has_many :favorites
    has_many :users, through: :favorites

    def self.film
        require 'uri'
        require 'net/http'
        
        url = URI("https://imdb-top-100-movies.p.rapidapi.com/")
        
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        
        request = Net::HTTP::Get.new(url)
        request["X-RapidAPI-Key"] = 'cc2eb3e0c1msh74553d800b55ccfp1a8550jsna2c0f4f06fc5'
        request["X-RapidAPI-Host"] = 'imdb-top-100-movies.p.rapidapi.com'
        
        response = http.request(request)
        json = JSON.parse(response.body)
        json.each do |d|
            filmler = Movie.create()
            filmler.title = d['title']
            filmler.year = d["year"]
            filmler.genre = d["genre"]
            filmler.plot = d["description"]
            filmler.poster = d["image"]
            filmler.rating = d["rating"]
            filmler.save
        end       
    end
end
