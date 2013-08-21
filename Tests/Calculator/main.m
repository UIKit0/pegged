//
//  main.m
//  pegged
//
//  Created by Matt Diephouse on 12/17/09.
//  This code is in the public domain.
//
#import "Calculator.h"
#import "CalcParser.h"

int main (int argc, const char * argv[])
{
    if (argc != 2)
        return 1;
    
    @autoreleasepool {
    
        NSError *error = nil;
        NSString *file     = [NSString stringWithUTF8String:argv[1]];
        NSString *contents = [[NSString alloc] initWithContentsOfFile: file
                                                             encoding: NSUTF8StringEncoding
                                                                error: &error];
        
        NSNumberFormatter *formatter = [NSNumberFormatter new];
        
        BOOL hadError = NO;
        NSUInteger line = 1;
        for (NSString *equation in [contents componentsSeparatedByString:@"\n"])
        {
            NSArray  *parts      = [equation componentsSeparatedByString:@"="];
            NSString *expression = [parts objectAtIndex:0];
            NSNumber *result     = [formatter numberFromString:[parts lastObject]];
            
            Calculator *calculator = [Calculator new];
            CalcParser *parser     = [CalcParser new];
            parser.calculator = calculator;
            BOOL retval = [parser parseString:expression result:NULL];
            if (!retval || ![result isEqualToNumber:calculator.result])
            {
                NSString *output = [NSString stringWithFormat:@"%@:%lu: error: %@!=%@ (== %@)", file, line, expression, result, calculator.result];
                fprintf(stderr, "%s", [output UTF8String]);
                hadError = YES;
            }
            line++;
        }
        
        
        
        return hadError;
    }
}
