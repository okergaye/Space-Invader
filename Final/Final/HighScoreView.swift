//
//  MainMenuView.swift
//  Final
//
//  Created by Macintosh on 4/12/18.
//  Copyright © 2018 Osama Kergaye. All rights reserved.
//

import Foundation
import UIKit



class HighScoreView: UIView {
    weak var menuDel: menuDelgate?
    var Title: UILabel!
    var Board: UIStackView!
    var BackButton: UIButton!
    var One, Two, Three, Four, Five: UILabel!
    let backColor = UIColor.black.withAlphaComponent(0.4)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.contents = #imageLiteral(resourceName: "splash.jpg").cgImage
        // translatesAutoresizingMaskIntoConstraints = false
        Title = UILabel()
        Title.textAlignment = .center
        Title.baselineAdjustment = .alignCenters
        Title.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        Title.textColor = .white
        
        Board = UIStackView()
        Board.backgroundColor = UIColor.white
        Board.alignment = .fill
        Board.axis = .vertical
        Board.distribution = .fillEqually
        
        BackButton = UIButton()
        BackButton.backgroundColor = backColor
        BackButton.titleLabel?.textColor = .white
        BackButton.addTarget(self, action: #selector(BackButtonPress), for: .touchDown)
        
        setupBoardContents()
        
        Board.addArrangedSubview(One)
        Board.addArrangedSubview(Two)
        Board.addArrangedSubview(Three)
        Board.addArrangedSubview(Four)
        Board.addArrangedSubview(Five)
        Board.addArrangedSubview(BackButton)
        
        addSubview(Title)
        addSubview(Board)
    }
    
    func setupBoardContents(){
        One = UILabel()
        One.backgroundColor = backColor
        One.textAlignment = .center
        One.baselineAdjustment = .alignCenters
        One.textColor = .white
        
        Two = UILabel()
        Two.backgroundColor = backColor
        Two.textAlignment = .center
        Two.baselineAdjustment = .alignCenters
        Two.textColor = .white
        
        Three = UILabel()
        Three.backgroundColor = backColor
        Three.textAlignment = .center
        Three.baselineAdjustment = .alignCenters
        Three.textColor = .white
        
        Four = UILabel()
        Four.backgroundColor = backColor
        Four.textAlignment = .center
        Four.baselineAdjustment = .alignCenters
        Four.textColor = .white
        
        Five = UILabel()
        Five.backgroundColor = backColor
        Five.textAlignment = .center
        Five.baselineAdjustment = .alignCenters
        Five.textColor = .white
    }
    
    //helps format my timeinteval
    func TimeIntervalToString(interval: TimeInterval) -> NSString {
        let inter = NSInteger(interval)
        let seconds = inter % 60
        let minutes = (inter / 60) % 60
        let hours = (inter / 3600)
        return NSString(format: "%0.2d:%0.2d:%0.2d%",hours,minutes,seconds)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let fontConst = UIFont.systemFont(ofSize: frame.width  * 0.09)
        let now = Date()
        let today = TimeIntervalToString(interval: now.timeIntervalSince1970)
        Title.font = fontConst
        Title.text = "Top Players!"
        
        BackButton.titleLabel?.font = fontConst
        BackButton.setTitle("Back", for: .normal)
        
        One.font = fontConst
        
        if(M.gameOverStatic){
            One.text = "1. You! \(today) "
            M.gameOverStatic = false
        }else{
            One.text = "1. Billy 1"
        }
        
        Two.font = fontConst
        Two.text = "2. Bob 1"
        Three.font = fontConst
        Three.text = "3. Jones 0"
        Four.font = fontConst
        Four.text = "4. Stoker 0"
        Five.font = fontConst
        Five.text = "5. Dave! 0"
        
        Board.frame = CGRect(x: 0, y: 0 + (frame.height * 1/10), width: frame.width , height: frame.height - (frame.height * 1/10)).insetBy(dx: 0, dy: frame.height * 1/10)
        Title.frame = CGRect(x: 0, y: 0, width: frame.width , height: frame.height * 1/10)
    }
    
    
    
    @objc func BackButtonPress(sender: UIButton){
        menuDel?.popHSView()
        debugPrint("BackButtonPRess in hsview")
    }
    
    // staticish stuff beloew this point.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("dumapple")
    }
    
    
    
    
    
    
    
    
    
    
}
