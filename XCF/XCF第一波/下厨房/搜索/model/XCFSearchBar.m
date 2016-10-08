//
//  XCFSearchBar.m
//  XCF第一波
//
//  Created by admin on 16/9/18.
//  Copyright © 2016年 可可. All rights reserved.
//

#import "XCFSearchBar.h"

@implementation XCFSearchBar

+(XCFSearchBar *)searchBarWithPlaceholder:(NSString *)placeholder{
    
    XCFSearchBar *searchBar=[[XCFSearchBar alloc]init];
    
    searchBar.delegate=searchBar;
    
    searchBar.placeholder=placeholder;
    
    searchBar.tintColor=XCFSearchBarTintColor;
    
    [searchBar setImage:[UIImage imageNamed:@"searchIcon"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    
    UIView *searchBar1=searchBar.subviews[0];
    
    for (UIView *view in searchBar1.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
            [view setBackgroundColor:RGB(247, 247, 240)];
        }
        if ([view isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [view removeFromSuperview];
        }
    }
    return searchBar;
}


-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    !self.SearchBarShouldEditingBlock ?:self.SearchBarShouldEditingBlock();
    return YES;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    !self.SearchBarTextDidChangedBlock ?:self.SearchBarTextDidChangedBlock();
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    !self.SearchBarTextDidSearchBlock ?:self.SearchBarTextDidSearchBlock();
    NSLog(@"已经搜索过了");
}















@end
