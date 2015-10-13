//
//  ChatTableVC.m
//  ChatDome
//
//  Created by 童浩 on 15/10/9.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "ChatTableVC.h"
#import "ChatTableViewCell.h"

@interface ChatTableVC()

@property (nonatomic,copy)NSString *meStr;

@property (nonatomic,copy)NSString *youStr;

@property (nonatomic,strong)NSMutableArray *chatArray;
@property (nonatomic,strong)NSMutableArray *dateArray;

@end

@implementation ChatTableVC

- (void)viewDidLoad{
    self.title = @"建文";
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.chatArray = [NSMutableArray array];
    self.dateArray = [NSMutableArray array];
    for (int i = 0; i < 29; i++) {
        NSString *str = @"  建设的借口哈速度加快哈萨克记得哈大家哈市了到了卡上的哈建设的借口哈速度加快哈萨克记得哈大家哈市了到了卡上的哈建设的借口哈速度加快哈萨克记得哈大家哈市了到了卡上的哈建设的借口哈速度加快哈萨克记得哈第三大uwqieoiuodhjkshdqwujkdshasjkdhqowihd多久啊时刻记得多久啊开始登记卡上的金卡是的哦气温降低开始正常只能，没打算呢打你卡上你的卡";
        NSInteger s = arc4random() % (str.length - 1) + 1;
        NSString *string = [str substringToIndex:s];
        [self.chatArray addObject:string];
        NSDate *date = [NSDate date];
        [self.dateArray addObject:date];
    }
    [self.chatArray addObject:@""];
    NSDate *date = [NSDate date];
    [self.dateArray addObject:date];
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.chatArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2 == 0) {
        static NSString *cellString = @"chatOne";
        ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellString];
        if (!cell) {
            cell = [[ChatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellString StyleInt:t_YouCell];
        }
        cell.chatString = self.chatArray[indexPath.row];
        cell.date = self.dateArray[indexPath.row];
        cell.userImageView.image = [UIImage imageNamed:@"image9.jpg"];
        return cell;
    }else{
        static NSString *cellOneString = @"chatTow";
        ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellOneString];
        if (!cell) {
            cell = [[ChatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellOneString StyleInt:t_MeCell];
        }
        cell.chatString = self.chatArray[indexPath.row];
        cell.date = self.dateArray[indexPath.row];
        cell.userImageView.image = [UIImage imageNamed:@"image7.jpg"];
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  [ChatTableViewCell addChatTableViewCellHeightString:self.chatArray[indexPath.row]] + 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
