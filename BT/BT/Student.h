//
//  Student.h
//  BT
//
//  Created by Nguyen Ngoc Minh on 8/26/16.
//  Copyright © 2016 Nguyen Ngoc Minh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (strong, nonatomic) NSString* maSo;
@property (strong, nonatomic) NSString* ho;
@property (strong, nonatomic) NSString* ten;
@property float toan;
@property float ly;
@property float hoa;
@property float dtb;
@property (strong, nonatomic) NSString* xepLoai;

//1/ Vẫn về 01 class sinh viên, qua quá trình sử dụng giờ,
//tăng thêm một số thuộc tính và chức năng
//- Giới tính, NTNS
@property (strong) NSString* gioiTinh;
@property (strong) NSString* NTNS;

@property (strong, nonatomic) NSMutableArray<Student*>* mangSV;

- (id)initWithMaSo:(NSString*)maSo ho:(NSString*)ho ten:(NSString*)ten toan:(float)toan ly:(float)ly hoa:(float)hoa gioiTinh:(NSString*)gt ntns:(NSString*)ntns;
- (void)diemTrungBinhSV;
- (void)xepLoaiSV;


- (void)createSV;

- (Student*)SVCoDTBCaoNhat:(NSMutableArray<Student*>*)mangSV;


- (void)tangDiem:(NSMutableArray<Student*>*)students;

@end
