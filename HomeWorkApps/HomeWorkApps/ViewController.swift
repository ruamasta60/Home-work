//
//  ViewController.swift
//  HomeWorkApps
//
//  Created by MAC OSX on 24/07/2019.
//  Copyright © 2019 MAC OSX. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var diemMiengTf: UITextField!
    @IBOutlet weak var diemGiuaKiTf: UITextField!
    @IBOutlet weak var diemCuoiKiTf: UITextField!
    @IBOutlet weak var tinhDiemBtn: UIButton!
    @IBOutlet weak var loaiHSTf: UILabel!
    @IBOutlet weak var diemTrungBinhLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        diemMiengTf.delegate = self
        diemGiuaKiTf.delegate = self
        diemCuoiKiTf.delegate = self
        //
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tinhDiemBtn.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        tinhDiemBtn.layer.borderWidth = 0.5
        tinhDiemBtn.layer.cornerRadius = 10
    }
    
    func validate() -> (Bool, String) {
        let characterset = CharacterSet(charactersIn: "0123456789.,")
        //MARK: - validate diem mieng
        if diemMiengTf.text?.trim() != "" {
            if diemMiengTf.text?.rangeOfCharacter(from: characterset.inverted) != nil {
                return (false, "Điểm miệng chỉ được nhập định dạnh số")
            }
            
            if let splitDiemMieng = diemMiengTf.text?.split(separator: ",") {
                if diemMiengTf.text?.first == "," || diemMiengTf.text?.first == "." {
                    return (false, "Ký tự đầu tiên của điểm miệng không được chứa dấu phẩy (,) hoặc dấu (.)")
                } else {
                    for i in 0..<splitDiemMieng.count {
                        if Float(splitDiemMieng[i])! > Float(10.0) {
                            return (false, "Điểm miệng không được lớn hơn 10 điểm")
                        }
                    }
                }
            }
        }
        //
        //MARK: - validate diem giua ki
        if diemGiuaKiTf.text?.trim() == "" {
            return (false, "Bạn chưa nhập điểm giữa kì")
        }
        else if diemGiuaKiTf.text?.trim() != "" {
            if diemGiuaKiTf.text?.rangeOfCharacter(from: characterset.inverted) != nil {
                return (false, "Điểm giữa kì chỉ được nhập định dạnh số")
            }
            
            if let splitDiemGiuaKi = diemGiuaKiTf.text?.split(separator: ",") {
                if diemGiuaKiTf.text?.first == "," || diemGiuaKiTf.text?.first == "." {
                    return (false, "Ký tự đầu tiên của điểm giữa kì không được chứa dấu phẩy (,) hoặc dấu (.)")
                } else {
                    for i in 0..<splitDiemGiuaKi.count {
                        if Float(splitDiemGiuaKi[i])! > Float(10.0) {
                            return (false, "Điểm giữa kì không được lớn hơn 10 điểm")
                        }
                    }
                }

            }
        }
        //
        //MARK: - validate diem cuoi ki
        if diemCuoiKiTf.text?.trim() == "" {
            return (false, "Bạn chưa nhập điểm cuối kì")
        } else if diemCuoiKiTf.text?.trim() != "" {
            if diemCuoiKiTf.text?.rangeOfCharacter(from: characterset.inverted) != nil {
                return (false, "Điểm cuối kì chỉ được nhập định dạnh số")
            }
            if let splitDiemCuoiKi = diemCuoiKiTf.text?.split(separator: ",") {
                if diemCuoiKiTf.text?.first == "," || diemCuoiKiTf.text?.first == "." {
                    return (false, "Ký tự đầu tiên của điểm giữa kì không được chứa dấu phẩy (,) hoặc dấu (.)")
                } else {
                    for i in 0..<splitDiemCuoiKi.count {
                        if Float(splitDiemCuoiKi[i])! > Float(10.0) {
                            return (false, "Điểm cuối kì không được lớn hơn 10 điểm")
                        }
                    }
                }
            }
        }
        return (true, "")
    }

    //MARK: - Action
    @IBAction func CountAct(_ sender: UIButton) {
        let (isOK, msg) = self.validate()
        if !isOK {
            let alert = UIAlertController(title: "THÔNG BÁO", message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ĐỒNG Ý", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        tinhDiem()
    }
    
    func tinhDiem() {
        var diemMieng: Float = 0.0
        var diemGiuaKi: Float = 0.0
        var diemCuoiKi: Float = 0.0
        
        var soLuongDiem1: Int = 0
        var soLuongDiem2: Int = 0
        var soLuongDiem3: Int = 0
        
        if let splitDiemMieng = diemMiengTf.text?.split(separator: ",") {
            for i in 0..<splitDiemMieng.count {
                diemMieng += Float(splitDiemMieng[i])!
            }
            soLuongDiem1 = splitDiemMieng.count
            print(diemMieng)
        }
        
        if let splitDiemGiuaKi = diemGiuaKiTf.text?.split(separator: ",") {
            for i in 0..<splitDiemGiuaKi.count {
                diemGiuaKi += Float(splitDiemGiuaKi[i])!
            }
            soLuongDiem2 = splitDiemGiuaKi.count
            print(diemGiuaKi)
        }
        
        if let splitDiemCuoiKi = diemCuoiKiTf.text?.split(separator: ",") {
            for i in 0..<splitDiemCuoiKi.count {
                diemCuoiKi += Float(splitDiemCuoiKi[i])!
            }
            soLuongDiem3 = splitDiemCuoiKi.count
            print(diemCuoiKi)
        }
        
        let total = (diemMieng + (diemGiuaKi * 2) + (diemCuoiKi * 3)) / Float(soLuongDiem1 + (soLuongDiem2 * 2) + (soLuongDiem3 * 3))
        
        print(total)
        
        diemTrungBinhLb.text = "Điểm trung bình: \(total)"
        
        if total > 8.5 {
            if soLuongDiem1 >= 1 && soLuongDiem2 >= 2 {
                for i in 0..<soLuongDiem1 {
                    if let splitDiemMieng = diemMiengTf.text?.split(separator: ",") {
                        if Float(splitDiemMieng[i])! > Float(7.0) {
                            if let splitDiemGiuaKi = diemGiuaKiTf.text?.split(separator: ",") {
                                for j in 0..<soLuongDiem2 {
                                    if Float(splitDiemGiuaKi[j])! > Float(7.0) {
                                        loaiHSTf.text = "Loại học sinh: Xuất Sắc"
                                    }
                                }
                            }
                        } else {
                            loaiHSTf.text = "Đang trong quá trình xét điểm"
                        }
                    }
                }
            } else {
                loaiHSTf.text = "Đang trong quá trình xét điểm"
            }
        }
            
            
        else if total > 7 {
            if (diemGiuaKi * 2)/Float(soLuongDiem2 * 2) >= 8.0 && (diemCuoiKi * 3)/Float(soLuongDiem3 * 3) >= 8.0 {
                loaiHSTf.text = "Loại học sinh: Khá"
            }
        }
            
        else if total <= 7 {
            loaiHSTf.text = "Loại học sinh: Trung bình"
        }
    }
    //
    //MARK: - TextFieldDelegate validate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let characterset = CharacterSet(charactersIn: "0123456789.,")
        if string == "" {
            return true
        }
        else if string.rangeOfCharacter(from: characterset.inverted) != nil {
            return false
        }
        return true
    }
    
}

extension String
{
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
