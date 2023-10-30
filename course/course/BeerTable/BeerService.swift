
final class BeerService {
    let decoder = JSONDecoder()
    let session: URLSession = {
        let sessionConfiguration = URLSessionConfiguration.default()
        let session = URLSession(configuration: sessionConfiguration)
        return session
    }()
    func fetchBeer(completionHandler: @escaping ([BeerDTO] -> Void)) {
        session.dataTask(with: url, completionHandler: { data, response, error in
            guard
                let data = data,
                let response,
                error == nil
            else {
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let beerData = try! decoder.decode([BeerDTO].self, from: data)
            completionHandler(beerData)
        }).resume()
    }
    
    
}
