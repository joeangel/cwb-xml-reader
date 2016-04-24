//
//  ViewController.m
//  cwb-xml-reader
//
//  Created by Live on 2016/4/24.
//  Copyright © 2016年 Live. All rights reserved.
//

#import "ViewController.h"
#import "XMLReader.h"

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /****************************** way 1 ******************************/
    NSLog(@"[Way1] Read from XML String");
    
    NSString *xmlString1 = @"<items><item id=\"0001\" type=\"donut\"><name>Cake</name><ppu>0.55</ppu><batters><batter id=\"1001\">Regular</batter><batter id=\"1002\">Chocolate</batter><batter id=\"1003\">Blueberry</batter></batters><topping id=\"5001\">None</topping><topping id=\"5002\">Glazed</topping><topping id=\"5005\">Sugar</topping></item></items>";
    
    // display test.xml file content
    NSLog(@"[Way1] xmlString: %@", xmlString1);
    
    // do XMLReader
    NSError *parseError1 = nil;
    NSDictionary *xmlDictionary1 = [XMLReader dictionaryForXMLString:xmlString1 error:&parseError1];
    
    // Print the dictionary after doing XMLReader
    NSLog(@"[Way1] xmlDictionary: %@", xmlDictionary1);


    
    /****************************** way 2 ******************************/
    NSLog(@"[Way2] Read from a XML file: test.xml");
    
    // get a reference to our file
    NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:@"/test" ofType:@"xml"];
    NSLog(@"[Way2] File Path: %@", xmlFilePath);
    
    // read the contents into a string
    NSString *xmlString2 = [[NSString alloc]initWithContentsOfFile:xmlFilePath encoding:NSUTF8StringEncoding error:nil];
    
    // display test.xml file content
    NSLog(@"[Way2] xmlDictionary: %@", xmlString2);
    
    // do XMLReader
    NSError *parseError2 = nil;
    NSDictionary *xmlDictionary2 = [XMLReader dictionaryForXMLString:xmlString2 error:&parseError2];
    
    // Print the dictionary after doing XMLReader
    NSLog(@"[Way2] xmlDictionary: %@", xmlDictionary2);

    
    /****************************** way 3 ******************************/
    NSLog(@"[Way3] Read from a URL Path");
    
    // get a reference
    NSURL *xmlUrlPath = [NSURL URLWithString:@"http://222.73.161.212/ispace2/servlet/com.lemon.xml.XmlAction"];
    NSLog(@"[Way3] URL Path: %@", xmlUrlPath);
    
    // read the contents from a URL into a string
    NSString *xmlString3 = [[NSString alloc]initWithContentsOfURL:xmlUrlPath encoding:NSUTF8StringEncoding error:nil];
    
    // display test.xml file content
    NSLog(@"[Way3] xmlDictionary: %@", xmlString3);
    
    // do XMLReader
    NSError *parseError3 = nil;
    NSDictionary *xmlDictionary3 = [XMLReader dictionaryForXMLString:xmlString3 error:&parseError3];
    
    // Print the dictionary after doing XMLReader
    NSLog(@"[Way3] xmlDictionary: %@", xmlDictionary3);
    
    // Get the first value: questions.question.title
    NSLog(@"[Way3] get the first value: questions.question.title");
    
    NSDictionary *dictQuestions = [xmlDictionary3 objectForKey: @"questions"];
    NSLog(@"[Way3] dictQuestions: %@" , dictQuestions);
    
    NSDictionary *dictQuestion = [dictQuestions objectForKey: @"question"];
    NSLog(@"[Way3] dictQuestion: %@" , dictQuestion);
    
    // using array bacuse there are many key "question" in dictQuestion
    NSArray *arrQuestion = [dictQuestions objectForKey: @"question"];
    NSLog(@"[Way3] arrQuestion: %@" , arrQuestion);
    
    NSDictionary *dictQuestion0 = [arrQuestion objectAtIndex:0];
    NSLog(@"[Way3] dictQuestion0: %@" , dictQuestion0);
    
    // get title from dictQuestion0
    NSDictionary *dictTitle = [dictQuestion0 objectForKey: @"title"];
    NSLog(@"[Way3] dictTitle: %@" , dictTitle);

    // get text from strTitle
    NSString *strText = [dictTitle objectForKey: @"text"];
    NSLog(@"[Way3] strText: %@" , strText);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
