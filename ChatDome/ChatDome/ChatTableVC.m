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

@end

@implementation ChatTableVC

- (void)viewDidLoad{
    self.title = @"建文";
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;

    self.meStr = @"hdjkashdkasjhdkasjhdkjashdjbvmnxbvnmdkhasiudhasjkdhjkashdjkashdkasjhdkasjhdkjashdjbvmnxbvnmdkhasiudhasjkdhjkas";
    self.youStr = @"hdjkashdkasjhdkasjhdkjashdjbvmnxbvnmdkhasiudhasjkdhjkashdjkashdkasjhdkasjhdkjashdjbvmnxbvnmdkhasiudhasjkdhjkashdjkashdkasjhdkasjhdkjashdjbvmnxbvnmdkhasiudhasjkdhjkashdjkashdkasjhdkasjhdkjashdjbvmnxbvnmdkhasiudhasjkdhjkas";
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2 == 0) {
        static NSString *cellString = @"chatOne";
        ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellString];
        if (!cell) {
            cell = [[ChatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellString StyleInt:t_YouCell];
        }
        cell.chatString = self.youStr;
        cell.date = [NSDate date];
        return cell;
    }else{
        static NSString *cellOneString = @"chatTow";
        ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellOneString];
        if (!cell) {
            cell = [[ChatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellOneString StyleInt:t_MeCell];
        }
        cell.chatString = self.meStr;
        cell.date = [NSDate date];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row % 2 == 0) {
        return [ChatTableViewCell addChatTableViewCellHeightString:self.youStr];
    }
    
    return  [ChatTableViewCell addChatTableViewCellHeightString:self.meStr];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
