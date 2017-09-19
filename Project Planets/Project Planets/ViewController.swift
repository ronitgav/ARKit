//
//  ViewController.swift
//  Project Planets
//
//  Created by Precious Metal on 9/18/17.
//  Copyright © 2017 roga. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // debug options
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        // run the session
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        
        /* Declaring Nodes */
        
        // SUN
        
        let sun = SCNNode(geometry: SCNSphere(radius: 0.35))
        
        // DUMMY PLANETS
        
        let neptPar = SCNNode()
        let uranusPar = SCNNode()
        let satPar = SCNNode()
        let jupPar = SCNNode()
        let marsPar = SCNNode()
        let earthPar = SCNNode()
        let venusPar = SCNNode()
        let mercPar = SCNNode()
        
        
        
        // PLANETS
        
        let neptune = planet(geometry: SCNSphere(radius: 0.14), diffuse: #imageLiteral(resourceName: "neptune"), specular: nil, emission: nil, normal: nil, position: SCNVector3(4.1, 0, 0))
        
        let uranus = planet(geometry: SCNSphere(radius: 0.15), diffuse: #imageLiteral(resourceName: "uranus"), specular: nil, emission: nil, normal: nil, position: SCNVector3(3.3, 0, 0))
        
        let saturn = planet(geometry: SCNSphere(radius: 0.25), diffuse: #imageLiteral(resourceName: "saturn"), specular: nil, emission: nil, normal: nil, position: SCNVector3(3.0, 0, 0))
        
            let sat_ring = SCNNode(geometry: SCNCylinder(radius: 0.4, height: 0.01))
            sat_ring.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "saturn_ring")
        
        
        let jupiter = planet(geometry: SCNSphere(radius: 0.35), diffuse: #imageLiteral(resourceName: "jup"), specular: nil, emission: nil, normal: nil, position: SCNVector3(2.7, 0, 0))
        
        let mars = planet(geometry: SCNSphere(radius: 0.15), diffuse: #imageLiteral(resourceName: "mars-1"), specular: nil, emission: nil, normal: nil, position: SCNVector3(1.8, 0, 0))
        
        let earth = planet(geometry: SCNSphere(radius: 0.15), diffuse: #imageLiteral(resourceName: "Earth"), specular: #imageLiteral(resourceName: "specular"), emission: #imageLiteral(resourceName: "earth_emission"), normal: #imageLiteral(resourceName: "Normal"), position: SCNVector3(1.5, 0, 0))
        
            // MOON
            // Earth has one moon
        let moon = planet(geometry: SCNSphere(radius: 0.06), diffuse: #imageLiteral(resourceName: "moon"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0.3, 0, 0))
        
        
        let venus = planet(geometry: SCNSphere(radius: 0.2), diffuse: #imageLiteral(resourceName: "venus surf"), specular: nil, emission: #imageLiteral(resourceName: "venus atm"), normal: nil, position: SCNVector3(1.0, 0, 0))
        
        
        let mercury = planet(geometry: SCNSphere(radius: 0.18), diffuse: #imageLiteral(resourceName: "merc-1"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0.7, 0, 0))
        
        
        
        
        
        /* Position of dummy planets and sun */
        sun.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "sun_diffuse")
        sun.position = SCNVector3(0,0,-1)
        
        neptPar.position = SCNVector3(0,0, -1)
        uranusPar.position = SCNVector3(0, 0, -1)
        satPar.position = SCNVector3(0, 0, -1)
        jupPar.position = SCNVector3(0, 0, -1)
        marsPar.position = SCNVector3(0, 0, -1)
        earthPar.position = SCNVector3(0,0,-1)
        venusPar.position = SCNVector3(0,0,-1)
        mercPar.position = SCNVector3(0, 0, -1)
        
        
        /* Add to scene */
        self.sceneView.scene.rootNode.addChildNode(sun)
       
       self.sceneView.scene.rootNode.addChildNode(neptPar)
        self.sceneView.scene.rootNode.addChildNode(uranusPar)
        self.sceneView.scene.rootNode.addChildNode(satPar)
        self.sceneView.scene.rootNode.addChildNode(jupPar)
        self.sceneView.scene.rootNode.addChildNode(marsPar)
       
        self.sceneView.scene.rootNode.addChildNode(earthPar)
        self.sceneView.scene.rootNode.addChildNode(venusPar)
        self.sceneView.scene.rootNode.addChildNode(mercPar)
        
        
        /* Add rotating action */
        let neptParRotation = SCNAction.rotateBy(x: 0, y: CGFloat(convertToRad(num: 360)), z: 0, duration: 18)
        let uranusParRotation = SCNAction.rotateBy(x: 0, y: CGFloat(convertToRad(num: 360)), z: 0, duration: 16)
        
        
        let satParRotation = SCNAction.rotateBy(x: 0, y: CGFloat(convertToRad(num: 360)), z: 0, duration: 18)
            let saturn_rings_rotating = SCNAction.rotateBy(x: 0, y: CGFloat(convertToRad(num: 360)), z: 0, duration: 12)
        let jupParRotation = SCNAction.rotateBy(x: 0, y: CGFloat(convertToRad(num: 360)), z: 0, duration: 20)
        let marsParRotation = SCNAction.rotateBy(x: 0, y: CGFloat(convertToRad(num: 360)), z: 0, duration: 15)
        let earthParRotation = SCNAction.rotateBy(x: 0, y: CGFloat(convertToRad(num: 360)), z: 0, duration: 14)
        let venusParRotation = SCNAction.rotateBy(x: 0, y: CGFloat(convertToRad(num: 360)), z: 0, duration: 10)
        let mercParRotation = SCNAction.rotateBy(x: 0, y: CGFloat(convertToRad(num: 360)), z: 0, duration: 9)
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(convertToRad(num: 360)), z: 0, duration: 8)
        
        // moon's rotation
        let earthRot = SCNAction.rotateBy(x: 0, y: CGFloat(convertToRad(num: 360)), z: 0, duration: 17)
        
        /*To run actions forever */
        
        let forever = SCNAction.repeatForever(action)
        let foreverNept = SCNAction.repeatForever(neptParRotation)
        let foreverUranus = SCNAction.repeatForever(uranusParRotation)
        let foreverSaturn = SCNAction.repeatForever(satParRotation)
            let rings_rot = SCNAction.repeatForever(saturn_rings_rotating)
        let foreverJup = SCNAction.repeatForever(jupParRotation)
        let foreverMars = SCNAction.repeatForever(marsParRotation)
        let foreverEarth = SCNAction.repeatForever(earthParRotation)
        let foreverVenus = SCNAction.repeatForever(venusParRotation)
        let foreverMercury = SCNAction.repeatForever(mercParRotation)
        let foreverMoon = SCNAction.repeatForever(earthRot)
        
        /* Add Child Node */
        mercPar.addChildNode(mercury)
        venusPar.addChildNode(venus)
        earthPar.addChildNode(earth)
            earth.addChildNode(moon)
        marsPar.addChildNode(mars)
        jupPar.addChildNode(jupiter)
        satPar.addChildNode(saturn)
        uranusPar.addChildNode(uranus)
        neptPar.addChildNode(neptune)
        saturn.addChildNode(sat_ring)
        
        
        /* Run forever */
        sun.runAction(forever)
        mercPar.runAction(foreverMercury)
        venusPar.runAction(foreverVenus)
        earthPar.runAction(foreverEarth)
            earth.runAction(foreverMoon)
        marsPar.runAction(foreverMars)
        jupPar.runAction(foreverJup)
        satPar.runAction(foreverSaturn)
            saturn.runAction(rings_rot)
        uranusPar.runAction(foreverUranus)
        neptPar.runAction(foreverNept)
        
        
        
        
        
    }
    
    func planet(geometry: SCNGeometry, diffuse: UIImage, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3) -> SCNNode {
        let planet = SCNNode(geometry: geometry)
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.normal.contents = normal
        planet.geometry?.firstMaterial?.emission.contents = emission
        planet.position = position
        return planet
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func convertToRad(num: CInt) -> Float {
        return Float(num) * .pi/180
    }

}

