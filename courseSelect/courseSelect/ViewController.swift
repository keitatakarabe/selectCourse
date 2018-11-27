//
//  ViewController.swift
//  courseSelect
//
//  Created by 財部圭太 on 2018/11/20.
//  Copyright © 2018年 財部圭太. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var Scroll: UIScrollView!
	
	// スクロールさせるView
	@IBOutlet weak var FirstView: UIView!
	@IBOutlet weak var SecondView: UIView!
	@IBOutlet weak var ThirdView: UIView!
	// Viewの影
	@IBOutlet weak var firstShadow: UIView!
	@IBOutlet weak var secondShadow: UIView!
	@IBOutlet weak var thirdShadow: UIView!
	
	@IBOutlet weak var firstButton: UIButton!
	@IBOutlet weak var secondButton: UIButton!
	@IBOutlet weak var thirdButton: UIButton!
	// Buttonの影
	@IBOutlet weak var firstButtonShadow: UIView!
	@IBOutlet weak var secondButtonShadow: UIView!
	@IBOutlet weak var thirdButtonShadow: UIView!
	// タイトルのためのラベル
	@IBOutlet weak var firstTitle: UILabel!
	@IBOutlet weak var secondTitle: UILabel!
	@IBOutlet weak var thirdTitle: UILabel!
	// 説明文のためのラベル
	@IBOutlet weak var firstText: UILabel!
	@IBOutlet weak var secondText: UILabel!
	@IBOutlet weak var thirdText: UILabel!
	
	let spot:[[String]] = [["木1.png","木2.png","木3.png"],["人工物.png","人工物2.png","人工物3.png"],["海.png","海2.png","海3.png"]]
	var image:[UIImageView] = []
	var Icon:[UIImageView] = []
	// コースのタイトル
	let spotName:[String] = ["草原コース","人工物コース","海コース"]
	// コースの説明文
	let spotText:[String] = ["このコースは自然に囲まれたコースです。\n心を落ち着かせのんびりと散策しましょう。","このコースでは不思議な建設物を中心に散策することができます。","北海道ならではの海を見ながら散策できるコース。"]
	// アイコン
	let IconName:[[String]] = [["歩き.png", "車.png"],["車.png"],["歩き.png", "歩き.png"]]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// trueならframe外を見せない
		self.view.clipsToBounds = true
		// スクロールのframe
		Scroll.frame = CGRect(x: self.view.bounds.width * 0.02, y: self.view.bounds.height * 0.05, width: self.view.bounds.width * 0.78, height: self.view.bounds.height * 0.9)
		// スクロールのサイズ
		Scroll.contentSize = CGSize(width: Scroll.bounds.width * 3, height: Scroll.bounds.height)
		// スクロールで滑らないかどうか
		Scroll.isPagingEnabled = true
		// falseならframe外も見せる
		Scroll.clipsToBounds = false
		// Do any additional setup after loading the view, typically from a nib.
		// Viewの設定関数を呼び出す。
		setView(FirstView, Shadow: firstShadow, ShadowButton: firstButtonShadow, Title: firstTitle, Text: firstText, Button: firstButton, position: 0.0, theme: 0)
		setView(SecondView, Shadow: secondShadow, ShadowButton: secondButtonShadow, Title: secondTitle, Text: secondText, Button: secondButton, position: 1.0, theme: 1)
		setView(ThirdView, Shadow: thirdShadow, ShadowButton: thirdButtonShadow, Title: thirdTitle, Text: thirdText, Button: thirdButton, position: 2.0, theme: 2)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func trimmingImage(_ image: UIImage, trimmingArea: CGRect) -> UIImage {
		let imgRef = image.cgImage?.cropping(to: trimmingArea)
		let trimImage = UIImage(cgImage: imgRef!, scale: image.scale, orientation: image.imageOrientation)
		return trimImage
	}
	
	func readImage(_ image: String, View: UIView, trimX: CGFloat, trimY: CGFloat, trimWidth: CGFloat, trimHeight:CGFloat, posX:CGFloat, posY:CGFloat, imgWidth:CGFloat, imgHeight:CGFloat) -> UIImageView {
		// imageに配列から取り出したファイル名を代入して画像を読み込む
		let img:UIImage = UIImage(named: image)!
		// 左上から切り取る
		let trim = trimmingImage(img, trimmingArea: CGRect(x: trimX, y: trimY, width: trimWidth, height: trimHeight))
		// UIImageviewを画像を入れて作る
		let imgView = UIImageView(image: trim)
		// 画像を描写するサイズを決める
		imgView.frame = CGRect(x: posX, y: posY, width: imgWidth, height: imgHeight)
		imgView.contentMode = UIView.ContentMode.scaleAspectFit
		return imgView
	}
	
	func readIcon(_ image: String, posX:CGFloat, posY:CGFloat, imgWidth:CGFloat, imgHeight:CGFloat) -> UIImageView {
		// imageに配列から取り出したファイル名を代入して画像を読み込む
		let img:UIImage = UIImage(named: image)!
		// UIImageviewを画像を入れて作る
		let imgView = UIImageView(image: img)
		// 画像を描写するサイズを決める
		imgView.frame = CGRect(x: posX, y: posY, width: imgWidth, height: imgHeight)
		imgView.contentMode = UIView.ContentMode.scaleAspectFit
		return imgView
	}
	
	func setView(_ View: UIView, Shadow: UIView, ShadowButton: UIView, Title: UILabel, Text: UILabel, Button: UIButton, position: CGFloat, theme: Int){
		image.removeAll()
		Icon.removeAll()
		// Viewの影の設定
		Shadow.frame = CGRect(x: Scroll.bounds.width * position * 1.1, y: 0, width: Scroll.bounds.width, height: Scroll.bounds.height)
		// 影の色
		Shadow.layer.shadowColor = UIColor.black.cgColor
		// 影の透明度
		Shadow.layer.shadowOpacity = 0.5
		// 影の位置
		Shadow.layer.shadowOffset = CGSize(width: 1, height: 1)
		// 影を丸くする(デザインの人と相談してやるか決めたい)
		//Shadow.layer.cornerRadius = 10
		// Viewの設定
		let Frame:CGRect = CGRect(x: 0, y: 0, width: Scroll.bounds.width, height: Scroll.bounds.height)
		View.frame = Frame
		// 枠線
		View.layer.borderWidth = 0.5
		// 枠線を丸くする(デザインの人と相談してやるか決めたい)
		//View.layer.cornerRadius = 10
		// タイトルの設定
		Title.frame = CGRect(x: View.bounds.width * 0.015, y: View.bounds.height * 0.015, width: View.bounds.width * 0.5, height: View.bounds.height * 0.1)
		// themeにはどのコースかの数字が入る。0なら草原コース、1なら人工物、2なら海コース。
		Title.text = spotName[theme]
		// フォントのサイズ
		Title.font = UIFont.systemFont(ofSize: 24)
		// 文章の設定
		Text.frame = CGRect(x: View.bounds.width * 0.015, y: View.bounds.height * 0.138 + View.bounds.width * 0.3125, width: View.bounds.width * 0.76, height: View.bounds.height * 0.228)
		// 何行で表示するか
		Text.numberOfLines = 2
		// 単語で改行する（日本語にも有効みたい）
		Text.lineBreakMode = .byTruncatingTail
		Text.text = spotText[theme]
		Text.font = UIFont.systemFont(ofSize: 20)
		// ボタンの影の設定
		ShadowButton.frame = CGRect(x: View.bounds.width * 0.8 - View.bounds.height * 0.03, y: View.bounds.height * 0.845, width: View.bounds.width * 0.20, height: View.bounds.height * 0.125)
		ShadowButton.layer.shadowColor = UIColor.black.cgColor
		ShadowButton.layer.shadowOpacity = 0.5
		ShadowButton.layer.shadowOffset = CGSize(width: 5, height: 5)
		ShadowButton.layer.cornerRadius = 10
		// ボタンの設定
		Button.frame = CGRect(x: 0, y: 0, width: View.bounds.width * 0.20, height: View.bounds.height * 0.125)
		Button.layer.cornerRadius = 10
		Button.layer.borderWidth = 1.0
		Button.setTitle("コース決定", for: UIControl.State.normal)
		// 画像をViewにセットする
		for (i,value) in spot[theme].enumerated(){
			image.append(readImage(value, View: View, trimX: 0, trimY: 0, trimWidth: 3000, trimHeight: 3000, posX: View.bounds.width * 0.015 + View.bounds.width * 0.3125 * CGFloat(i) + View.bounds.width * 0.015 * CGFloat(i), posY: View.bounds.height * 0.138, imgWidth: View.bounds.width * 0.3125, imgHeight: View.bounds.width * 0.3125))
			View.addSubview(image[i])
		}
		// アイコンをセットする（右から左にセットするので拡張性がある）
		for (i,value) in IconName[theme].enumerated(){
			Icon.append(readIcon(value, posX: View.bounds.width * 0.8825 - View.bounds.width * 0.11 * CGFloat(i), posY: View.bounds.height * 0.015, imgWidth: View.bounds.width * 0.1, imgHeight: View.bounds.height * 0.1))
			View.addSubview(Icon[i])
		}
	}
	
	/*
	   遷移後に値を渡す関数(選んだボタンによって処理を変えることができる)
	   Firstは草原コース,Secondは人工物コース,Thirdは海コースを選択した場合である。
	*/
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		// 呼び出したidentifierによって遷移先画面への処理を分ける
		if segue.identifier == "First" {
			let viewController = segue.destination as! ViewController2
			// キャストしたのでResultViewControllerのScene変数にアクセスできる
			viewController.Scene = 0
		}
		
		if segue.identifier == "Second" {
			let viewController = segue.destination as! ViewController2
			viewController.Scene = 1
		}
		
		if segue.identifier == "Third" {
			let viewController = segue.destination as! ViewController2
			viewController.Scene = 2
		}
	}
}

