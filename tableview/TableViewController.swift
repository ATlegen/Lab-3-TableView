//
//  TableViewController.swift
//  tableview
//
//  Created by Assemgul on 26.11.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayPlaces = [Place(country: "Great Britain", city: "London", imageName: "london", text: " Ло́ндон — столица и крупнейший город Англии и Великобритании. Административно образует регион Англии Большой Лондон, разделённый на 33 самоуправляемых территории (см. боро Лондона). Население города в 2023 году составляет 9 648 110 человек. Образует агломерацию Большой Лондон и более обширный метрополитенский район. Расположен на юго-востоке острова Великобритания, на равнине в устье Темзы, вблизи Северного моря. Главный политический, экономический и культурный центр Соединённого Королевства."),
                       Place(country: "Japan", city: "Tokyo", imageName: "tokyo", text: "То́кио — столица и крупнейший город Японии, её административный, финансовый, промышленный и политический центр. Крупнейшая городская экономика мира. Расположен в юго-восточной части острова Хонсю, на равнине Канто в бухте Токийского залива Тихого океана. Помимо столицы, Токио также является одной из сорока семи префектур страны. Площадь префектуры составляет 2188,67 км², население — 14 064 696 человек (1 октября 2020), плотность населения — 6426,14 чел./км². По состоянию на 1 августа 2021 года население Токио составляло 14 043 239 человек, что делает Токио префектурой с самым большим населением в Японии. Большой Токио является городской территорией, городской агломерацией и метрополитенским ареалом с самым большим населением в мире. Токио, являясь одной из самых больших городских агломераций на Земле, считается самым безопасным городом в мире."),
                       Place(country: "France", city: "Paris", imageName: "paris", text:"Пари́ж — столица и крупнейший город Франции. Находится на севере государства, в центральной части Парижского бассейна, на реке Сена. Население 2,2 млн человек (2016). Центр агломерации Большой Париж (6,6 млн), ядро исторического региона Иль-де-Франс (более 12 млн). Образует коммуну и департамент, разделённый на 20 округов.\n Относится к глобальным городам и мировым финансовым центрам. Здесь располагаются штаб-квартиры ЮНЕСКО и ряда других международных организаций."),
                       Place(country: "Korea", city: "Seoul", imageName: "seoul", text: "Сеу́л — столица и крупнейший город Республики Корея. Образует единственный в стране город особого подчинения, разделённый на 25 самоуправляемых районов. Официальное название города — Город особого подчинения Сеул. Население — 9,4 млн человек (июнь 2023), или 18,3 % населения страны. Образует агломерацию Сеул-Инчхон с населением 26 млн человек (2023 г.), девятую по величине в мире. Расположен на северо-западе Республики Корея вблизи Жёлтого моря, на равнине в окружении гор, на берегах реки Ханган, в 24 км от границы с КНДР. Главный политический, экономический и культурный центр Республики Корея. Один из ведущих финансовых центров Восточной Азии."),
                       Place(country: "Turkey", city: "Istanbul", imageName: "istanbul", text: "Стамбу́л, ранее известный как Византий, затем как Константинополь, в древнерусских источниках упоминается как Царьград), — крупнейший город Турции, экономический, исторический и культурный центр страны. Является также центром Мраморноморского региона. Расположен в Евразии, на берегах пролива Босфор (разделяющего Европу и Азию), между Мраморным и Чёрным морями. Европейская (основная) и азиатская части города соединены мостами и тоннелями. Стамбул, где проживают свыше 15 млн человек, является одним из самых населённых городов мира. Бывшая столица Римской, Восточно-Римской (Византийской), а также Латинской и Османской империй. Столицей Турции Стамбул не является. В 1923 году, после Войны за независимость Турции, новой столицей страны стала Анкара.")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func addPlace(_ sender: Any) {
        arrayPlaces.append(Place(country: "new country", city: "new city", imageName: "city", text: "text"))
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
  
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return arrayPlaces.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = "\(arrayPlaces[indexPath.row].country)"
        
        let labelCity = cell.viewWithTag(1001) as! UILabel
        labelCity.text = "\(arrayPlaces[indexPath.row].city)"
        
        let imageView = cell.viewWithTag(1002) as! UIImageView
        imageView.image = UIImage(named: arrayPlaces[indexPath.row].imageName)
        

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(withIdentifier: "detalViewController") as! ViewController
        
        detailVc.place = arrayPlaces[indexPath.row]
        
        navigationController?.show(detailVc, sender: self)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            arrayCountry.remove(at: indexPath.row)
//            arrayCity.remove(at: indexPath.row)
//            arrayImage.remove(at: indexPath.row)
            arrayPlaces.remove(at: indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
