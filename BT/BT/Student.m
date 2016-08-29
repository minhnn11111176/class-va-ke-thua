//
//  Student.m
//  BT
//
//  Created by Nguyen Ngoc Minh on 8/26/16.
//  Copyright © 2016 Nguyen Ngoc Minh. All rights reserved.
//

#import "Student.h"
#import "Student+Extend.h"

@implementation Student

- (id)initWithMaSo:(NSString *)maSo ho:(NSString *)ho ten:(NSString*)ten toan:(float)toan ly:(float)ly hoa:(float)hoa gioiTinh:(NSString*)gt ntns:(NSString *)ntns {
    self = [super init];
    if (self) {
        self.maSo = maSo;
        self.ho = ho;
        self.ten = ten;
        self.toan = toan;
        self.ly = ly;
        self.hoa = hoa;
        self.gioiTinh = gt;
        self.NTNS = ntns;
        self.mangSV = [[NSMutableArray<Student*> alloc ]init];
    }
    return self;
}

- (void)diemTrungBinhSV {
    self.dtb = (self.toan + self.ly + self.hoa)/3;    
}

- (void)xepLoaiSV {
    if (self.dtb >= 8) {
        self.xepLoai = @"Loai Gioi";
    } else if (self.dtb >= 6.5 && self.dtb < 8) {
        self.xepLoai = @"Loại Khá";
    } else if (self.dtb >= 5 && self.dtb < 6.5) {
        self.xepLoai = @"Loại Trung Bình";
    } else if (self.dtb >= 3.5 && self.dtb < 5) {
        self.xepLoai = @"Loại Yếu";
    } else {
        self.xepLoai = @"Loại Kém";
    }
}

- (void)createSV {
    int soLuongSV;
    
    self.mangSV = [[NSMutableArray alloc] init];
    NSLog(@"Nhap so luong SV: ");
    scanf("%d", &soLuongSV);
    for(int i = 0; i < soLuongSV; i ++) {
        Student *student = [[Student alloc] init];
        
        NSLog(@"Nhap ma so: ");
        char cMaSo[10];
        scanf("%s", cMaSo);
        student.maSo = [NSString stringWithCString:cMaSo encoding:1];
        
        NSLog(@"Nhap gioi tinh (Nam hoac Nu): ");
        char cGioiTinh[10];
        scanf("%s", cGioiTinh);
        student.gioiTinh = [NSString stringWithCString:cGioiTinh encoding:1];
        
        NSLog(@"Nhap NTNS: ");
        int ngay, thang, nam;
        scanf("%d\%d\%d", &ngay, &thang, &nam);
        student.NTNS = [NSString stringWithFormat:@"%d/%d/%d",ngay, thang, nam];
        
        NSLog(@"Nhap ho: ");
        char cHo[10];
        scanf("%s", cHo);
        student.ho = [NSString stringWithCString:cHo encoding:1];
        
        NSLog(@"Nhap ten: ");
        char cTen[10];
        scanf("%s", cTen);
        student.ten = [NSString stringWithCString:cTen encoding:1];
        
        NSLog(@"Nhap diem toan: ");
        float diem;
        scanf("%f", &diem);
        student.toan = diem;

        NSLog(@"Nhap diem ly: ");
        scanf("%f", &diem);
        student.ly = diem;
        
        NSLog(@"Nhap diem hoa: ");
        scanf("%f", &diem);
        student.hoa = diem;
        [self.mangSV addObject:student];
    }
}

- (Student *)SVCoDTBCaoNhat:(NSMutableArray<Student *> *)mangSV {
    Student *student = [[Student alloc] init];
    NSUInteger index = 0;
    float dtb = mangSV[index].dtb;
    for (int i = 0; i < [mangSV count]; i ++) {
        if (dtb < mangSV[i].dtb) {
            dtb = mangSV[i].dtb;
            index = i;
        }
    }
    student = mangSV[index];
    return student;
}

- (void)tangDiem:(NSMutableArray<Student *> *)students {
    for (int i = 0; i < [students count]; i ++) {
        if (students[i].toan < 5) {
            students[i].toan += 0.5;
        }
        if (students[i].ly < 5) {
            students[i].ly += 0.5;
        }
        if (students[i].hoa < 5) {
            students[i].hoa += 0.5;
        }
    }
}


- (NSString *)description {
    return [NSString stringWithFormat:@"\nMa So: %@ \nHo va Ten: %@ %@\nGioi tinh: %@\nNgay Thang Nam Sinh: %@\nDiem toan: %.2f\nDiem ly: %.2f\nDiem hoa: %.2f\nDTB: %.2f\nXep Loai: %@",self.maSo, self.ho, self.ten, self.gioiTinh, self.NTNS, self.toan, self.ly, self.hoa, self.dtb, self.xepLoai];
}
@end
