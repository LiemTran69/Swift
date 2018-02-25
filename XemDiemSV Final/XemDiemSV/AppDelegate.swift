import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    @objc var id: String!
    @objc let uDefault = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    @objc internal var shouldRotate = false
    func application(_ application: UIApplication,
                     supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return shouldRotate ? .allButUpsideDown : .portrait
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            if shortcutItem.type == "TKB" {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let viewTKB = sb.instantiateViewController(withIdentifier: "tkb") as! TKBViewController
                viewTKB.id = uDefault.string(forKey: "idDefault")!
                let root = UIApplication.shared.keyWindow?.rootViewController
                root?.present(viewTKB, animated: false, completion: {() -> Void in
                    completionHandler(true)
                })
            }
            else if shortcutItem.type == "GPA" {
     
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let viewGPA = sb.instantiateViewController(withIdentifier: "gpa") as! GPAViewController
                viewGPA.id = uDefault.string(forKey: "idDefault")!
                viewGPA.root = true
                let root = UIApplication.shared.keyWindow?.rootViewController
                root?.present(viewGPA, animated: false, completion: {() -> Void in
                    completionHandler(true)
                })
            }
            else if shortcutItem.type == "DD" {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let DD = sb.instantiateViewController(withIdentifier: "selectsm") as! SelectSMViewController
                DD.id = uDefault.string(forKey: "idDefault")!
                let root = UIApplication.shared.keyWindow?.rootViewController
                root?.present(DD, animated: false, completion: {() -> Void in
                    completionHandler(true)
                })
            }
            else if shortcutItem.type == "AHSU" {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let ahsu = sb.instantiateViewController(withIdentifier: "abouthsu") as! AboutHSUViewController
                let root = UIApplication.shared.keyWindow?.rootViewController
                root?.present(ahsu, animated: false, completion: {() -> Void in
                    completionHandler(true)
                })
            }
            
        }
        else {
            print("This is first launch")
            
        }
    }
    // MARK: - Core Data stack

    @objc lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "XemDiemSV")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    @objc func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

