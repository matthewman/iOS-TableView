//
//  ViewController.m
//  iOS-TableView
//
//  Created by Matthew Man on 6/3/2017.
//  Copyright © 2017年 MatthewApp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.greekLetters = @[@"ANCDSGDS",@"tESTING",@"SDGSDG",@"rkgns",@"iurthjiustr",@"rgergj",@"apple",@"orange",@"iphone"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//number of rows for that section
- (NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.greekLetters count];
}


//make a cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //key for the cells
    NSString *simpleIdentifier = @"SimpleIdentifier";
    
    //an object of the cell. Only use memory for those near those viewing cells.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleIdentifier];
    
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleIdentifier];
    }
    
    //get the image
    UIImage *loadImage = [UIImage imageNamed:@"android.jpg"];
    //assign image to the cell
    cell.imageView.image = loadImage;
    
    //assign the value from the array to the cell
    cell.textLabel.text = self.greekLetters[indexPath.row];
    
    //set font size
    cell.textLabel.font = [UIFont boldSystemFontOfSize:30];
    
    
    //need to change initWithStyle so that it supports the detail.
    //UITableViewCellStyleDefault does not show detail.
    //Need to use UITableViewCellStyleSubtitle(detail below) or
    //UITableViewCellStyleValue1(detail on right) or
    //UITableViewCellStyleValue2 (on middle, but image will not be shown)
    if (indexPath.row < 3)
    {
        cell.detailTextLabel.text = @"First 3";
    }
    else
    {
        cell.detailTextLabel.text = @"more than 3";
    }
    
    return cell;
}

//set indentation
-(NSInteger) tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //no indentation for first 3 rows, others indent 2 space
    if(indexPath.row<3)
    {
        return 0;
    }
    else
    {
        return 2;
    }
}

//set which row can be selected
-(NSIndexPath*) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //disabling selection to row 0
    if(indexPath.row == 0)
    {
        return nil;
    }
    else
    {
        return indexPath;
    }
}

//action to perform after selecting a row
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *rowValue = self.greekLetters[indexPath.row];
    NSString *myMessage = [[NSString alloc] initWithFormat:@"You selected %@",rowValue];
    
    //UIAlertController to show pop up alert
    //preferredStyle:UIAlertControllerStyleAlert show in middle
    //preferredStyle:UIAlertControllerStyleActionSheet show from bottom
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Row selected"
                                                                   message: myMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"YES"
                                                            style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    //deselect the selected row
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//set row height
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

@end
