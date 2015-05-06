//
//  Resources.h
//  BPcontrol
//
//  Created by Adrian Carrera on 26/4/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#define BPcontrol_Resources_h
#ifndef Resources_h
#define Resources_h

#ifdef DEBUG
#define DLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DLog( s, ... )
#endif

#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define GRAYBP RGB(212,212,212)
#define GRAYMENUCELL RGB(236,236,236)
#define MENUSEPARATOR RGB(157,156,156)
#define MENUTEXT RGB(77,94,110)
#define CELLHEADER RGB(234,234,234)
#define GRAYPROFILE RGB(108,108,108)
#define ORANGEBUTTON RGB(255,108,82)

//#define STRTRAD(key, comment) NSLocalizedStringFromTable(key, [LanguageController getCurrentLanguage], comment)
#define STRTRAD(key, comment) comment

// Return nil when __INDEX__ is beyond the bounds of the array
#define NSArrayObjectMaybeNil(__ARRAY__, __INDEX__) ((__INDEX__ >= [__ARRAY__ count]) ? nil : [__ARRAY__ objectAtIndex:__INDEX__])

// Manually expand an array into an argument list
#define NSArrayToVariableArgumentsList(__ARRAYNAME__)\
NSArrayObjectMaybeNil(__ARRAYNAME__, 0),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 1),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 2),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 3),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 4),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 5),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 6),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 7),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 8),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 9),\
nil

#define FONT(fname,fsize) [UIFont fontWithName:fname size:fsize]

#define FORTE              @"Forte"
#define ROBOTOREGULAR      @"Roboto-Regular"
#define ROBOTOBOLD         @"Robot-Bold"
#define ROBOTOITALIC       @"Roboto-Italic"

#define FORTE_FONT(fsize) FONT(FORTE, fsize)
#define ROBOTOREGULAR_FONT(fsize) FONT(ROBOTOREGULAR, fsize)
#define ROBOTOBOLD_FONT(fsize) FONT(ROBOTOBOLD, fsize)
#define ROBOTOITALIC_FONT(fsize) FONT(ROBOTOITALIC_FONT, fsize)

#define URL_FACEBOOK     @"https://www.facebook.com/"
#define URL_FACEBOOK_APP @"fb://profile/107718629298104"
#define URL_TWITTER      @"https://twitter.com/"
#define URL_INSTAGRAM    @"http://instagram.com//"
#define URL_GOOGLEPLUS   @"https://plus.google.com/"

#endif
