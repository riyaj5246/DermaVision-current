//
//  LocationManager.swift
//  DermaVision
//
//  Created by Riya Jain on 4/3/22.
//

import CoreLocation
import UserNotifications

class LocationManager: NSObject, ObservableObject {
  let location = CLLocationCoordinate2D(latitude: 42.031980, longitude: -88.052120) //home location
  let notificationCenter = UNUserNotificationCenter.current()
  lazy var storeRegion = makeHomeRegion()
  @Published var didArriveAtTakeout = false
  // 1
  lazy var locationManager = makeLocationManager()
  // 2
  private func makeLocationManager() -> CLLocationManager {
    // 3
    let manager = CLLocationManager()
    manager.allowsBackgroundLocationUpdates = true
    // 4
    return manager
  }

  // 1
  private func makeHomeRegion() -> CLCircularRegion {
    // 2
    let region = CLCircularRegion(
      center: location,
      radius: 2, //meters
      identifier: UUID().uuidString)
    // 3
    region.notifyOnEntry = true
    region.notifyOnExit = true
    // 4
    return region
  }

  // 1
  func validateLocationAuthorizationStatus() {
    // 2
    switch locationManager.authorizationStatus {
    // 3
    case .notDetermined, .denied, .restricted, .authorizedWhenInUse:
      // 4
      print("Location Services Not Authorized")
      locationManager.requestWhenInUseAuthorization()
      requestNotificationAuthorization()

    // 5
    case .authorizedAlways:
      // 6
      print("Location Services Authorized")
      requestNotificationAuthorization()

    default:
      break
    }
  }

  // 1
  private func requestNotificationAuthorization() {
    // 2
    let options: UNAuthorizationOptions = [.sound, .alert]
    // 3
    notificationCenter
      .requestAuthorization(options: options) { [weak self] result, _ in
        // 4
        print("Auth Request result: \(result)")
        if result {
          self?.registerNotification()
        }
      }
  }

  // 1
  private func registerNotification() {
    // 2
    let notificationContent = UNMutableNotificationContent()
    notificationContent.title = "Welcome to Swifty TakeOut"
    notificationContent.body = "Your order will be ready shortly."
    notificationContent.sound = .default

    // 3
    let trigger = UNLocationNotificationTrigger(region: storeRegion, repeats: false)

    // 4
    let request = UNNotificationRequest(
      identifier: UUID().uuidString,
      content: notificationContent,
      trigger: trigger)

    // 5
    notificationCenter
      .add(request) { error in
        if error != nil {
          print("Error: \(String(describing: error))")
        }
      }
  }

  // 1
  override init() {
    super.init()
    // 2
    notificationCenter.delegate = self
  }
}
extension LocationManager: UNUserNotificationCenterDelegate {
  // 1
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    // 2
    print("Received Notification")
    didArriveAtTakeout = true
    // 3
    completionHandler()
  }

  // 4
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler:
      @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    // 5
    print("Received Notification in Foreground")
    didArriveAtTakeout = true
    // 6
    completionHandler(.sound)
  }
}
