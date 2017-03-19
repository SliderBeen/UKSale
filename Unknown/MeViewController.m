//
//  MeViewController.m
//  Unknown
//
//  Created by 荣刚 on 17/3/19.
//  Copyright © 2017年 荣刚. All rights reserved.
//

#import "MeViewController.h"
#import "Constant.h"
#import "PersonCenterHeaderCell.h"
#import "PersonCenterCell.h"

@interface MeViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong)NSMutableArray  *dataArray;

@end

@implementation MeViewController {
    CGRect oldFrame;
    UIImageView *fullScreenIV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerNib:[UINib nibWithNibName:@"PersonCenterHeaderCell" bundle:nil] forCellReuseIdentifier:@"PersonCenterHeaderCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"PersonCenterCell" bundle:nil] forCellReuseIdentifier:@"PersonCenterCell"];
    
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark
#pragma mark numberOfSections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section) {
        NSArray *rowArray = self.dataArray[section-1];
        return rowArray.count;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        PersonCenterHeaderCell *headerCell = [tableView dequeueReusableCellWithIdentifier:@"PersonCenterHeaderCell"];
        headerCell.selectionStyle  = UITableViewCellSelectionStyleNone;
        headerCell.avatarIV.userInteractionEnabled = YES;
        UITapGestureRecognizer *fullScreenTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapForFullScreen:)];
        [headerCell.avatarIV addGestureRecognizer:fullScreenTap];
        headerCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return headerCell;
    }else{
        
        PersonCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCenterCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.section==2) {//我的好友
            
            switch (indexPath.row) {
                case 0:
                    cell.titleIV.image = [UIImage imageNamed:@"ff_IconShowAlbum"];
                    cell.titleLabel.text = @"相册";
                    break;
                case 1:
                    cell.titleIV.image = [UIImage imageNamed:@"MoreMyFavorites"];
                    cell.titleLabel.text = @"收藏";
                    break;
                case 2:
                    cell.titleIV.image = [UIImage imageNamed:@"MoreMyBankCard"];
                    cell.titleLabel.text = @"钱包";
                    break;
                case 3:
                    cell.titleIV.image = [UIImage imageNamed:@"MyCardPackageIcon"];
                    cell.titleLabel.text = @"卡券";
                    break;
                    
                default:
                    break;
            }
            
        }else if (indexPath.section==3){//设置
            cell.titleIV.image = [UIImage imageNamed:@"MoreExpressionShops"];
            cell.titleLabel.text = @"表情";
            
        }else if(indexPath.section==4){
            cell.titleIV.image = [UIImage imageNamed:@"MoreSetting"];
            cell.titleLabel.text = @"设置";
        }
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section) {
        return 42;
    }
    return 82;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section) {
        return 20;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return kAlmostZero;
}

-(void)tapForOriginal:(UITapGestureRecognizer *)tap{
    [UIView animateWithDuration:0.3 animations:^{
        fullScreenIV.frame = oldFrame;
        fullScreenIV.alpha = 0.03;
    } completion:^(BOOL finished) {
        fullScreenIV.alpha = 1;
        [fullScreenIV removeFromSuperview];
        
    }];
}
-(void)tapForFullScreen:(UITapGestureRecognizer *)tap{
    UIImageView *avatarIV = (UIImageView *)[tap view];
    oldFrame = [avatarIV convertRect:avatarIV.bounds toView:[UIApplication sharedApplication].keyWindow];
    if (fullScreenIV==nil) {
        fullScreenIV= [[UIImageView alloc]initWithFrame:avatarIV.frame];
    }
    fullScreenIV.backgroundColor = [UIColor blackColor];
    fullScreenIV.userInteractionEnabled = YES;
    fullScreenIV.image = avatarIV.image;
    fullScreenIV.contentMode = UIViewContentModeScaleAspectFit;
    [[UIApplication sharedApplication].keyWindow addSubview:fullScreenIV];
    
    [UIView animateWithDuration:0.3 animations:^{
        fullScreenIV.frame = CGRectMake(0,0,kScreenWidth, kScreenHeight);
    }];
    UITapGestureRecognizer *originalTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapForOriginal:)];
    [fullScreenIV addGestureRecognizer:originalTap];
    
}

#pragma mark - setter and getter
- (NSMutableArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray = [NSMutableArray arrayWithObjects:
                      @[@{@"title":@"文明",@"icon":@"MoreExpressionShops"}],
                      @[@{@"title":@"相册",@"icon":@"ff_IconShowAlbum"},@{@"title":@"收藏",@"icon":@"MoreMyFavorites"},@{@"title":@"钱包",@"icon":@"MoreMyBankCard"},@{@"title":@"卡券",@"icon":@"MyCardPackageIcon"}],
                      @[@{@"title":@"表情",@"icon":@"MoreExpressionShops"}],
                      @[@{@"title":@"设置",@"icon":@"MoreSetting"}], nil];
    }
    return _dataArray;
}


@end
