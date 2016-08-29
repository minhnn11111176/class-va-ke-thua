//
//  main.m
//  BT
//
//  Created by Nguyen Ngoc Minh on 8/26/16.
//  Copyright © 2016 Nguyen Ngoc Minh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Student+Extend.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Khởi tạo ban đầu
        NSLog(@"KHOI TAO BAN DAU!");
        Student *student = [[Student alloc] initWithMaSo:@"sv1" ho:@"Nguyen" ten:@"Ly" toan:8 ly:9 hoa:10 gioiTinh:@"Nam" ntns:@"23/4/1990"];
        [student diemTrungBinhSV];
        [student xepLoaiSV];
        NSLog(@"%@", [student description]);
        
        
        //Tạo danh sách n sinh vien
        [student createSV];
        
        
        //In thông tin danh sách sinh viên
        NSLog(@"DANH SACH SINH VIEN!");
        for (int i = 0; i < [student.mangSV count]; i ++) {
            [student.mangSV[i] diemTrungBinhSV];
            [student.mangSV[i] xepLoaiSV];
            NSLog(@"%@", [student.mangSV[i] description]);
        }
        
        
        //Tìm sinh viên có điểm trung bình cao nhất
        NSLog(@"SINH VIEN CO DIEM TRUNG BINH CAO NHAT!");
        Student *SVCoDTBCaoNhat = [student SVCoDTBCaoNhat:student.mangSV];
        NSLog(@"%@",[SVCoDTBCaoNhat description]);
        
        
//        //In thông tin danh sách sinh viên sau khi tăng 0.5 điểm
//        NSLog(@"DIEM DUOI 5 SAU KHI TANG 0.5!");
//        [student tangDiem:student.mangSV];
//        for (int i = 0; i < [student.mangSV count]; i ++) {
//            [student.mangSV[i] diemTrungBinhSV];
//            NSLog(@"%@", [student.mangSV[i] description]);
//        }
        
        //
        NSLog(@"NU CO DTB CAO NHAT");
        Student *stdNu = (Student*)[student nuCoDTBCaoNhat:student.mangSV];
        NSLog(@"\n%@ %@: %.2f", stdNu.ho, stdNu.ten, stdNu.dtb);
        
        //
        NSLog(@"NAM CO DIEM TOAN CAO NHAT");
        Student *stdNam = (Student*)[student namCoDiemToanCaoNhat:student.mangSV];
        NSLog(@"\n%@ %@: %.2f", stdNam.ho, stdNam.ten, stdNam.toan);
    }
    return 0;
}
