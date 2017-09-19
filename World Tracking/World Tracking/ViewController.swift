//
//  ViewController.swift
//  World Tracking
//
//  Created by Precious Metal on 9/17/17.
//  Copyright © 2017 roga. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    //position and location relative to real world
    @IBAction func reset(_ sender: Any) {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes {(node, boxNode) in
            node.removeFromParentNode()
            self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        }
        
        
    }
    @IBAction func add(_ sender: Any) {
        
      
        let boxNode = SCNNode()
        boxNode.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        boxNode.geometry?.firstMaterial?.specular.contents = UIColor.white
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue


        let doorNode = SCNNode()
        doorNode.geometry = SCNPlane(width: 0.03, height: 0.06)
        doorNode.geometry?.firstMaterial?.specular.contents = UIColor.white
        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown

        let node = SCNNode()
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red

        boxNode.position = SCNVector3(0, -0.05, 0)
        node.position = SCNVector3(0.2,0.3,-0.2)
        doorNode.position = SCNVector3(0, -0.02, 0.054)
        node.eulerAngles = SCNVector3(convertToRad(x: 180), 0, 0)

        self.sceneView.scene.rootNode.addChildNode(node)
        node.addChildNode(boxNode)
        boxNode.addChildNode(doorNode)
    }
    let configuration = ARWorldTrackingConfiguration()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
       
       self.sceneView.autoenablesDefaultLighting = true
        self.sceneView.session.run(configuration)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    func convertToRad(x: CInt) -> Double {
        return Double(x) * .pi/180
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

