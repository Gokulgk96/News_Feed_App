//
//  ViewController.swift
//  News_App
//
//  Created by Gokul Gopalakrishnan on 01/12/21.
//

import UIKit
import SafariServices

var apicaller: news = news.init(articles: [])

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
   
    @IBOutlet weak var Table_views: UITableView!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        
       JsonDownloader{
            
            self.Table_views.reloadData()
        }
 
    //    self.Table_views.separatorStyle = UITableViewCell.SeparatorStyle.none
 
       

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return apicaller.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SubTableView_cell
        
        cell.set(label: apicaller.articles[indexPath.row].title ?? "nil" , Sub_label: apicaller.articles[indexPath.row].description ?? "No description (Click to see the Full News Coverage)",
                 Image: apicaller.articles[indexPath.row].urlToImage ?? "nil")
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articlelink = apicaller.articles[indexPath.row].url
        
        guard let url = URL(string: articlelink! ) else
        {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
 

    
    func JsonDownloader(completed: @escaping () -> ())
    {
            
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=e85bf764dc74481a9a842bbee6e76efa")!


      let task = URLSession.shared.dataTask(with: url)
                {
                    data, response, error in
                    
                    if let data = data
                    {
                        do
                        {
                            apicaller = try JSONDecoder().decode(news.self, from: data)
                       
                            DispatchQueue.main.async {
                                completed()
                            }
                        }catch
                        {
                            print("Error")
                        }
                    }
                }
                task.resume()
    
        
        Table_views.reloadData()
            
    }
   
}


  

    
