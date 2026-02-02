import Foundation

public enum BrowserPermission: String, CustomStringConvertible {
    case geolocation = "geolocation"
    case camera = "camera"
    case microphone = "microphone"
    case notifications = "notifications"
    case midi = "midi"
    case push = "push"
    case clipboardRead = "clipboard-read"
    case clipboardWrite = "clipboard-write"
    case paymentHandler = "payment-handler"
    case usb = "usb"
    case bluetooth = "bluetooth"
    case accelerometer = "accelerometer"
    case gyroscope = "gyroscope"
    case magnetometer = "magnetometer"
    case ambientLightSensor = "ambient-light-sensor"
    case backgroundSync = "background-sync"
    case persistentStorage = "persistent-storage"
    case screenWakeLock = "screen-wake-lock"
    case webShare = "web-share"
    case xrSpatialTracking = "xr-spatial-tracking"

    public var description: String {
        return rawValue
    }
}
