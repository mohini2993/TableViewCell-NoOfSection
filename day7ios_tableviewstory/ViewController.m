//
//  ViewController.m
//  day7ios_tableviewstory
//
//  Created by Student 01 on 12/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.friendsArray=@[@"Mohini",@"Pranjal",@"Kishori",@"Madhura",@"Aniket"];
    self.imageArray=@[@"ferrari.jpeg",@"bmw.jpeg",@"r1.jpeg",@"audi.jpeg",@"ducati.jpeg"];
    self.studentArray=@[@"Mitali",@"Nayana",@"Bhavana",@"Ketan",@"Sagar"];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    {
        if(self.friendsArray.count >0)
       
        return self.friendsArray.count;
     else
            return 0;
    }
    else
    {
    if(self.studentArray)
        
        return self.studentArray.count;
        else
            return 0;
        
     }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
   
    
    // cell.textLabel.text=@"test!!!!";
   // cell.textLabel.text=[self.friendsArray ]
    if(indexPath.section==0)
    {
        UIScrollView *scroll=[[UIScrollView alloc]init];
       cell.accessoryType=  UITableViewCellAccessoryDetailDisclosureButton;
       cell.textLabel.text=[self.friendsArray objectAtIndex:indexPath.row];
       cell.detailTextLabel.text=@"Friend";
        [scroll addSubview:cell];
    
    }
    else
    {
        UISwitch *switch1=[[UISwitch alloc]init];
       [switch1 addTarget:self action:@selector(switchPressed:) forControlEvents:UIControlEventValueChanged];
         cell.accessoryView=switch1;
        UIScrollView *scroll=[[UIScrollView alloc]init];
        
        cell.textLabel.text=[self.studentArray objectAtIndex:indexPath.row];
        switch1.accessibilityLabel=cell.textLabel.text;
        cell.detailTextLabel.text=@"Student";
            [scroll addSubview:cell];
    }
    UIImage *image=[UIImage imageNamed:[self.imageArray objectAtIndex:indexPath.row]];
    cell.imageView.image=image;
    return  cell;
    
}
-(void)switchPressed:(UISwitch *)sender
{
    UISwitch *localSwitch=sender;

     if(localSwitch.isOn==YES)
     {
         
         nextViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"nextViewController"];
         nvc.name1=sender.accessibilityLabel;
         [self.navigationController pushViewController:nvc animated:YES];
         

     }
     else
     {
         NSLog(@"Switch is Off");
     }
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    NSString *selectedName=cell.textLabel.text;
    NSLog(@"Selected Name: %@",selectedName);
    
    //navigation controller....
    nextViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"nextViewController"];
    nvc.name1=selectedName;
    [self.navigationController pushViewController:nvc animated:YES];
    
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    NSString *selectedName=cell.textLabel.text;
 //  NSLog(@"Selected Name: %@",selectedName);
    
    //navigation controller....
    nextViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"nextViewController"];
    nvc.name1=selectedName;
    [self.navigationController pushViewController:nvc animated:YES];
    
    
    
}
//footer section
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    UIView *footerView=[[UIView alloc]init];
    UIImageView *myimageView=[[UIImageView alloc]init];
    myimageView.image=[UIImage imageNamed:@"Blueberry.jpeg"];
    myimageView.frame=CGRectMake(10, 5, 60, 40);
    footerView.backgroundColor=[UIColor colorWithRed:5 green:0 blue:0 alpha:0.8];
    [footerView addSubview:myimageView];
        return footerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}
//Header section
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   
    UIView *headerView=[[UIView alloc]init];
    UIImageView *myimageView=[[UIImageView alloc]init];
    myimageView.image=[UIImage imageNamed:@"Blueberry.jpeg"];
    myimageView.frame=CGRectMake(10, 5, 60, 40);
    headerView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:5 alpha:0.8];
    [headerView addSubview:myimageView];
    return headerView;
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
