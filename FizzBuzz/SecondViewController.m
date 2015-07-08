//
//  SecondViewController.m
//  FizzBuzz
//
//  Created by Bhanu Birani on 02/07/15.
//  Copyright (c) 2015 Bhanu Birani. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma TableView Delegate/Datasource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"data_cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"data_cell"];
    }
    
    NSInteger cellIndex = indexPath.row + 1;
    NSString *titleString;
    if ((cellIndex % 3 == 0) && (cellIndex % 5 == 0)) {
        titleString = @"Fizz Buzz";
    } else if (cellIndex % 3 == 0) {
        titleString = @"Fizz";
    } else if (cellIndex % 5 == 0) {
        titleString = @"Buzz";
    } else {
        titleString = [NSString stringWithFormat:@"%ld", (long)cellIndex];
    }
    
    cell.textLabel.text = titleString;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
